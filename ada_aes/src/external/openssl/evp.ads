with Types; use Types;
with System;
with Interfaces.C;

package EVP is
   -- type EVP_CIPHER_CTX is limited private;
   type EVP_CIPHER_CTX is null record;
   type EVP_CIPHER_CTX_PTR is access all EVP_CIPHER_CTX;
   type EVP_CIPHER is null record;
   type EVP_CIPHER_PTR is access all EVP_CIPHER;
   type OSSL_LIB_CTX is null record;
   type OSSL_LIB_CTX_PTR is access all OSSL_LIB_CTX;
   type ENGINE_ST is null record;
   type ENGINE_ST_PTR is access all ENGINE_ST;
   -- type EVP_CIPHER_CTX_PTR is access EVP_CIPHER_CTX;
   -- type EVP_CIPHER_PTR is access EVP_CIPHER;
   -- type ENGINE_ST_PTR is access ENGINE_ST;

   function EVP_CIPHER_CTX_new return EVP_CIPHER_CTX_PTR;
   pragma Import (C, EVP_CIPHER_CTX_new, "EVP_CIPHER_CTX_new");

   function EVP_aes_128_ctr return EVP_CIPHER_PTR with
     Import => True, Convention => C, External_Name => "EVP_aes_128_ctr";

   procedure EVP_CIPHER_CTX_free (Ctx : access EVP_CIPHER_CTX) with
     Import => True, Convention => C, External_Name => "EVP_CIPHER_CTX_free";

   function EVP_CipherInit
     (Ctx       : access EVP_CIPHER_CTX; Cipher : access constant EVP_CIPHER;
      CipherKey : access Interfaces.C.char_array;
      CipherIV  : access Interfaces.C.char_array; Op : Operation)
      return Integer with
     Import => True, Convention => C, External_Name => "EVP_CipherInit";

   procedure EVP_CipherFetch
     (Ctx        : in out OSSL_LIB_CTX_PTR;
      Algorithm  : in out Interfaces.C.char_array;
      Properties : in out Interfaces.C.char_array) with
     Import => True, Convention => C, External_Name => "EVP_CIPHER_fetch";

   function EVP_CipherUpdate
     (Ctx           : access EVP_CIPHER_CTX; Output : access Byte;
      Output_Length : access Integer; Input : access Byte;
      Input_Length  : Integer) return Integer with
     Import => True, Convention => C, External_Name => "EVP_CipherUpdate";

   function EVP_CipherFinal_ex
     (Ctx           : access EVP_CIPHER_CTX; Output : access Byte;
      Output_Length : access Integer) return Integer with
     Import => True, Convention => C, External_Name => "EVP_CipherFinal_ex";
end EVP;
