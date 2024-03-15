with Util.Streams;
with Util.Streams.Files;
with Util.Streams.AES;
with Util.Encoders.AES;
with Base32;
with Types;
with Ada.Streams.Stream_IO;
with Ada.Text_IO;

package body Aes is
   procedure Decrypt_File (Source : String; Destination : String; Key : String)
   is
      In_Stream    : aliased Util.Streams.Files.File_Stream;
      Out_Stream   : aliased Util.Streams.Files.File_Stream;
      Decipher     : aliased Util.Streams.AES.Decoding_Stream;
      Password_Key : constant Util.Encoders.Secret_Key :=
        Util.Encoders.Create (Base32.Decode (Key));
   begin
      --  declare
      --     use Ada.Streams;
      --     use Ada.Streams.Stream_IO;
      --     File             : File_Type;
      --     End_of_File      : Count;
      --     Required_Padding : Count;
      --     S                : Stream_Access;
      --     Empty_Byte       : constant Types.Byte := 0;
      --  begin
      --     Open (File, Out_File, Source);
      --     S           := Stream (File);
      --     End_of_File := Size (File) - 1;
      --     Set_Index (File, End_of_File);
      --     Ada.Text_IO.Put_Line (End_of_File'Image);
      --     Required_Padding := (End_of_File mod 16) - 1;
      --     for I in 1 .. Required_Padding loop
      --        Types.Byte'Write (S, Empty_Byte);
      --     end loop;
      --     Close (File);
      --  end;
      --  Setup file -> input and cipher -> output file streams.
      In_Stream.Open (Ada.Streams.Stream_IO.In_File, Source);
      Out_Stream.Create
        (Mode => Ada.Streams.Stream_IO.Out_File, Name => Destination);
      Decipher.Produces (Output => Out_Stream'Unchecked_Access, Size => 32);
      Decipher.Set_Key (Secret => Password_Key, Mode => Util.Encoders.AES.CTR);

      --  Copy input to output through the cipher.
      Util.Streams.Copy (From => In_Stream, Into => Decipher);
   end Decrypt_File;

end Aes;
