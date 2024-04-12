with EVP; use EVP;
with Ada.Streams;
with Types;
with Memory_Streams;

package Aes is
  type Decryptor is record
    Context     : aliased EVP_CIPHER_CTX_PTR;
    Buffer_Size : aliased Positive;
  end record;

  subtype Key is String (1 .. 26);
  subtype IV is String (1 .. 16);

  function New_Decryptor
   (CipherKey : Key; CipherIV : IV; Buffer_Size : Positive) return Decryptor;

  procedure Decrypt_File (Source : String; Destination : String; Key : String);

  procedure Decrypt
   (D      : in Decryptor; Input : access Ada.Streams.Root_Stream_Type'Class;
    Output :    access Ada.Streams.Root_Stream_Type'Class);

  procedure Decrypt_Block
   (D : in out Decryptor; Input : access Ada.Streams.Root_Stream_Type'Class;
    Output :        access Ada.Streams.Root_Stream_Type'Class);
end Aes;
