pragma Ada_2022;
with Share;        use Share;
with Types;        use Types;
with fec_h;        use fec_h;
with Interfaces.C; use Interfaces.C;
with GNATCOLL;     use GNATCOLL;
with Ada.Text_IO;
with Memory_Streams;
with Aes;

package body Decoder is
   procedure Decode_File
     (File_URI      : URI; Share_Names : Share_Name_Array;
      Output_Stream : access Ada.Streams.Root_Stream_Type'Class)
   is
      use Interfaces;
      Shares           : Share_Access_Array (1 .. Share_Names'Length);
      Primary_Blocks_N : Natural := 0;

      Share_Numbers : Share_Number_Array (1 .. Share_Names'Last);

      Temporary_Share : Share_Access;

      FEC_Decoder : access fec_t;

      IV : constant Aes.IV := (others => Character'Val (0));

      Key : Aes.Key := File_URI.Key;

      AES_Decryptor : Aes.Decryptor :=
        Aes.New_Decryptor
          (CipherKey => Key, CipherIV => IV, Buffer_Size => 4_096);

      Total_Padding        : Natural;
      Block_Padding        : Natural;
      Last_Segment_Padding : Natural;
      Last_Block_Padding   : Natural;
   begin
      GNATCOLL.Mmap();
      for Index in Share_Names'Range loop
         Shares (Index) := Read_Share (To_String (Share_Names (Index)));
      end loop;
      Share.Sort (Shares);
      declare
         Block_Size       : constant Natural :=
           (Positive (Shares (1).URI_Extension_Block.Segment_Size) +
            (Positive (Shares (1).URI_Extension_Block.Needed_Shares) - 1)) /
           Positive (Shares (1).URI_Extension_Block.Needed_Shares);
         Last_Block_Size  : constant Natural :=
           (Natural
              (Shares (1).URI_Extension_Block.Tail_Codec_Params.Segment_Size) +
            (Natural (Shares (1).URI_Extension_Block.Needed_Shares) - 1)) /
           Natural (Shares (1).URI_Extension_Block.Needed_Shares);
         Block_Array_Size : Natural;
      begin
         if Shares (1).Block_Array_Size_Discr = 0 then
            Block_Array_Size := 1;
         else
            Block_Array_Size := Shares (1).Block_Array_Size_Discr + 1;
         end if;

         if Last_Block_Size mod 4 = 0 then
            Last_Block_Padding := 0;
         else
            Last_Block_Padding := (4 - Last_Block_Size mod 4);
         end if;
         if Block_Size mod 4 = 0 then
            Block_Padding := 0;
         else
            Block_Padding := (4 - Block_Size mod 4);
         end if;

         Total_Padding :=
           Natural
             (Word_64
                (Shares (1).Block_Size_Discr * 3 * 4 *
                 Shares (1).Block_Array_Size_Discr +
                 Shares (1).Last_Block.all'Length * 3 * 4) -
              File_URI.Size);

         Last_Segment_Padding :=
           Total_Padding -
           Block_Array_Size * Natural (File_URI.Needed_Shares) * Block_Padding;
      end;

      declare
         K : unsigned_short :=
           unsigned_short (Shares (1).URI_Extension_Block.Needed_Shares);
         M : unsigned_short :=
           unsigned_short (Shares (1).URI_Extension_Block.Total_Shares);
      begin
         FEC_Decoder := fec_new (K, M);
      end;

      --  The fec algorithm produces primary blocks which have the pieces of
      --  original data and secondary blocks which are encoded
      --  E.g with 10 shares total,
      --  the primary shares are numbered from 0 to 2, and the rest are
      --  secondary. The decoder expects for the primary blocks to be in the
      --  right place in the array. E.g with 3-out-of-10 needed shares,
      --  we provide [0,2,8], algorithm only needs to produce one share
      --  because 2 out of 3 primary blocks have been provided and we
      --  need to pass the shares in the order of [0,8,2] as 0th share
      --  is in the 0th position, 2nd in the 2nd, while the
      --  secondary shares can be passed in any order.
      for Index in Shares'Range loop
         if Shares (Index).Share_Number < Integer (File_URI.Needed_Shares) then
            Temporary_Share := Shares (Shares (Index).Share_Number + 1);
            Shares (Shares (Index).Share_Number + 1) := Shares (Index);
            Shares (Index)                           := Temporary_Share;
         end if;
      end loop;

      for Index in Shares'Range loop
         Share_Numbers (Index) := Shares (Index).Share_Number;
         if Share_Numbers (Index) < Integer (File_URI.Needed_Shares) then
            Primary_Blocks_N := Primary_Blocks_N + 1;
         end if;
      end loop;

      for I in 1 .. Shares (1).URI_Extension_Block.Segment_Count - 1 loop
         Decode_Segment
           (AES_Decryptor    => AES_Decryptor, FEC_Decoder => FEC_Decoder,
            Shares           => Shares, Share_Numbers => Share_Numbers,
            Primary_Blocks_N => Primary_Blocks_N, Last => False,
            Needed_Shares    => Shares (1).URI_Extension_Block.Needed_Shares,
            Output_Stream    => Output_Stream, Padding => Block_Padding);
      end loop;
      Decode_Segment
        (AES_Decryptor        => AES_Decryptor, FEC_Decoder => FEC_Decoder,
         Shares               => Shares, Share_Numbers => Share_Numbers,
         Primary_Blocks_N     => Primary_Blocks_N, Last => True,
         Needed_Shares        => Shares (1).URI_Extension_Block.Needed_Shares,
         Output_Stream        => Output_Stream, Padding => Last_Block_Padding,
         Last_Segment_Padding => Last_Segment_Padding);

      fec_free (FEC_Decoder);
   end Decode_File;

   procedure Decode_Segment
     (AES_Decryptor :        Aes.Decryptor; FEC_Decoder : access fec_t;
      Shares        : in out Share_Access_Array;
      Share_Numbers : in out Share_Number_Array; Primary_Blocks_N : Natural;
      Last          :        Boolean; Needed_Shares : Share_Count;
      Output_Stream :        access Ada.Streams.Root_Stream_Type'Class;
      Padding       :        Natural; Last_Segment_Padding : Natural := 0)
   is
      use Interfaces;
      Block_Size             : Unsigned_64;
      Decoding_Blocks, Result_Blocks,
      Output_Blocks : Block_Access_Array (1 .. Integer (Needed_Shares));
      Decoding_Blocks_Addresses,
      Result_Block_Addresses :
        Block_Address_Array (1 .. Integer (Needed_Shares));
      Segment_Size           : Unsigned_64 :=
        Shares (1).URI_Extension_Block.Codec_Params.Segment_Size;
   begin
      for J in 1 .. Integer (Needed_Shares) loop
         Decoding_Blocks (J) := Next_Block (Shares (J));
         Result_Blocks (J)   := new Block (1 .. Decoding_Blocks (J)'Length);
      end loop;
      Decoding_Blocks_Addresses := Convert_To_Address_Array (Decoding_Blocks);
      Result_Block_Addresses    := Convert_To_Address_Array (Result_Blocks);

      if not Last then
         Block_Size := (Segment_Size / Interfaces.Unsigned_64 (Needed_Shares));
      else
         Segment_Size :=
           (Shares (1).URI_Extension_Block.Tail_Codec_Params.Segment_Size);
         Block_Size := (Segment_Size / Interfaces.Unsigned_64 (Needed_Shares));
      end if;

      fec_decode
        (FEC_Decoder, Decoding_Blocks_Addresses'Address,
         Result_Block_Addresses'Address,
         Share_Numbers (Share_Numbers'First)'Access,
         Block_Size + Unsigned_64 (Padding));

      if Primary_Blocks_N = Natural (Needed_Shares) then
         Output_Blocks := Decoding_Blocks;
      elsif Primary_Blocks_N = 0 then
         Output_Blocks := Result_Blocks;
      else
         declare
            Current_Result_Block : Positive := 1;
         begin
            for Index in Share_Numbers'Range loop
               if Share_Numbers (Index) = Index - 1 then
                  Output_Blocks (Index) := Decoding_Blocks (Index);
               else
                  Output_Blocks (Index) :=
                    Result_Blocks (Current_Result_Block);
                  Current_Result_Block  := Current_Result_Block + 1;
               end if;
            end loop;
         end;
      end if;

      declare
         Memory_Buffer        :
           aliased Memory_Streams.Stream_Type
             (Ada.Streams.Stream_Element_Offset (Segment_Size));
         Memory_Buffer_Access : access Memory_Streams.Stream_Type :=
           Memory_Buffer'Access;
      begin
         for I in 1 .. Integer (Needed_Shares) - 1 loop
            Write_Block
              (Memory_Buffer_Access, Output_Blocks (I), Padding => Padding);
         end loop;
         Write_Block
           (Memory_Buffer_Access, Output_Blocks (Output_Blocks'Last),
            Padding => Padding + Last_Segment_Padding);
         Aes.Decrypt (AES_Decryptor, Memory_Buffer_Access, Output_Stream);
      end;
   end Decode_Segment;
end Decoder;
