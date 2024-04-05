with Util.Streams;
with Util.Streams.Files;
with Util.Streams.AES;
with Util.Encoders.AES;
with Base32;
with Ada.Streams.Stream_IO;
with Text_IO;
with Interfaces.C;
with Ada.Exceptions;

package body Aes is
   Cipher_Exception : exception;
   procedure Decrypt_File (Source : String; Destination : String; Key : String)
   is
      In_Stream    : aliased Util.Streams.Files.File_Stream;
      Out_Stream   : aliased Util.Streams.Files.File_Stream;
      Decipher     : aliased Util.Streams.AES.Decoding_Stream;
      Password_Key : constant Util.Encoders.Secret_Key :=
        Util.Encoders.Create (Base32.Decode (Key));
   begin
      In_Stream.Open (Ada.Streams.Stream_IO.In_File, Source);
      Out_Stream.Create
        (Mode => Ada.Streams.Stream_IO.Out_File, Name => Destination);
      Decipher.Produces (Output => Out_Stream'Unchecked_Access, Size => 4_096);
      Decipher.Set_Key (Secret => Password_Key, Mode => Util.Encoders.AES.CTR);

      --  Copy input to output through the cipher.
      Util.Streams.Copy (From => In_Stream, Into => Decipher);
      Text_IO.Put_Line ("TEST");
      Decipher.Flush;
      Text_IO.Put_Line ("TEST2");
   end Decrypt_File;

   function New_Decryptor
     (CipherKey : Key; CipherIV : IV; Buffer_Size : Positive) return Decryptor
   is
      use Interfaces.C;
      New_Decr : Decryptor;
      cipher   : EVP_CIPHER_PTR := EVP_aes_128_ctr;
      ctx      : EVP_CIPHER_CTX_PTR;
      Key      : char_array     := To_C (CipherKey);
      IV       : char_array     := To_C (Base32.Decode (CipherIV));
   begin
      if 1 /= EVP_CipherInit (ctx, cipher, Key, IV) then
         raise Cipher_Exception with "Failed to initialize cipher";
      end if;

      New_Decr.Context     := ctx;
      New_Decr.Buffer_Size := Buffer_Size;

      return New_Decr;
   end New_Decryptor;

   procedure Decrypt
     (D      : Decryptor; Input : access Ada.Streams.Root_Stream_Type'Class;
      Output : access Ada.Streams.Root_Stream_Type'Class)
   is
   begin
      null;

   end Decrypt;

end Aes;
