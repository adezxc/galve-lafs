with Types; use Types;
with System;

package EVP is
   -- type EVP_CIPHER_CTX is limited private;
   type EVP_CIPHER_CTX is null record;
   type EVP_CIPHER_CTX_PTR is access all EVP_CIPHER_CTX;
   type EVP_CIPHER is null record;
   type EVP_CIPHER_PTR is access all EVP_CIPHER;
   -- type EVP_CIPHER_CTX_PTR is access EVP_CIPHER_CTX;
   -- type EVP_CIPHER_PTR is access EVP_CIPHER;
   -- type ENGINE_ST_PTR is access ENGINE_ST;

   function EVP_CIPHER_CTX_new return EVP_CIPHER_CTX_PTR;
   pragma Import (C, EVP_CIPHER_CTX_new, "EVP_CIPHER_CTX_new");

   function EVP_aes_128_ctr return EVP_CIPHER_PTR with
     Import => True, Convention => C, External_Name => "EVP_aes_128_ctr";

   procedure EVP_CIPHER_CTX_free (Ctx : in out EVP_CIPHER_CTX_PTR) with
     Import => True, Convention => C, External_Name => "EVP_CIPHER_CTX_free";

   function EVP_CipherInit
     (Ctx       : in out EVP_CIPHER_CTX_PTR; Cipher : in EVP_CIPHER_PTR;
      CipherKey :    Key; CipherIV : IV; Op : Operation) return Integer with
     Import => True, Convention => C, External_Name => "EVP_CipherInit";

   -- private
   --  type EVP_CIPHER_CTX is limited null record;
   --  type EVP_CIPHER is limited null record;
   --  type ENGINE_ST is limited null record;

   -- The 'private' section is where you would put the actual
   --   representation of EVP_CIPHER_CTX if you knew the full C struct
   --   definition, but in this case, we leave it empty.
end EVP;
