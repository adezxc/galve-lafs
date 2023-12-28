pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with bits_stdint_uintn_h;
with stddef_h;

package aes_h is

   CBC : constant := 1;  --  aes.h:15

   ECB : constant := 1;  --  aes.h:19

   CTR : constant := 1;  --  aes.h:23

   AES128 : constant := 1;  --  aes.h:27

   AES_BLOCKLEN : constant := 16;  --  aes.h:31

   AES_KEYLEN : constant := 16;  --  aes.h:40
   AES_keyExpSize : constant := 176;  --  aes.h:41

  -- #define the macros below to 1/0 to enable/disable the mode of operation.
  -- CBC enables AES encryption in CBC-mode of operation.
  -- CTR enables encryption in counter-mode.
  -- ECB enables the basic ECB 16-byte block algorithm. All can be enabled simultaneously.
  -- The #ifndef-guard allows it to be configured before #include'ing or at compile time.
  --#define AES192 1
  --#define AES256 1
   type anon_array946 is array (0 .. 175) of aliased bits_stdint_uintn_h.uint8_t;
   type anon_array949 is array (0 .. 15) of aliased bits_stdint_uintn_h.uint8_t;
   type AES_ctx is record
      RoundKey : aliased anon_array946;  -- aes.h:46
      Iv : aliased anon_array949;  -- aes.h:48
   end record
   with Convention => C_Pass_By_Copy;  -- aes.h:44

   procedure AES_init_ctx (ctx : access AES_ctx; key : access bits_stdint_uintn_h.uint8_t)  -- aes.h:52
   with Import => True, 
        Convention => C, 
        External_Name => "AES_init_ctx";

   procedure AES_init_ctx_iv
     (ctx : access AES_ctx;
      key : access bits_stdint_uintn_h.uint8_t;
      iv : access bits_stdint_uintn_h.uint8_t)  -- aes.h:54
   with Import => True, 
        Convention => C, 
        External_Name => "AES_init_ctx_iv";

   procedure AES_ctx_set_iv (ctx : access AES_ctx; iv : access bits_stdint_uintn_h.uint8_t)  -- aes.h:55
   with Import => True, 
        Convention => C, 
        External_Name => "AES_ctx_set_iv";

  -- buffer size is exactly AES_BLOCKLEN bytes; 
  -- you need only AES_init_ctx as IV is not used in ECB 
  -- NB: ECB is considered insecure for most uses
   procedure AES_ECB_encrypt (ctx : access constant AES_ctx; buf : access bits_stdint_uintn_h.uint8_t)  -- aes.h:62
   with Import => True, 
        Convention => C, 
        External_Name => "AES_ECB_encrypt";

   procedure AES_ECB_decrypt (ctx : access constant AES_ctx; buf : access bits_stdint_uintn_h.uint8_t)  -- aes.h:63
   with Import => True, 
        Convention => C, 
        External_Name => "AES_ECB_decrypt";

  -- buffer size MUST be mutile of AES_BLOCKLEN;
  -- Suggest https://en.wikipedia.org/wiki/Padding_(cryptography)#PKCS7 for padding scheme
  -- NOTES: you need to set IV in ctx via AES_init_ctx_iv() or AES_ctx_set_iv()
  --        no IV should ever be reused with the same key 
   procedure AES_CBC_encrypt_buffer
     (ctx : access AES_ctx;
      buf : access bits_stdint_uintn_h.uint8_t;
      length : stddef_h.size_t)  -- aes.h:73
   with Import => True, 
        Convention => C, 
        External_Name => "AES_CBC_encrypt_buffer";

   procedure AES_CBC_decrypt_buffer
     (ctx : access AES_ctx;
      buf : access bits_stdint_uintn_h.uint8_t;
      length : stddef_h.size_t)  -- aes.h:74
   with Import => True, 
        Convention => C, 
        External_Name => "AES_CBC_decrypt_buffer";

  -- Same function for encrypting as for decrypting. 
  -- IV is incremented for every block, and used after encryption as XOR-compliment for output
  -- Suggesting https://en.wikipedia.org/wiki/Padding_(cryptography)#PKCS7 for padding scheme
  -- NOTES: you need to set IV in ctx with AES_init_ctx_iv() or AES_ctx_set_iv()
  --        no IV should ever be reused with the same key 
   procedure AES_CTR_xcrypt_buffer
     (ctx : access AES_ctx;
      buf : access bits_stdint_uintn_h.uint8_t;
      length : stddef_h.size_t)  -- aes.h:86
   with Import => True, 
        Convention => C, 
        External_Name => "AES_CTR_xcrypt_buffer";

end aes_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
