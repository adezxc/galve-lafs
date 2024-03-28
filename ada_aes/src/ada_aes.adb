with EVP;          use EVP;
with Types;        use Types;
with Text_IO;
with System;
with Interfaces.C; use Interfaces.C;

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
begin
   -- EVP_CipherFetch (Ctx => ossl_ctx, Algorithm => Algo, Properties => Prop);
   ctx    := EVP_CIPHER_CTX_new;
   cipher := EVP_aes_128_ctr;
   Junk   :=
     EVP_CipherInit
       (Ctx      => ctx, Cipher => cipher, CipherKey => Key'Access,
        CipherIV => IV'Access, Op => 1);

   EVP_CIPHER_CTX_free (ctx);
end Ada_Aes;
