pragma Ada_2022;
with Share;        use Share;
with Types;        use Types;
with fec_h;        use fec_h;
with Interfaces.C; use Interfaces.C;
with Ada.Streams.Stream_IO;
with Ada.Text_IO;

package body Decoder is
   procedure Decode_File (File_URI : URI; Share_Names : Share_Name_Array) is
      use Interfaces;
      Shares           : Share_Access_Array (1 .. Share_Names'Length);
      Primary_Blocks_N : Natural := 0;

      Share_Numbers : Share_Number_Array (1 .. Share_Names'Last);

      Decoder : constant access fec_t :=
        fec_new
          (Interfaces.C.unsigned_short (File_URI.Needed_Shares),
           Interfaces.C.unsigned_short (File_URI.Total_Shares));

      Temporary_Share : Share_Access;
   begin
      for Index in Share_Names'Range loop
         Shares (Index) := Read_Share (To_String (Share_Names (Index)));
      end loop;
      Share.Sort (Shares);

      -- We need a second identical loop here to not mess up the primary block calculation
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
         Decode_Block
           (Decoder          => Decoder, Shares => Shares,
            Share_Numbers    => Share_Numbers,
            Primary_Blocks_N => Primary_Blocks_N, Last => False,
            Needed_Shares    => Shares (1).URI_Extension_Block.Needed_Shares);
      end loop;
      Decode_Block
        (Decoder => Decoder, Shares => Shares, Share_Numbers => Share_Numbers,
         Primary_Blocks_N => Primary_Blocks_N, Last => True,
         Needed_Shares    => Shares (1).URI_Extension_Block.Needed_Shares);
   end Decode_File;

   procedure Decode_Block
     (Decoder       :        access fec_t; Shares : in out Share_Access_Array;
      Share_Numbers : in out Share_Number_Array; Primary_Blocks_N : Natural;
      Last          :        Boolean; Needed_Shares : Share_Count)
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
      Temporary_Block           : Block_Access;
   begin
      for J in 1 .. Integer (Needed_Shares) loop
         Decoding_Blocks (J) := Next_Block (Shares (J));
         Result_Blocks (J)   := new Block (1 .. Decoding_Blocks (J)'Length);
      end loop;
      Decoding_Blocks_Addresses := Convert_To_Address_Array (Decoding_Blocks);
      Result_Block_Addresses    := Convert_To_Address_Array (Result_Blocks);
      if not Last then
         Block_Size :=
           (Shares (1).URI_Extension_Block.Codec_Params.Segment_Size /
            Interfaces.Unsigned_64 (Needed_Shares));
      else
         Block_Size :=
           (Shares (1).URI_Extension_Block.Tail_Codec_Params.Segment_Size +
            Interfaces.Unsigned_64 (Needed_Shares)) /
           Interfaces.Unsigned_64 (Needed_Shares);
      end if;
      Ada.Text_IO.Put_Line (Block_Size'Image);
      Ada.Text_IO.Put_Line (Share_Numbers'Image);
      fec_decode
        (Decoder, Decoding_Blocks_Addresses'Address,
         Result_Block_Addresses'Address,
         Share_Numbers (Share_Numbers'First)'Access, Block_Size);
      if Primary_Blocks_N = Natural (Needed_Shares) then
         Output_Blocks := Decoding_Blocks;
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
         use Ada.Streams.Stream_IO;
         F         : File_Type;
         S         : Stream_Access;
         File_Name : constant String := "output.dat";
         Padding_N : Natural;
      begin
         if not Last then
            Padding_N :=
              Natural
                (Word_64 (Block_Size) -
                 Shares (1).Data_Header.Block_Size / 4 * 4);
         else
            --  We calculate the padding by getting the leftover
            Padding_N := Natural (Block_Size / 4 - (Block_Size / 16 * 4));
         end if;

         Open (F, Append_File, File_Name);
         S := Stream (F);
         for I in 1 .. Integer (Needed_Shares) - 1 loop
            Write_Block (S, Output_Blocks (I), Padding => Padding_N);
         end loop;
         Write_Block
           (S, Output_Blocks (Output_Blocks'Last), Padding => Padding_N);

         Close (F);
      end;
   end Decode_Block;
end Decoder;
