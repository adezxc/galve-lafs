pragma Ada_2022;
with Share;        use Share;
with Types;        use Types;
with fec_h;        use fec_h;
with Ada.Text_IO;  use Ada.Text_IO;
with Interfaces.C; use Interfaces.C;

package body Decoder is
   procedure Decode_File (File_URI : URI; Share_Names : Share_Name_Array) is
      Shares : Share_Access_Array (1 .. Share_Names'Length);

      type Share_Number_Array is
        array (1 .. Share_Names'Length) of aliased Integer;

      Share_Numbers : Share_Number_Array;

      Decoder : constant access fec_t :=
        fec_new
          (Interfaces.C.unsigned_short (File_URI.Needed_Shares),
           Interfaces.C.unsigned_short (File_URI.Total_Shares));

      Decoding_Blocks           :
        Block_Access_Array (1 .. Integer (File_URI.Needed_Shares));
      Decoding_Blocks_Addresses :
        Block_Address_Array (1 .. Integer (File_URI.Needed_Shares));
      Result_Blocks             :
        Block_Access_Array (1 .. Integer (File_URI.Needed_Shares));
      Result_Block_Addresses    :
        Block_Address_Array (1 .. Integer (File_URI.Needed_Shares));
   begin
      for Index in Share_Names'Range loop
         Shares (Index) := Read_Share (To_String (Share_Names (Index)));
      end loop;
      Share.Sort (Shares);

      for Index in Shares'Range loop
         Share_Numbers (Index)   := Shares (Index).Share_Number;
         Decoding_Blocks (Index) := Next_Block (Shares (Index));
         Result_Blocks (Index)   :=
           new Block (1 .. Decoding_Blocks (Index)'Length);
      end loop;

      Decoding_Blocks_Addresses := Convert_To_Address_Array (Decoding_Blocks);
      Result_Block_Addresses    := Convert_To_Address_Array (Result_Blocks);
      fec_decode
        (Decoder, Decoding_Blocks_Addresses'Address,
         Result_Block_Addresses'Address,
         Share_Numbers (Share_Numbers'First)'Access,
         size_t (((Decoding_Blocks (1)'Length) * 4)));
      for B of Decoding_Blocks loop
         Put (B.all (1 .. (if B.all'Last < 3 then B.all'Last else 3))'Image);
         New_Line;
      end loop;
      Result_Blocks (3) := Result_Blocks (1);
      Result_Blocks (2) := Decoding_Blocks (2);
      Result_Blocks (1) := Decoding_Blocks (1);
      Ada.Text_IO.Put_Line ("The first few words of the decoder block:");
      for B of Result_Blocks loop
         Put (B.all (1 .. (if B.all'Last < 3 then B.all'Last else 3))'Image);
         Put (B.all'Last'Image);
         New_Line;
      end loop;
      declare
         use Word_IO;
         F         : Word_IO.File_Type;
         Byte_F    : Byte_IO.File_Type;
         File_Name : constant String := "output.dat";
         Temp      : Word            := 0;
      begin
         Create (F, Out_File, File_Name);
         for Word in
           Result_Blocks (1).all'First .. Result_Blocks (1).all'Last - 1
         loop
            Write_Little_Endian_Word (F, Result_Blocks (1).all (Word));
         end loop;
         Close (F);
         Byte_IO.Open (Byte_F, Byte_IO.Append_File, File_Name);
         Write_Little_Endian_Word_Without_Padding
           (Byte_F, Result_Blocks (1).all (Result_Blocks (1).all'Last));
         Byte_IO.Close (Byte_F);
         Open (F, Append_File, File_Name);
         for Word in
           Result_Blocks (2).all'First .. Result_Blocks (2).all'Last - 1
         loop
            Write_Little_Endian_Word (F, Result_Blocks (2).all (Word));
         end loop;
         Close (F);
         Byte_IO.Open (Byte_F, Byte_IO.Append_File, File_Name);
         Write_Little_Endian_Word_Without_Padding
           (Byte_F, Result_Blocks (2).all (Result_Blocks (2).all'Last));
         Byte_IO.Close (Byte_F);
         Open (F, Append_File, File_Name);
         for Word in Result_Blocks (3).all'First .. Result_Blocks (3).all'Last
         loop
            Write_Little_Endian_Word (F, Result_Blocks (3).all (Word));
         end loop;
         Write_Little_Endian_Word (F, Temp);
         Write_Little_Endian_Word (F, Temp);
         Close (F);
      end;
   end Decode_File;
end Decoder;
