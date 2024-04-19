pragma Ada_2022;
with Share;        use Share;
with Types;        use Types;
with fec_h;        use fec_h;
with Interfaces.C; use Interfaces.C;
with Ada.Text_IO;
with Memory_Streams;

package body Decoder is
   function New_File_Decoder (URI : Uri_Read.URI) return File_Decoder is
      IV : constant Aes.IV := (others => Character'Val (0));
      D  : File_Decoder;
   begin
      D.FEC_Decoder :=
        fec_new
          (Interfaces.C.unsigned_short (URI.Needed_Shares),
           Interfaces.C.unsigned_short (URI.Total_Shares));
      D.Decryptor   :=
        Aes.New_Decryptor
          (CipherKey => URI.Key, CipherIV => IV, Buffer_Size => 32_768);
      return D;
   end New_File_Decoder;

   procedure Decode_File
     (Decoder : File_Decoder; File_URI : URI; Share_Names : Share_Name_Array;
      Output_Stream : access Ada.Streams.Root_Stream_Type'Class)
   is
      use Interfaces;
      Shares           : Share_Access_Array (1 .. Share_Names'Length);
      Primary_Blocks_N : Natural := 0;

      Share_Numbers : Share_Number_Array (1 .. Share_Names'Last);

      Temporary_Share : Share_Access;
   begin
      for Index in Share_Names'Range loop
         Shares (Index) := Read_Share (To_String (Share_Names (Index)));
      end loop;
      Share.Sort (Shares);

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
           (Decoder          => Decoder, Shares => Shares,
            Share_Numbers    => Share_Numbers,
            Primary_Blocks_N => Primary_Blocks_N, Last => False,
            Needed_Shares    => Shares (1).URI_Extension_Block.Needed_Shares,
            Output_Stream    => Output_Stream);
      end loop;
      Decode_Segment
        (Decoder => Decoder, Shares => Shares, Share_Numbers => Share_Numbers,
         Primary_Blocks_N => Primary_Blocks_N, Last => True,
         Needed_Shares    => Shares (1).URI_Extension_Block.Needed_Shares,
         Output_Stream    => Output_Stream);
   end Decode_File;

   procedure Decode_Segment
     (Decoder       :        File_Decoder; Shares : in out Share_Access_Array;
      Share_Numbers : in out Share_Number_Array; Primary_Blocks_N : Natural;
      Last          :        Boolean; Needed_Shares : Share_Count;
      Output_Stream :        access Ada.Streams.Root_Stream_Type'Class)
   is
      use Interfaces;
      Block_Size                : Unsigned_64;
      Decoding_Blocks : Block_Access_Array (1 .. Integer (Needed_Shares));
      Result_Blocks : Block_Access_Array (1 .. Integer (Needed_Shares));
      Decoding_Blocks_Addresses :
        Block_Address_Array (1 .. Integer (Needed_Shares));
      Result_Block_Addresses    :
        Block_Address_Array (1 .. Integer (Needed_Shares));
      Output_Blocks : Block_Access_Array (1 .. Integer (Needed_Shares));
      Padding_N                 : Natural;
      Memory_Buffer             : access Memory_Streams.Stream_Type;
   begin
      Ada.Text_IO.Put_Line (Memory_Buffer.Length'Image);
      Ada.Text_IO.Put_Line (Memory_Buffer.Capacity'Image);
      for J in 1 .. Integer (Needed_Shares) loop
         Decoding_Blocks (J) := Next_Block (Shares (J));
         Result_Blocks (J)   := new Block (1 .. Decoding_Blocks (J)'Length);
      end loop;
      Decoding_Blocks_Addresses := Convert_To_Address_Array (Decoding_Blocks);
      Result_Block_Addresses    := Convert_To_Address_Array (Result_Blocks);

      if not Last then
         Memory_Buffer :=
           new Memory_Streams.Stream_Type
             (Ada.Streams.Stream_Element_Count
                (Shares (1).URI_Extension_Block.Codec_Params.Segment_Size));
         Block_Size    :=
           (Shares (1).URI_Extension_Block.Codec_Params.Segment_Size /
            Interfaces.Unsigned_64 (Needed_Shares));
      else
         Memory_Buffer :=
           new Memory_Streams.Stream_Type
             (Ada.Streams.Stream_Element_Count
                (Shares (1).URI_Extension_Block.Tail_Codec_Params
                   .Segment_Size));
         Block_Size    :=
           (Shares (1).URI_Extension_Block.Tail_Codec_Params.Segment_Size /
            Interfaces.Unsigned_64 (Needed_Shares));
      end if;

      if Block_Size mod 4 = 0 then
         Padding_N := 0;
      else
         Padding_N := Natural (4 - Block_Size mod 4);
      end if;

      fec_decode
        (Decoder.FEC_Decoder, Decoding_Blocks_Addresses'Address,
         Result_Block_Addresses'Address,
         Share_Numbers (Share_Numbers'First)'Access,
         Block_Size + Unsigned_64 (Padding_N));

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

      for I in 1 .. Integer (Needed_Shares) - 1 loop
         Write_Block (Memory_Buffer, Output_Blocks (I), Padding => Padding_N);
      end loop;
      if not Last then
         Write_Block
           (Memory_Buffer, Output_Blocks (Output_Blocks'Last),
            Padding => Padding_N);
      else
         --  It seems that there are 2 extra bytes in each of my experiments
         --  that we can pad (not 100% sure)
         Write_Block
           (Memory_Buffer, Output_Blocks (Output_Blocks'Last),
            Padding => Padding_N);
      end if;
      Aes.Decrypt (Decoder.Decryptor, Memory_Buffer, Output_Stream);
   end Decode_Segment;
end Decoder;
