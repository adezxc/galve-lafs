pragma Ada_2022;
with Util.Streams;
with Util.Streams.Files;
with Util.Streams.AES;
with Util.Encoders.AES;
with Base32;
with Ada.Streams.Stream_IO;
with Text_IO;
with Interfaces.C;
with Types; use Types;

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
      cipher   : EVP_CIPHER_PTR;
      ctx      : constant EVP_CIPHER_CTX_PTR := EVP_CIPHER_CTX_new;
      Key      : aliased char_array := To_C (Base32.Decode (CipherKey));
      IV       : aliased char_array          := To_C (CipherIV);
   begin
      cipher := EVP_aes_128_ctr;
      if 1 /= EVP_CipherInit (ctx, cipher, Key'Access, IV'Access, 0) then
         raise Cipher_Exception with "Failed to initialize cipher";
      end if;

      New_Decr.Context     := ctx;
      New_Decr.Buffer_Size := Buffer_Size;

      return New_Decr;
   end New_Decryptor;

   procedure Decrypt
     (D      : in Decryptor; Input : access Ada.Streams.Root_Stream_Type'Class;
      Output :    access Ada.Streams.Root_Stream_Type'Class)
   is
      use Ada.Streams;
      Output_Buffer : Byte_Array (1 .. D.Buffer_Size + EVP_MAX_BLOCK_LENGTH);
      Output_Length : aliased Integer;
      Input_Buffer  : Byte_Array (1 .. D.Buffer_Size);
      Input_Length  : aliased Integer := D.Buffer_Size;
      Last          : Integer         := D.Buffer_Size;
   begin
      while Last = D.Buffer_Size loop
         Read (Input, Input_Buffer, Last);
         Input_Length := Last;
         if 1 /=
           EVP_CipherUpdate
             (Ctx           => D.Context, Output => Output_Buffer (1)'Access,
              Output_Length => Output_Length'Access,
              Input => Input_Buffer (1)'Access, Input_Length => Input_Length)
         then
            raise Cipher_Exception with "Failed to update cipher";
         end if;
         Write (Output, Output_Buffer (1 .. Output_Length));
      end loop;
   end Decrypt;

   procedure Decrypt_Block
     (D : in out Decryptor; Input : access Ada.Streams.Root_Stream_Type'Class;
      Output :        access Ada.Streams.Root_Stream_Type'Class)
   is
      use Ada.Streams;
      Output_Buffer : Byte_Array (1 .. D.Buffer_Size + EVP_MAX_BLOCK_LENGTH);
      Output_Length : aliased Integer;
      Input_Buffer  : Byte_Array (1 .. D.Buffer_Size);
      Input_Length  : aliased Integer := D.Buffer_Size;
      Last          : Integer         := D.Buffer_Size;
   begin
      while Last = D.Buffer_Size loop
         Input_Length := Last;
         if 1 /=
           EVP_CipherUpdate
             (Ctx           => D.Context, Output => Output_Buffer (1)'Access,
              Output_Length => Output_Length'Access,
              Input => Input_Buffer (1)'Access, Input_Length => Input_Length)
         then
            raise Cipher_Exception with "Failed to update cipher";
         end if;
         Write (Output, Output_Buffer (1 .. Output_Length));
      end loop;
   end Decrypt_Block;
end Aes;
