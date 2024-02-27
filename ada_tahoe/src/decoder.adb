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

      Primary_Blocks            : Integer := 0;
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
         Share_Numbers (Index) := Shares (Index).Share_Number;
         if Share_Numbers (Index) < Integer (File_URI.Needed_Shares) then
            Primary_Blocks := Primary_Blocks + 1;
         end if;
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
         size_t (Shares (1).Data_Header.Data_Size));
      Put_Line ((Decoding_Blocks (1)'Length'Image));
      for Index in 1 .. Primary_Blocks loop
         Result_Blocks (Index + 1) := Result_Blocks (Index);
         Result_Blocks (Index)     := Decoding_Blocks (Index);
      end loop;

      declare
         use Byte_IO;
         F         : Byte_IO.File_Type;
         File_Name : constant String := "output.dat";
         Temp      : Word            := 0;
         Padding_N : Natural         :=
           Natural
             (Word_64 (File_URI.Needed_Shares) -
              File_URI.Size mod Word_64 (File_URI.Needed_Shares));
      begin
         Byte_IO.Create (F, Byte_IO.Out_File, File_Name);
         for Block of Result_Blocks loop
            if Padding_N /= 0 then
               Padding_N := Padding_N - 1;
               Write_Block (F, Block, Padding => True);
            else
               Write_Block (F, Block, Padding => False);
            end if;
         end loop;
         Byte_IO.Close (F);
      end;
   end Decode_File;
end Decoder;
