<<<<<<< Updated upstream
with Util.Encoders.AES;
with Util.Streams;
with Util.Streams.Files;
with Util.Streams.AES;
with Util.Encoders;
with Ada.Command_Line;
with Text_IO; use Text_IO;
with Ada.Characters.Handling;
with Ada.Streams.Stream_IO;
with Util.Streams.Texts;
||||||| Stash base
with Ada.Command_Line;
with Text_IO; use Text_IO;
with Ada.Characters.Handling;
with Ada.Streams.Stream_IO;
=======
with EVP;   use EVP;
with Types; use Types;
with Text_IO;
with System;
>>>>>>> Stashed changes

procedure Ada_Aes is
<<<<<<< Updated upstream
   use Ada.Command_Line;
   function Base32_Encode (S : String) return String is
      use Util.Encoders;
      C : constant Encoder := Util.Encoders.Create ("base32");
   begin
      return C.Encode ((S));
   end Base32_Encode;

   function Base32_Decode (S : String) return String is
      use Ada.Characters.Handling;
      use Util.Encoders;
      D : constant Decoder := Util.Encoders.Create ("base32");
   begin
      return D.Decode (To_Upper (S));
   end Base32_Decode;

   procedure Decrypt_File (Source : String; Destination : String; Key : String)
   is
      In_Stream    : aliased Util.Streams.Files.File_Stream;
      Out_Stream   : aliased Util.Streams.Files.File_Stream;
      Decipher     : aliased Util.Streams.AES.Decoding_Stream;
      Password_Key :
        constant Util.Encoders.Secret_Key
          (Length => Util.Encoders.AES.AES_128_Length) :=
        Util.Encoders.Create (Base32_Decode (Key));
   begin
      In_Stream.Open (Ada.Streams.Stream_IO.In_File, Source);
      Out_Stream.Create
        (Mode => Ada.Streams.Stream_IO.Out_File, Name => Destination);
      Decipher.Produces
        (Output => Out_Stream'Unchecked_Access, Size => 65_536);
      Decipher.Set_Key (Secret => Password_Key, Mode => Util.Encoders.AES.CTR);
      Util.Streams.Copy (From => In_Stream, Into => Decipher);
   end Decrypt_File;

   procedure Encrypt_File (Source : String; Destination : String; Key : String)
   is
      In_Stream    : aliased Util.Streams.Files.File_Stream;
      Out_Stream   : aliased Util.Streams.Files.File_Stream;
      Cipher       : aliased Util.Streams.AES.Encoding_Stream;
      Password_Key :
        constant Util.Encoders.Secret_Key
          (Length => Util.Encoders.AES.AES_128_Length) :=
        Util.Encoders.Create (Base32_Decode (Key));
   begin
      In_Stream.Open (Ada.Streams.Stream_IO.In_File, Source);
      Out_Stream.Create
        (Mode => Ada.Streams.Stream_IO.Out_File, Name => Destination);
      Cipher.Produces (Output => Out_Stream'Unchecked_Access, Size => 65_536);
      Cipher.Set_Key (Secret => Password_Key, Mode => Util.Encoders.AES.CTR);
      Util.Streams.Copy (From => In_Stream, Into => Cipher);
   end Encrypt_File;
||||||| Stash base
=======
   ctx        : EVP_CIPHER_CTX_PTR := EVP_CIPHER_CTX_new;
   cipher     : EVP_CIPHER_PTR     := EVP_aes_128_ctr;
   Junk       : Integer;
   EncryptKey : constant Key       := To_C ("abcdefghabcdefgh", False);
   EncryptIV  : constant IV        := To_C ("abcdefghabcdefgh", False);
>>>>>>> Stashed changes
begin
<<<<<<< Updated upstream
   if Argument_Count /= 4 then
      Put_Line ("Correct usage:");
      Put_Line
        (Ada.Command_Line.Command_Name &
         " encode input.dat output.dat <base32encodedkey>");
      Put_Line
        (Ada.Command_Line.Command_Name &
         " decode input.dat output.dat <base32encodedkey>");
      return;
   end if;

   declare
      Cipher_Mode : String := Argument (1);
      Input_File  : String := Argument (2);
      Output_File : String := Argument (3);
      Key         : String := Argument (4);
   begin
      if Cipher_Mode = "encode" then
         Encrypt_File
           (Source => Input_File, Destination => Output_File, Key => Key);
         return;
      end if;
      if Cipher_Mode = "decode" then
         Decrypt_File
           (Source => Input_File, Destination => Output_File, Key => Key);
         return;
      end if;
      Put_Line ("Unrecognized function");
      return;
   end;
||||||| Stash base
   null;
=======

   if ctx = null then
      Text_IO.Put_Line ("AAAA");
   end if;
   if cipher = null then
      Text_IO.Put_Line ("AAAA");
   end if;
   Junk :=
     EVP_CipherInit
       (Ctx      => ctx, Cipher => cipher, CipherKey => EncryptKey,
        CipherIV => EncryptIV, Op => 1);

   EVP_CIPHER_CTX_free (ctx);

>>>>>>> Stashed changes
end Ada_Aes;
