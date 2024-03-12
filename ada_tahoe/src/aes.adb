with Util.Streams;
with Util.Streams.Files;
with Util.Streams.AES;
with Util.Encoders.AES;
with Base32;
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
      --  Setup file -> input and cipher -> output file streams.
      Ada.Text_IO.Put (Base32.Decode (Key));
      In_Stream.Open (Ada.Streams.Stream_IO.In_File, Source);
      Out_Stream.Create
        (Mode => Ada.Streams.Stream_IO.Out_File, Name => Destination);
      Decipher.Produces (Output => Out_Stream'Unchecked_Access, Size => 1_024);
      Decipher.Set_Key (Secret => Password_Key, Mode => Util.Encoders.AES.CTR);

      --  Copy input to output through the cipher.

      Util.Streams.Copy (From => In_Stream, Into => Decipher);
   end Decrypt_File;

end Aes;
