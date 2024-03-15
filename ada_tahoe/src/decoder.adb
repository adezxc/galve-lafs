pragma Ada_2022;
with Share;        use Share;
with Types;        use Types;
with fec_h;        use fec_h;
with Ada.Text_IO;  use Ada.Text_IO;
with Interfaces.C; use Interfaces.C;

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
   begin
      for Index in Share_Names'Range loop
         Shares (Index) := Read_Share (To_String (Share_Names (Index)));
      end loop;
      Share.Sort (Shares);
      Put_Line (Shares (1).Header'Image);
      Put_Line (Shares (1).URI_Extension_Block'Image);
      Put_Line (Shares (1).Data_Header'Image);

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
           Shares (1).URI_Extension_Block.Tail_Codec_Params.Segment_Size /
           Interfaces.Unsigned_64 (Needed_Shares);
      end if;
      fec_decode
        (Decoder, Decoding_Blocks_Addresses'Address,
         Result_Block_Addresses'Address,
         Share_Numbers (Share_Numbers'First)'Access, Block_Size);
      if Primary_Blocks_N = Natural (Needed_Shares) then
         Result_Blocks := Decoding_Blocks;
      else
         for Index in 1 .. Primary_Blocks_N loop
            Result_Blocks (Index + 1) := Result_Blocks (Index);
            Result_Blocks (Index)     := Decoding_Blocks (Index);
         end loop;
      end if;

      declare
         use Byte_IO;
         F          : Byte_IO.File_Type;
         File_Name  : constant String := "output.dat";
         Padding_N  : Natural;
         Empty_Byte : Byte            := 0;
      begin
         if not Last then
            Padding_N :=
              Natural
                (Word_64 (Block_Size) -
                 Shares (1).Data_Header.Block_Size / 4 * 4);
         else
            Padding_N :=
              Natural
                (Block_Size -
                 Shares (1).URI_Extension_Block.Tail_Codec_Params
                     .Segment_Size /
                   Unsigned_64 (Needed_Shares));
         end if;

         Byte_IO.Open (F, Byte_IO.Append_File, File_Name);
         for I in 1 .. Integer (Needed_Shares - 1) loop
            Write_Block (F, Result_Blocks (I), Padding => Padding_N);
         end loop;
         Write_Block (F, Result_Blocks (Result_Blocks'Last), Padding => 0);
         Byte_IO.Flush (F);
         Byte_IO.Close (F);
      end;
   end Decode_Block;
end Decoder;
