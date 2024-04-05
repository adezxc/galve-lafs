with EVP; use EVP;
with Ada.Streams;

package Aes is
   type Decryptor is record
      Context     : EVP_CIPHER_CTX_PTR;
      Buffer_Size : Positive;
   end record;

   subtype Key is String (1 .. 16);
   subtype IV is String (1 .. 16);

   function New_Decryptor
     (CipherKey : Key; CipherIV : IV; Buffer_Size : Positive) return Decryptor;

   procedure Decrypt_File
     (Source : String; Destination : String; Key : String);

   procedure Decrypt
     (D      : Decryptor; Input : access Ada.Streams.Root_Stream_Type'Class;
      Output : access Ada.Streams.Root_Stream_Type'Class);
end Aes;
