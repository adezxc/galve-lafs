with EVP;                   use EVP;
with Types;                 use Types;
with Text_IO;
with System;
with Interfaces.C;          use Interfaces.C;
with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;
with Ada.Streams;           use Ada.Streams;
with Ada.Command_Line;      use Ada.Command_Line;

procedure Ada_Aes is
   ctx       : EVP_CIPHER_CTX_PTR;
   cipher    : EVP_CIPHER_PTR;
   Junk      : Integer;
   Algo      : char_array         := To_C ("AES-128-CTR", False);
   Prop      : char_array         := To_C ("", True);
   ossl_ctx  : OSSL_LIB_CTX_PTR;
   engine_st : ENGINE_ST_PTR;
   Key       : aliased char_array := To_C ("abcdefghabcdefgh");
   IV        : aliased char_array := To_C ("abcdefghabcdefgh");

   InputF        : File_Type;
   OutputF       : File_Type;
   InputS        : Stream_Access;
   OutputS       : Stream_Access;
   Inlen, Outlen : Integer;

   Mode : String := Argument (1); -- Operation ('encrypt' or 'decrypt')
   Input_File_Name  : String := Argument (2);
   Output_File_Name : String := Argument (3);

   Test       : Byte;
   Inbuf      : Byte_Array (1 .. BUFSIZE)      := (others => 0);
   Outbuf     : Byte_Array (1 .. BUFSIZE + 32) := (others => 0);
   Outbuf_Len : aliased Integer;
   Inbuf_Len  : aliased Integer                := BUFSIZE;

   Op : Operation;
begin
   if Mode = "encrypt" then
      Op := Encrypt;
   elsif Mode = "decrypt" then
      Op := Decrypt;
   else
      Text_IO.Put_Line ("Invalid mode. Use 'encrypt' or 'decrypt'");
      return;
   end if;

   Open (InputF, In_File, Input_File_Name);
   Open (OutputF, Out_File, Output_File_Name);
   InputS  := Stream (InputF);
   OutputS := Stream (OutputF);

   ctx    := EVP_CIPHER_CTX_new;
   cipher := EVP_aes_128_ctr;
   if EVP_CipherInit
       (Ctx      => ctx, Cipher => cipher, CipherKey => Key'Access,
        CipherIV => IV'Access, Op => Op) /=
     1
   then
      raise Constraint_Error;
   end if;
   Text_IO.Put_Line (Size (InputF)'Image);
   Text_IO.Put_Line (Index (InputF)'Image);

   while (Index (InputF) < Size (InputF)) loop
      Byte_Array'Read (InputS, Inbuf);
      if EVP_CipherUpdate
          (ctx, Outbuf (1)'Access, Outbuf_Len'Access, Inbuf (1)'Access,
           Inbuf_Len) /=
        1
      then
         raise Constraint_Error;
      end if;
      Byte_Array'Write (OutputS, Outbuf (1 .. Outbuf_Len));
   end loop;
   if EVP_CipherFinal_ex (ctx, Outbuf (1)'Access, Outbuf_Len'Access) /= 1 then
      raise Constraint_Error;
   end if;
   Byte_Array'Write (OutputS, Outbuf (1 .. Outbuf_Len));

   EVP_CIPHER_CTX_free (ctx);

   Close (InputF);
   Close (OutputF);
exception
   when End_Error =>
      if EVP_CipherFinal_ex (ctx, Outbuf (1)'Access, Outbuf_Len'Access) /= 1
      then
         raise Constraint_Error;
      end if;
      Byte_Array'Write (OutputS, Outbuf (1 .. Outbuf_Len));
      Text_IO.Put_Line (Outbuf_Len'Image);
      Text_IO.Put_Line (Outbuf_Len'Image);

      EVP_CIPHER_CTX_free (ctx);
end Ada_Aes;
