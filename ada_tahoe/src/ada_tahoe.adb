pragma Ada_2022;
with Ada.Text_IO;      use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Tahoe;            use Tahoe;
with Decoder;
with Aes;
with Uri_Read;

procedure Ada_Tahoe is
   Test : constant String :=
     "URI:CHK:vaze54ocznbnkefjum2g7ocd6i:ua3hjasipmczwvzt4nmb5ldvztfskiqdlvjcjl4p6dfzgfmptukq:3:10:37399";
   Junk : Uri_Read.URI    := Uri_Read.Process_URI (Test);
begin
   if Argument_Count = 2 and then Argument (1) = "index" then
      Put_Line (Storage_Index_From_File_Key (Argument (2)));
   elsif Argument_Count = 4 then
      Decoder.Decode_File (Argument (2), Argument (3), Argument (4));
      Aes.Decrypt_File ("output.dat", "decrypt.dat", Argument (1));
   else
      Put_Line
        (Command_Name & ": " & "Example usage for decoding the file" &
         "./ada_tahoe aes-key share1 share2 share3");
      Put_Line
        (Command_Name & ": " &
         "Example usage for getting the storage index from URI" &
         "./ada_tahoe index file-key");
   end if;
   return;
end Ada_Tahoe;
