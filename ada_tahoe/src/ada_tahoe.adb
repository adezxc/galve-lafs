pragma Ada_2022;
with Ada.Text_IO;
with Ada.Command_Line;      use Ada.Command_Line;
with Tahoe;                 use Tahoe;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Uri_Read;
with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;
with Decoder;               use Decoder;

procedure Ada_Tahoe is
   type Argument_Index_Array is array (Natural range <>) of Integer;

   function To_Share_Name_Array
     (Argument_Indices : Argument_Index_Array) return Share_Name_Array
   is
      Share_Names : Share_Name_Array (1 .. Argument_Indices'Length);
   begin
      for I in Argument_Indices'Range loop
         Share_Names (I - 1) := To_Unbounded_String (Argument (I));
      end loop;
      return Share_Names;
   end To_Share_Name_Array;

   URI              : Uri_Read.URI;
   Output_File      : Ada.Streams.Stream_IO.File_Type;
   Decrypted_Stream : Stream_Access;
begin
   Create (Output_File, Append_File, "decrypted.dat");
   Decrypted_Stream := Stream (Output_File);
   if Argument_Count = 2 and then Argument (1) = "index" then
      URI := Uri_Read.Process_URI (Argument (2));
      Ada.Text_IO.Put_Line (Storage_Index_From_File_Key (URI.Key));
   elsif Argument_Count = 4 then
      URI := Uri_Read.Process_URI (Argument (1));
      declare
         Share_Indices : constant Argument_Index_Array (2 .. Argument_Count) :=
           [others => 0];
         Share_Names   : constant Share_Name_Array                           :=
           To_Share_Name_Array (Share_Indices);
      begin
         Decode_File (URI, Share_Names, Decrypted_Stream);
      end;
   else
      Ada.Text_IO.Put_Line
        (Command_Name & ": " & "Example usage for decoding the file" &
         "./ada_tahoe aes-key share1 share2 share3");
      Ada.Text_IO.Put_Line
        (Command_Name & ": " &
         "Example usage for getting the storage index from URI" &
         "./ada_tahoe index URI");
   end if;
end Ada_Tahoe;
