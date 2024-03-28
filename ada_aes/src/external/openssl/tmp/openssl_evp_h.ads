pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
limited with openssl_types_h;
with Interfaces.C.Strings;
with System;
with stddef_h;
limited with openssl_asn1_h;
limited with openssl_core_h;
limited with openssl_bio_h;
limited with bits_types_struct_FILE_h;
with bits_stdint_uintn_h;

package openssl_evp_h is

   EVP_MAX_MD_SIZE : constant := 64;  --  /usr/include/openssl/evp.h:34
   EVP_MAX_KEY_LENGTH : constant := 64;  --  /usr/include/openssl/evp.h:35
   EVP_MAX_IV_LENGTH : constant := 16;  --  /usr/include/openssl/evp.h:36
   EVP_MAX_BLOCK_LENGTH : constant := 32;  --  /usr/include/openssl/evp.h:37
   EVP_MAX_AEAD_TAG_LENGTH : constant := 16;  --  /usr/include/openssl/evp.h:38

   PKCS5_SALT_LEN : constant := 8;  --  /usr/include/openssl/evp.h:40

   PKCS5_DEFAULT_ITER : constant := 2048;  --  /usr/include/openssl/evp.h:42

   EVP_PK_RSA : constant := 16#0001#;  --  /usr/include/openssl/evp.h:47
   EVP_PK_DSA : constant := 16#0002#;  --  /usr/include/openssl/evp.h:48
   EVP_PK_DH : constant := 16#0004#;  --  /usr/include/openssl/evp.h:49
   EVP_PK_EC : constant := 16#0008#;  --  /usr/include/openssl/evp.h:50
   EVP_PKT_SIGN : constant := 16#0010#;  --  /usr/include/openssl/evp.h:51
   EVP_PKT_ENC : constant := 16#0020#;  --  /usr/include/openssl/evp.h:52
   EVP_PKT_EXCH : constant := 16#0040#;  --  /usr/include/openssl/evp.h:53
   EVP_PKS_RSA : constant := 16#0100#;  --  /usr/include/openssl/evp.h:54
   EVP_PKS_DSA : constant := 16#0200#;  --  /usr/include/openssl/evp.h:55
   EVP_PKS_EC : constant := 16#0400#;  --  /usr/include/openssl/evp.h:56
   --  unsupported macro: EVP_PKEY_NONE NID_undef
   --  unsupported macro: EVP_PKEY_RSA NID_rsaEncryption
   --  unsupported macro: EVP_PKEY_RSA2 NID_rsa
   --  unsupported macro: EVP_PKEY_RSA_PSS NID_rsassaPss
   --  unsupported macro: EVP_PKEY_DSA NID_dsa
   --  unsupported macro: EVP_PKEY_DSA1 NID_dsa_2
   --  unsupported macro: EVP_PKEY_DSA2 NID_dsaWithSHA
   --  unsupported macro: EVP_PKEY_DSA3 NID_dsaWithSHA1
   --  unsupported macro: EVP_PKEY_DSA4 NID_dsaWithSHA1_2
   --  unsupported macro: EVP_PKEY_DH NID_dhKeyAgreement
   --  unsupported macro: EVP_PKEY_DHX NID_dhpublicnumber
   --  unsupported macro: EVP_PKEY_EC NID_X9_62_id_ecPublicKey
   --  unsupported macro: EVP_PKEY_SM2 NID_sm2
   --  unsupported macro: EVP_PKEY_HMAC NID_hmac
   --  unsupported macro: EVP_PKEY_CMAC NID_cmac
   --  unsupported macro: EVP_PKEY_SCRYPT NID_id_scrypt
   --  unsupported macro: EVP_PKEY_TLS1_PRF NID_tls1_prf
   --  unsupported macro: EVP_PKEY_HKDF NID_hkdf
   --  unsupported macro: EVP_PKEY_POLY1305 NID_poly1305
   --  unsupported macro: EVP_PKEY_SIPHASH NID_siphash
   --  unsupported macro: EVP_PKEY_X25519 NID_X25519
   --  unsupported macro: EVP_PKEY_ED25519 NID_ED25519
   --  unsupported macro: EVP_PKEY_X448 NID_X448
   --  unsupported macro: EVP_PKEY_ED448 NID_ED448

   EVP_PKEY_KEYMGMT : constant := -1;  --  /usr/include/openssl/evp.h:84
   --  unsupported macro: EVP_PKEY_KEY_PARAMETERS ( OSSL_KEYMGMT_SELECT_ALL_PARAMETERS )
   --  unsupported macro: EVP_PKEY_PRIVATE_KEY ( EVP_PKEY_KEY_PARAMETERS | OSSL_KEYMGMT_SELECT_PRIVATE_KEY )
   --  unsupported macro: EVP_PKEY_PUBLIC_KEY ( EVP_PKEY_KEY_PARAMETERS | OSSL_KEYMGMT_SELECT_PUBLIC_KEY )
   --  unsupported macro: EVP_PKEY_KEYPAIR ( EVP_PKEY_PUBLIC_KEY | OSSL_KEYMGMT_SELECT_PRIVATE_KEY )

   EVP_PKEY_MO_SIGN : constant := 16#0001#;  --  /usr/include/openssl/evp.h:104
   EVP_PKEY_MO_VERIFY : constant := 16#0002#;  --  /usr/include/openssl/evp.h:105
   EVP_PKEY_MO_ENCRYPT : constant := 16#0004#;  --  /usr/include/openssl/evp.h:106
   EVP_PKEY_MO_DECRYPT : constant := 16#0008#;  --  /usr/include/openssl/evp.h:107

   EVP_MD_FLAG_ONESHOT : constant := 16#0001#;  --  /usr/include/openssl/evp.h:161

   EVP_MD_FLAG_XOF : constant := 16#0002#;  --  /usr/include/openssl/evp.h:164

   EVP_MD_FLAG_DIGALGID_MASK : constant := 16#0018#;  --  /usr/include/openssl/evp.h:168

   EVP_MD_FLAG_DIGALGID_NULL : constant := 16#0000#;  --  /usr/include/openssl/evp.h:172

   EVP_MD_FLAG_DIGALGID_ABSENT : constant := 16#0008#;  --  /usr/include/openssl/evp.h:176

   EVP_MD_FLAG_DIGALGID_CUSTOM : constant := 16#0018#;  --  /usr/include/openssl/evp.h:180

   EVP_MD_FLAG_FIPS : constant := 16#0400#;  --  /usr/include/openssl/evp.h:183

   EVP_MD_CTRL_DIGALGID : constant := 16#1#;  --  /usr/include/openssl/evp.h:187
   EVP_MD_CTRL_MICALG : constant := 16#2#;  --  /usr/include/openssl/evp.h:188
   EVP_MD_CTRL_XOF_LEN : constant := 16#3#;  --  /usr/include/openssl/evp.h:189
   EVP_MD_CTRL_TLSTREE : constant := 16#4#;  --  /usr/include/openssl/evp.h:190

   EVP_MD_CTRL_ALG_CTRL : constant := 16#1000#;  --  /usr/include/openssl/evp.h:194

   EVP_MD_CTX_FLAG_ONESHOT : constant := 16#0001#;  --  /usr/include/openssl/evp.h:200

   EVP_MD_CTX_FLAG_CLEANED : constant := 16#0002#;  --  /usr/include/openssl/evp.h:202

   EVP_MD_CTX_FLAG_REUSE : constant := 16#0004#;  --  /usr/include/openssl/evp.h:204

   EVP_MD_CTX_FLAG_NON_FIPS_ALLOW : constant := 16#0008#;  --  /usr/include/openssl/evp.h:212

   EVP_MD_CTX_FLAG_PAD_MASK : constant := 16#F0#;  --  /usr/include/openssl/evp.h:219
   EVP_MD_CTX_FLAG_PAD_PKCS1 : constant := 16#00#;  --  /usr/include/openssl/evp.h:220
   EVP_MD_CTX_FLAG_PAD_X931 : constant := 16#10#;  --  /usr/include/openssl/evp.h:221
   EVP_MD_CTX_FLAG_PAD_PSS : constant := 16#20#;  --  /usr/include/openssl/evp.h:222

   EVP_MD_CTX_FLAG_NO_INIT : constant := 16#0100#;  --  /usr/include/openssl/evp.h:224

   EVP_MD_CTX_FLAG_FINALISE : constant := 16#0200#;  --  /usr/include/openssl/evp.h:231

   EVP_CIPH_STREAM_CIPHER : constant := 16#0#;  --  /usr/include/openssl/evp.h:301
   EVP_CIPH_ECB_MODE : constant := 16#1#;  --  /usr/include/openssl/evp.h:302
   EVP_CIPH_CBC_MODE : constant := 16#2#;  --  /usr/include/openssl/evp.h:303
   EVP_CIPH_CFB_MODE : constant := 16#3#;  --  /usr/include/openssl/evp.h:304
   EVP_CIPH_OFB_MODE : constant := 16#4#;  --  /usr/include/openssl/evp.h:305
   EVP_CIPH_CTR_MODE : constant := 16#5#;  --  /usr/include/openssl/evp.h:306
   EVP_CIPH_GCM_MODE : constant := 16#6#;  --  /usr/include/openssl/evp.h:307
   EVP_CIPH_CCM_MODE : constant := 16#7#;  --  /usr/include/openssl/evp.h:308
   EVP_CIPH_XTS_MODE : constant := 16#10001#;  --  /usr/include/openssl/evp.h:309
   EVP_CIPH_WRAP_MODE : constant := 16#10002#;  --  /usr/include/openssl/evp.h:310
   EVP_CIPH_OCB_MODE : constant := 16#10003#;  --  /usr/include/openssl/evp.h:311
   EVP_CIPH_SIV_MODE : constant := 16#10004#;  --  /usr/include/openssl/evp.h:312
   EVP_CIPH_GCM_SIV_MODE : constant := 16#10005#;  --  /usr/include/openssl/evp.h:313
   EVP_CIPH_MODE : constant := 16#F0007#;  --  /usr/include/openssl/evp.h:314

   EVP_CIPH_VARIABLE_LENGTH : constant := 16#8#;  --  /usr/include/openssl/evp.h:316

   EVP_CIPH_CUSTOM_IV : constant := 16#10#;  --  /usr/include/openssl/evp.h:318

   EVP_CIPH_ALWAYS_CALL_INIT : constant := 16#20#;  --  /usr/include/openssl/evp.h:320

   EVP_CIPH_CTRL_INIT : constant := 16#40#;  --  /usr/include/openssl/evp.h:322

   EVP_CIPH_CUSTOM_KEY_LENGTH : constant := 16#80#;  --  /usr/include/openssl/evp.h:324

   EVP_CIPH_NO_PADDING : constant := 16#100#;  --  /usr/include/openssl/evp.h:326

   EVP_CIPH_RAND_KEY : constant := 16#200#;  --  /usr/include/openssl/evp.h:328

   EVP_CIPH_CUSTOM_COPY : constant := 16#400#;  --  /usr/include/openssl/evp.h:330

   EVP_CIPH_CUSTOM_IV_LENGTH : constant := 16#800#;  --  /usr/include/openssl/evp.h:332

   EVP_CIPH_FLAG_DEFAULT_ASN1 : constant := 0;  --  /usr/include/openssl/evp.h:334

   EVP_CIPH_FLAG_LENGTH_BITS : constant := 16#2000#;  --  /usr/include/openssl/evp.h:337

   EVP_CIPH_FLAG_FIPS : constant := 0;  --  /usr/include/openssl/evp.h:339

   EVP_CIPH_FLAG_NON_FIPS_ALLOW : constant := 0;  --  /usr/include/openssl/evp.h:341

   EVP_CIPH_FLAG_CTS : constant := 16#4000#;  --  /usr/include/openssl/evp.h:346
   EVP_CIPH_FLAG_CUSTOM_CIPHER : constant := 16#100000#;  --  /usr/include/openssl/evp.h:347
   EVP_CIPH_FLAG_AEAD_CIPHER : constant := 16#200000#;  --  /usr/include/openssl/evp.h:348
   EVP_CIPH_FLAG_TLS1_1_MULTIBLOCK : constant := 16#400000#;  --  /usr/include/openssl/evp.h:349

   EVP_CIPH_FLAG_PIPELINE : constant := 16#800000#;  --  /usr/include/openssl/evp.h:351

   EVP_CIPH_FLAG_CUSTOM_ASN1 : constant := 16#1000000#;  --  /usr/include/openssl/evp.h:353

   EVP_CIPH_FLAG_CIPHER_WITH_MAC : constant := 16#2000000#;  --  /usr/include/openssl/evp.h:355

   EVP_CIPH_FLAG_GET_WRAP_CIPHER : constant := 16#4000000#;  --  /usr/include/openssl/evp.h:357
   EVP_CIPH_FLAG_INVERSE_CIPHER : constant := 16#8000000#;  --  /usr/include/openssl/evp.h:358

   EVP_CIPHER_CTX_FLAG_WRAP_ALLOW : constant := 16#1#;  --  /usr/include/openssl/evp.h:365

   EVP_CTRL_INIT : constant := 16#0#;  --  /usr/include/openssl/evp.h:369
   EVP_CTRL_SET_KEY_LENGTH : constant := 16#1#;  --  /usr/include/openssl/evp.h:370
   EVP_CTRL_GET_RC2_KEY_BITS : constant := 16#2#;  --  /usr/include/openssl/evp.h:371
   EVP_CTRL_SET_RC2_KEY_BITS : constant := 16#3#;  --  /usr/include/openssl/evp.h:372
   EVP_CTRL_GET_RC5_ROUNDS : constant := 16#4#;  --  /usr/include/openssl/evp.h:373
   EVP_CTRL_SET_RC5_ROUNDS : constant := 16#5#;  --  /usr/include/openssl/evp.h:374
   EVP_CTRL_RAND_KEY : constant := 16#6#;  --  /usr/include/openssl/evp.h:375
   EVP_CTRL_PBE_PRF_NID : constant := 16#7#;  --  /usr/include/openssl/evp.h:376
   EVP_CTRL_COPY : constant := 16#8#;  --  /usr/include/openssl/evp.h:377
   EVP_CTRL_AEAD_SET_IVLEN : constant := 16#9#;  --  /usr/include/openssl/evp.h:378
   EVP_CTRL_AEAD_GET_TAG : constant := 16#10#;  --  /usr/include/openssl/evp.h:379
   EVP_CTRL_AEAD_SET_TAG : constant := 16#11#;  --  /usr/include/openssl/evp.h:380
   EVP_CTRL_AEAD_SET_IV_FIXED : constant := 16#12#;  --  /usr/include/openssl/evp.h:381
   --  unsupported macro: EVP_CTRL_GCM_SET_IVLEN EVP_CTRL_AEAD_SET_IVLEN
   --  unsupported macro: EVP_CTRL_GCM_GET_TAG EVP_CTRL_AEAD_GET_TAG
   --  unsupported macro: EVP_CTRL_GCM_SET_TAG EVP_CTRL_AEAD_SET_TAG
   --  unsupported macro: EVP_CTRL_GCM_SET_IV_FIXED EVP_CTRL_AEAD_SET_IV_FIXED

   EVP_CTRL_GCM_IV_GEN : constant := 16#13#;  --  /usr/include/openssl/evp.h:386
   --  unsupported macro: EVP_CTRL_CCM_SET_IVLEN EVP_CTRL_AEAD_SET_IVLEN
   --  unsupported macro: EVP_CTRL_CCM_GET_TAG EVP_CTRL_AEAD_GET_TAG
   --  unsupported macro: EVP_CTRL_CCM_SET_TAG EVP_CTRL_AEAD_SET_TAG
   --  unsupported macro: EVP_CTRL_CCM_SET_IV_FIXED EVP_CTRL_AEAD_SET_IV_FIXED

   EVP_CTRL_CCM_SET_L : constant := 16#14#;  --  /usr/include/openssl/evp.h:391
   EVP_CTRL_CCM_SET_MSGLEN : constant := 16#15#;  --  /usr/include/openssl/evp.h:392

   EVP_CTRL_AEAD_TLS1_AAD : constant := 16#16#;  --  /usr/include/openssl/evp.h:398

   EVP_CTRL_AEAD_SET_MAC_KEY : constant := 16#17#;  --  /usr/include/openssl/evp.h:400

   EVP_CTRL_GCM_SET_IV_INV : constant := 16#18#;  --  /usr/include/openssl/evp.h:402

   EVP_CTRL_TLS1_1_MULTIBLOCK_AAD : constant := 16#19#;  --  /usr/include/openssl/evp.h:404
   EVP_CTRL_TLS1_1_MULTIBLOCK_ENCRYPT : constant := 16#1a#;  --  /usr/include/openssl/evp.h:405
   EVP_CTRL_TLS1_1_MULTIBLOCK_DECRYPT : constant := 16#1b#;  --  /usr/include/openssl/evp.h:406
   EVP_CTRL_TLS1_1_MULTIBLOCK_MAX_BUFSIZE : constant := 16#1c#;  --  /usr/include/openssl/evp.h:407

   EVP_CTRL_SSL3_MASTER_SECRET : constant := 16#1d#;  --  /usr/include/openssl/evp.h:409

   EVP_CTRL_SET_SBOX : constant := 16#1e#;  --  /usr/include/openssl/evp.h:412

   EVP_CTRL_SBOX_USED : constant := 16#1f#;  --  /usr/include/openssl/evp.h:417

   EVP_CTRL_KEY_MESH : constant := 16#20#;  --  /usr/include/openssl/evp.h:421

   EVP_CTRL_BLOCK_PADDING_MODE : constant := 16#21#;  --  /usr/include/openssl/evp.h:423

   EVP_CTRL_SET_PIPELINE_OUTPUT_BUFS : constant := 16#22#;  --  /usr/include/openssl/evp.h:426

   EVP_CTRL_SET_PIPELINE_INPUT_BUFS : constant := 16#23#;  --  /usr/include/openssl/evp.h:428

   EVP_CTRL_SET_PIPELINE_INPUT_LENS : constant := 16#24#;  --  /usr/include/openssl/evp.h:430

   EVP_CTRL_GET_IVLEN : constant := 16#25#;  --  /usr/include/openssl/evp.h:432

   EVP_CTRL_SET_SPEED : constant := 16#27#;  --  /usr/include/openssl/evp.h:435

   EVP_CTRL_PROCESS_UNPROTECTED : constant := 16#28#;  --  /usr/include/openssl/evp.h:437

   EVP_CTRL_GET_WRAP_CIPHER : constant := 16#29#;  --  /usr/include/openssl/evp.h:439

   EVP_CTRL_TLSTREE : constant := 16#2A#;  --  /usr/include/openssl/evp.h:441

   EVP_PADDING_PKCS7 : constant := 1;  --  /usr/include/openssl/evp.h:444
   EVP_PADDING_ISO7816_4 : constant := 2;  --  /usr/include/openssl/evp.h:445
   EVP_PADDING_ANSI923 : constant := 3;  --  /usr/include/openssl/evp.h:446
   EVP_PADDING_ISO10126 : constant := 4;  --  /usr/include/openssl/evp.h:447
   EVP_PADDING_ZERO : constant := 5;  --  /usr/include/openssl/evp.h:448

   EVP_AEAD_TLS1_AAD_LEN : constant := 13;  --  /usr/include/openssl/evp.h:451

   EVP_GCM_TLS_FIXED_IV_LEN : constant := 4;  --  /usr/include/openssl/evp.h:462

   EVP_GCM_TLS_EXPLICIT_IV_LEN : constant := 8;  --  /usr/include/openssl/evp.h:464

   EVP_GCM_TLS_TAG_LEN : constant := 16;  --  /usr/include/openssl/evp.h:466

   EVP_CCM_TLS_FIXED_IV_LEN : constant := 4;  --  /usr/include/openssl/evp.h:470

   EVP_CCM_TLS_EXPLICIT_IV_LEN : constant := 8;  --  /usr/include/openssl/evp.h:472

   EVP_CCM_TLS_IV_LEN : constant := 12;  --  /usr/include/openssl/evp.h:474

   EVP_CCM_TLS_TAG_LEN : constant := 16;  --  /usr/include/openssl/evp.h:476

   EVP_CCM8_TLS_TAG_LEN : constant := 8;  --  /usr/include/openssl/evp.h:478

   EVP_CHACHAPOLY_TLS_TAG_LEN : constant := 16;  --  /usr/include/openssl/evp.h:481
   --  arg-macro: procedure EVP_PKEY_assign_RSA (pkey, rsa)
   --    EVP_PKEY_assign((pkey),EVP_PKEY_RSA, (rsa))
   --  arg-macro: procedure EVP_PKEY_assign_DSA (pkey, dsa)
   --    EVP_PKEY_assign((pkey),EVP_PKEY_DSA, (dsa))
   --  arg-macro: procedure EVP_PKEY_assign_DH (pkey, dh)
   --    EVP_PKEY_assign((pkey),EVP_PKEY_DH,(dh))
   --  arg-macro: procedure EVP_PKEY_assign_EC_KEY (pkey, eckey)
   --    EVP_PKEY_assign((pkey), EVP_PKEY_EC, (eckey))
   --  arg-macro: procedure EVP_PKEY_assign_SIPHASH (pkey, shkey)
   --    EVP_PKEY_assign((pkey), EVP_PKEY_SIPHASH,(shkey))
   --  arg-macro: procedure EVP_PKEY_assign_POLY1305 (pkey, polykey)
   --    EVP_PKEY_assign((pkey), EVP_PKEY_POLY1305,(polykey))
   --  arg-macro: procedure EVP_get_digestbynid (a)
   --    EVP_get_digestbyname(OBJ_nid2sn(a))
   --  arg-macro: procedure EVP_get_digestbyobj (a)
   --    EVP_get_digestbynid(OBJ_obj2nid(a))
   --  arg-macro: procedure EVP_get_cipherbynid (a)
   --    EVP_get_cipherbyname(OBJ_nid2sn(a))
   --  arg-macro: procedure EVP_get_cipherbyobj (a)
   --    EVP_get_cipherbynid(OBJ_obj2nid(a))
   --  unsupported macro: EVP_MD_type EVP_MD_get_type
   --  unsupported macro: EVP_MD_nid EVP_MD_get_type
   --  unsupported macro: EVP_MD_name EVP_MD_get0_name
   --  unsupported macro: EVP_MD_pkey_type EVP_MD_get_pkey_type
   --  unsupported macro: EVP_MD_size EVP_MD_get_size
   --  unsupported macro: EVP_MD_block_size EVP_MD_get_block_size
   --  unsupported macro: EVP_MD_flags EVP_MD_get_flags
   --  arg-macro: procedure EVP_MD_CTX_get0_name (e)
   --    EVP_MD_get0_name(EVP_MD_CTX_get0_md(e))
   --  arg-macro: procedure EVP_MD_CTX_get_size (e)
   --    EVP_MD_get_size(EVP_MD_CTX_get0_md(e))
   --  unsupported macro: EVP_MD_CTX_size EVP_MD_CTX_get_size
   --  arg-macro: procedure EVP_MD_CTX_get_block_size (e)
   --    EVP_MD_get_block_size(EVP_MD_CTX_get0_md(e))
   --  unsupported macro: EVP_MD_CTX_block_size EVP_MD_CTX_get_block_size
   --  arg-macro: procedure EVP_MD_CTX_get_type (e)
   --    EVP_MD_get_type(EVP_MD_CTX_get0_md(e))
   --  unsupported macro: EVP_MD_CTX_type EVP_MD_CTX_get_type
   --  unsupported macro: EVP_MD_CTX_pkey_ctx EVP_MD_CTX_get_pkey_ctx
   --  unsupported macro: EVP_MD_CTX_md_data EVP_MD_CTX_get0_md_data
   --  unsupported macro: EVP_CIPHER_nid EVP_CIPHER_get_nid
   --  unsupported macro: EVP_CIPHER_name EVP_CIPHER_get0_name
   --  unsupported macro: EVP_CIPHER_block_size EVP_CIPHER_get_block_size
   --  unsupported macro: EVP_CIPHER_key_length EVP_CIPHER_get_key_length
   --  unsupported macro: EVP_CIPHER_iv_length EVP_CIPHER_get_iv_length
   --  unsupported macro: EVP_CIPHER_flags EVP_CIPHER_get_flags
   --  unsupported macro: EVP_CIPHER_mode EVP_CIPHER_get_mode
   --  unsupported macro: EVP_CIPHER_type EVP_CIPHER_get_type
   --  unsupported macro: EVP_CIPHER_CTX_encrypting EVP_CIPHER_CTX_is_encrypting
   --  unsupported macro: EVP_CIPHER_CTX_nid EVP_CIPHER_CTX_get_nid
   --  unsupported macro: EVP_CIPHER_CTX_block_size EVP_CIPHER_CTX_get_block_size
   --  unsupported macro: EVP_CIPHER_CTX_key_length EVP_CIPHER_CTX_get_key_length
   --  unsupported macro: EVP_CIPHER_CTX_iv_length EVP_CIPHER_CTX_get_iv_length
   --  unsupported macro: EVP_CIPHER_CTX_tag_length EVP_CIPHER_CTX_get_tag_length
   --  unsupported macro: EVP_CIPHER_CTX_num EVP_CIPHER_CTX_get_num
   --  arg-macro: procedure EVP_CIPHER_CTX_get0_name (c)
   --    EVP_CIPHER_get0_name(EVP_CIPHER_CTX_get0_cipher(c))
   --  arg-macro: procedure EVP_CIPHER_CTX_get_type (c)
   --    EVP_CIPHER_get_type(EVP_CIPHER_CTX_get0_cipher(c))
   --  unsupported macro: EVP_CIPHER_CTX_type EVP_CIPHER_CTX_get_type
   --  arg-macro: procedure EVP_CIPHER_CTX_flags (c)
   --    EVP_CIPHER_get_flags(EVP_CIPHER_CTX_get0_cipher(c))
   --  arg-macro: procedure EVP_CIPHER_CTX_get_mode (c)
   --    EVP_CIPHER_get_mode(EVP_CIPHER_CTX_get0_cipher(c))
   --  unsupported macro: EVP_CIPHER_CTX_mode EVP_CIPHER_CTX_get_mode
   --  arg-macro: function EVP_ENCODE_LENGTH (l)
   --    return (((l)+2)/3*4)+((l)/48+1)*2+80;
   --  arg-macro: function EVP_DECODE_LENGTH (l)
   --    return ((l)+3)/4*3+80;
   --  arg-macro: procedure EVP_SignInit_ex (a, b, c)
   --    EVP_DigestInit_ex(a,b,c)
   --  arg-macro: procedure EVP_SignInit (a, b)
   --    EVP_DigestInit(a,b)
   --  arg-macro: procedure EVP_SignUpdate (a, b, c)
   --    EVP_DigestUpdate(a,b,c)
   --  arg-macro: procedure EVP_VerifyInit_ex (a, b, c)
   --    EVP_DigestInit_ex(a,b,c)
   --  arg-macro: procedure EVP_VerifyInit (a, b)
   --    EVP_DigestInit(a,b)
   --  arg-macro: procedure EVP_VerifyUpdate (a, b, c)
   --    EVP_DigestUpdate(a,b,c)
   --  arg-macro: procedure EVP_OpenUpdate (a, b, c, d, e)
   --    EVP_DecryptUpdate(a,b,c,d,e)
   --  arg-macro: procedure EVP_SealUpdate (a, b, c, d, e)
   --    EVP_EncryptUpdate(a,b,c,d,e)
   --  arg-macro: procedure BIO_set_md (b, md)
   --    BIO_ctrl(b,BIO_C_SET_MD,0,(void *)(md))
   --  arg-macro: procedure BIO_get_md (b, mdp)
   --    BIO_ctrl(b,BIO_C_GET_MD,0,(mdp))
   --  arg-macro: procedure BIO_get_md_ctx (b, mdcp)
   --    BIO_ctrl(b,BIO_C_GET_MD_CTX,0,(mdcp))
   --  arg-macro: procedure BIO_set_md_ctx (b, mdcp)
   --    BIO_ctrl(b,BIO_C_SET_MD_CTX,0,(mdcp))
   --  arg-macro: procedure BIO_get_cipher_status (b)
   --    BIO_ctrl(b,BIO_C_GET_CIPHER_STATUS,0,NULL)
   --  arg-macro: procedure BIO_get_cipher_ctx (b, c_pp)
   --    BIO_ctrl(b,BIO_C_GET_CIPHER_CTX,0,(c_pp))
   --  arg-macro: procedure EVP_add_cipher_alias (n, alias)
   --    OBJ_NAME_add((alias),OBJ_NAME_TYPE_CIPHER_METHorOBJ_NAME_ALIAS,(n))
   --  arg-macro: procedure EVP_add_digest_alias (n, alias)
   --    OBJ_NAME_add((alias),OBJ_NAME_TYPE_MD_METHorOBJ_NAME_ALIAS,(n))
   --  arg-macro: procedure EVP_delete_cipher_alias (alias)
   --    OBJ_NAME_remove(alias,OBJ_NAME_TYPE_CIPHER_METHorOBJ_NAME_ALIAS);
   --  arg-macro: procedure EVP_delete_digest_alias (alias)
   --    OBJ_NAME_remove(alias,OBJ_NAME_TYPE_MD_METHorOBJ_NAME_ALIAS);
   --  arg-macro: procedure EVP_MD_CTX_create ()
   --    EVP_MD_CTX_new()
   --  arg-macro: procedure EVP_MD_CTX_init (ctx)
   --    EVP_MD_CTX_reset((ctx))
   --  arg-macro: procedure EVP_MD_CTX_destroy (ctx)
   --    EVP_MD_CTX_free((ctx))
   --  arg-macro: procedure EVP_CIPHER_CTX_init (c)
   --    EVP_CIPHER_CTX_reset(c)
   --  arg-macro: procedure EVP_CIPHER_CTX_cleanup (c)
   --    EVP_CIPHER_CTX_reset(c)
   --  unsupported macro: EVP_des_cfb EVP_des_cfb64
   --  unsupported macro: EVP_des_ede_cfb EVP_des_ede_cfb64
   --  unsupported macro: EVP_des_ede3_cfb EVP_des_ede3_cfb64
   --  unsupported macro: EVP_idea_cfb EVP_idea_cfb64
   --  unsupported macro: EVP_rc2_cfb EVP_rc2_cfb64
   --  unsupported macro: EVP_bf_cfb EVP_bf_cfb64
   --  unsupported macro: EVP_cast5_cfb EVP_cast5_cfb64
   --  unsupported macro: EVP_aes_128_cfb EVP_aes_128_cfb128
   --  unsupported macro: EVP_aes_192_cfb EVP_aes_192_cfb128
   --  unsupported macro: EVP_aes_256_cfb EVP_aes_256_cfb128
   --  unsupported macro: EVP_aria_128_cfb EVP_aria_128_cfb128
   --  unsupported macro: EVP_aria_192_cfb EVP_aria_192_cfb128
   --  unsupported macro: EVP_aria_256_cfb EVP_aria_256_cfb128
   --  unsupported macro: EVP_camellia_128_cfb EVP_camellia_128_cfb128
   --  unsupported macro: EVP_camellia_192_cfb EVP_camellia_192_cfb128
   --  unsupported macro: EVP_camellia_256_cfb EVP_camellia_256_cfb128
   --  unsupported macro: EVP_seed_cfb EVP_seed_cfb128
   --  unsupported macro: EVP_sm4_cfb EVP_sm4_cfb128
   --  arg-macro: procedure OPENSSL_add_all_algorithms_conf ()
   --    OPENSSL_init_crypto(OPENSSL_INIT_ADD_ALL_CIPHERS or OPENSSL_INIT_ADD_ALL_DIGESTS or OPENSSL_INIT_LOAD_CONFIG, NULL)
   --  arg-macro: procedure OPENSSL_add_all_algorithms_noconf ()
   --    OPENSSL_init_crypto(OPENSSL_INIT_ADD_ALL_CIPHERS or OPENSSL_INIT_ADD_ALL_DIGESTS, NULL)
   --  arg-macro: procedure OpenSSL_add_all_algorithms ()
   --    OPENSSL_add_all_algorithms_noconf()
   --  arg-macro: procedure OpenSSL_add_all_ciphers ()
   --    OPENSSL_init_crypto(OPENSSL_INIT_ADD_ALL_CIPHERS, NULL)
   --  arg-macro: procedure OpenSSL_add_all_digests ()
   --    OPENSSL_init_crypto(OPENSSL_INIT_ADD_ALL_DIGESTS, NULL)
   --  arg-macro: procedure EVP_cleanup ()
   --    while(0) continue

   EVP_RAND_STATE_UNINITIALISED : constant := 0;  --  /usr/include/openssl/evp.h:1295
   EVP_RAND_STATE_READY : constant := 1;  --  /usr/include/openssl/evp.h:1296
   EVP_RAND_STATE_ERROR : constant := 2;  --  /usr/include/openssl/evp.h:1297
   --  unsupported macro: EVP_PKEY_id EVP_PKEY_get_id
   --  unsupported macro: EVP_PKEY_base_id EVP_PKEY_get_base_id
   --  unsupported macro: EVP_PKEY_bits EVP_PKEY_get_bits
   --  unsupported macro: EVP_PKEY_security_bits EVP_PKEY_get_security_bits
   --  unsupported macro: EVP_PKEY_size EVP_PKEY_get_size
   --  arg-macro: procedure EVP_PKEY_set1_tls_encodedpoint (pkey, pt, ptlen)
   --    EVP_PKEY_set1_encoded_public_key((pkey), (pt), (ptlen))
   --  arg-macro: procedure EVP_PKEY_get1_tls_encodedpoint (pkey, ppt)
   --    EVP_PKEY_get1_encoded_public_key((pkey), (ppt))

   EVP_PBE_TYPE_OUTER : constant := 16#0#;  --  /usr/include/openssl/evp.h:1535

   EVP_PBE_TYPE_PRF : constant := 16#1#;  --  /usr/include/openssl/evp.h:1537

   EVP_PBE_TYPE_KDF : constant := 16#2#;  --  /usr/include/openssl/evp.h:1539

   ASN1_PKEY_ALIAS : constant := 16#1#;  --  /usr/include/openssl/evp.h:1552
   ASN1_PKEY_DYNAMIC : constant := 16#2#;  --  /usr/include/openssl/evp.h:1553
   ASN1_PKEY_SIGPARAM_NULL : constant := 16#4#;  --  /usr/include/openssl/evp.h:1554

   ASN1_PKEY_CTRL_PKCS7_SIGN : constant := 16#1#;  --  /usr/include/openssl/evp.h:1556
   ASN1_PKEY_CTRL_PKCS7_ENCRYPT : constant := 16#2#;  --  /usr/include/openssl/evp.h:1557
   ASN1_PKEY_CTRL_DEFAULT_MD_NID : constant := 16#3#;  --  /usr/include/openssl/evp.h:1558
   ASN1_PKEY_CTRL_CMS_SIGN : constant := 16#5#;  --  /usr/include/openssl/evp.h:1559
   ASN1_PKEY_CTRL_CMS_ENVELOPE : constant := 16#7#;  --  /usr/include/openssl/evp.h:1560
   ASN1_PKEY_CTRL_CMS_RI_TYPE : constant := 16#8#;  --  /usr/include/openssl/evp.h:1561

   ASN1_PKEY_CTRL_SET1_TLS_ENCPT : constant := 16#9#;  --  /usr/include/openssl/evp.h:1563
   ASN1_PKEY_CTRL_GET1_TLS_ENCPT : constant := 16#a#;  --  /usr/include/openssl/evp.h:1564
   ASN1_PKEY_CTRL_CMS_IS_RI_TYPE_SUPPORTED : constant := 16#b#;  --  /usr/include/openssl/evp.h:1565

   EVP_PKEY_OP_UNDEFINED : constant := 0;  --  /usr/include/openssl/evp.h:1690
   EVP_PKEY_OP_PARAMGEN : constant := (2**1);  --  /usr/include/openssl/evp.h:1691
   EVP_PKEY_OP_KEYGEN : constant := (2**2);  --  /usr/include/openssl/evp.h:1692
   EVP_PKEY_OP_FROMDATA : constant := (2**3);  --  /usr/include/openssl/evp.h:1693
   EVP_PKEY_OP_SIGN : constant := (2**4);  --  /usr/include/openssl/evp.h:1694
   EVP_PKEY_OP_VERIFY : constant := (2**5);  --  /usr/include/openssl/evp.h:1695
   EVP_PKEY_OP_VERIFYRECOVER : constant := (2**6);  --  /usr/include/openssl/evp.h:1696
   EVP_PKEY_OP_SIGNCTX : constant := (2**7);  --  /usr/include/openssl/evp.h:1697
   EVP_PKEY_OP_VERIFYCTX : constant := (2**8);  --  /usr/include/openssl/evp.h:1698
   EVP_PKEY_OP_ENCRYPT : constant := (2**9);  --  /usr/include/openssl/evp.h:1699
   EVP_PKEY_OP_DECRYPT : constant := (2**10);  --  /usr/include/openssl/evp.h:1700
   EVP_PKEY_OP_DERIVE : constant := (2**11);  --  /usr/include/openssl/evp.h:1701
   EVP_PKEY_OP_ENCAPSULATE : constant := (2**12);  --  /usr/include/openssl/evp.h:1702
   EVP_PKEY_OP_DECAPSULATE : constant := (2**13);  --  /usr/include/openssl/evp.h:1703
   --  unsupported macro: EVP_PKEY_OP_TYPE_SIG (EVP_PKEY_OP_SIGN | EVP_PKEY_OP_VERIFY | EVP_PKEY_OP_VERIFYRECOVER | EVP_PKEY_OP_SIGNCTX | EVP_PKEY_OP_VERIFYCTX)
   --  unsupported macro: EVP_PKEY_OP_TYPE_CRYPT (EVP_PKEY_OP_ENCRYPT | EVP_PKEY_OP_DECRYPT)
   --  unsupported macro: EVP_PKEY_OP_TYPE_NOGEN (EVP_PKEY_OP_TYPE_SIG | EVP_PKEY_OP_TYPE_CRYPT | EVP_PKEY_OP_DERIVE)
   --  unsupported macro: EVP_PKEY_OP_TYPE_GEN (EVP_PKEY_OP_PARAMGEN | EVP_PKEY_OP_KEYGEN)

   EVP_PKEY_CTRL_MD : constant := 1;  --  /usr/include/openssl/evp.h:1722
   EVP_PKEY_CTRL_PEER_KEY : constant := 2;  --  /usr/include/openssl/evp.h:1723
   EVP_PKEY_CTRL_SET_MAC_KEY : constant := 6;  --  /usr/include/openssl/evp.h:1724
   EVP_PKEY_CTRL_DIGESTINIT : constant := 7;  --  /usr/include/openssl/evp.h:1725

   EVP_PKEY_CTRL_SET_IV : constant := 8;  --  /usr/include/openssl/evp.h:1727

   EVP_PKEY_CTRL_PKCS7_ENCRYPT : constant := 3;  --  /usr/include/openssl/evp.h:1729
   EVP_PKEY_CTRL_PKCS7_DECRYPT : constant := 4;  --  /usr/include/openssl/evp.h:1730
   EVP_PKEY_CTRL_PKCS7_SIGN : constant := 5;  --  /usr/include/openssl/evp.h:1731
   EVP_PKEY_CTRL_CMS_ENCRYPT : constant := 9;  --  /usr/include/openssl/evp.h:1732
   EVP_PKEY_CTRL_CMS_DECRYPT : constant := 10;  --  /usr/include/openssl/evp.h:1733
   EVP_PKEY_CTRL_CMS_SIGN : constant := 11;  --  /usr/include/openssl/evp.h:1734

   EVP_PKEY_CTRL_CIPHER : constant := 12;  --  /usr/include/openssl/evp.h:1736
   EVP_PKEY_CTRL_GET_MD : constant := 13;  --  /usr/include/openssl/evp.h:1737
   EVP_PKEY_CTRL_SET_DIGEST_SIZE : constant := 14;  --  /usr/include/openssl/evp.h:1738
   EVP_PKEY_CTRL_SET1_ID : constant := 15;  --  /usr/include/openssl/evp.h:1739
   EVP_PKEY_CTRL_GET1_ID : constant := 16;  --  /usr/include/openssl/evp.h:1740
   EVP_PKEY_CTRL_GET1_ID_LEN : constant := 17;  --  /usr/include/openssl/evp.h:1741

   EVP_PKEY_ALG_CTRL : constant := 16#1000#;  --  /usr/include/openssl/evp.h:1743

   EVP_PKEY_FLAG_AUTOARGLEN : constant := 2;  --  /usr/include/openssl/evp.h:1745

   EVP_PKEY_FLAG_SIGCTX_CUSTOM : constant := 4;  --  /usr/include/openssl/evp.h:1749
   --  arg-macro: procedure EVP_PKEY_get_ex_new_index (l, p, newf, dupf, freef)
   --    CRYPTO_get_ex_new_index(CRYPTO_EX_INDEX_EVP_PKEY, l, p, newf, dupf, freef)

  -- * Copyright 1995-2023 The OpenSSL Project Authors. All Rights Reserved.
  -- *
  -- * Licensed under the Apache License 2.0 (the "License").  You may not use
  -- * this file except in compliance with the License.  You can obtain a copy
  -- * in the file LICENSE in the source distribution or at
  -- * https://www.openssl.org/source/license.html
  --  

  -- Default PKCS#5 iteration count  
  -- Special indicator that the object is uniquely provider side  
  -- Easy to use macros for EVP_PKEY related selections  
   function EVP_set_default_properties (libctx : access openssl_types_h.ossl_lib_ctx_st; propq : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:100
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_set_default_properties";

   function EVP_default_properties_is_fips_enabled (libctx : access openssl_types_h.ossl_lib_ctx_st) return int  -- /usr/include/openssl/evp.h:101
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_default_properties_is_fips_enabled";

   function EVP_default_properties_enable_fips (libctx : access openssl_types_h.ossl_lib_ctx_st; enable : int) return int  -- /usr/include/openssl/evp.h:102
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_default_properties_enable_fips";

   function EVP_MD_meth_new (md_type : int; pkey_type : int) return access openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:111
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_meth_new";

   function EVP_MD_meth_dup (md : access constant openssl_types_h.evp_md_st) return access openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:112
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_meth_dup";

   procedure EVP_MD_meth_free (md : access openssl_types_h.evp_md_st)  -- /usr/include/openssl/evp.h:113
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_meth_free";

   function EVP_MD_meth_set_input_blocksize (md : access openssl_types_h.evp_md_st; blocksize : int) return int  -- /usr/include/openssl/evp.h:115
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_meth_set_input_blocksize";

   function EVP_MD_meth_set_result_size (md : access openssl_types_h.evp_md_st; resultsize : int) return int  -- /usr/include/openssl/evp.h:117
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_meth_set_result_size";

   function EVP_MD_meth_set_app_datasize (md : access openssl_types_h.evp_md_st; datasize : int) return int  -- /usr/include/openssl/evp.h:119
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_meth_set_app_datasize";

   function EVP_MD_meth_set_flags (md : access openssl_types_h.evp_md_st; flags : unsigned_long) return int  -- /usr/include/openssl/evp.h:121
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_meth_set_flags";

   function EVP_MD_meth_set_init (md : access openssl_types_h.evp_md_st; init : access function (arg1 : access openssl_types_h.evp_md_ctx_st) return int) return int  -- /usr/include/openssl/evp.h:123
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_meth_set_init";

   function EVP_MD_meth_set_update (md : access openssl_types_h.evp_md_st; update : access function
        (arg1 : access openssl_types_h.evp_md_ctx_st;
         arg2 : System.Address;
         arg3 : stddef_h.size_t) return int) return int  -- /usr/include/openssl/evp.h:125
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_meth_set_update";

   function EVP_MD_meth_set_final (md : access openssl_types_h.evp_md_st; final : access function (arg1 : access openssl_types_h.evp_md_ctx_st; arg2 : access unsigned_char) return int) return int  -- /usr/include/openssl/evp.h:129
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_meth_set_final";

   function EVP_MD_meth_set_copy (md : access openssl_types_h.evp_md_st; copy : access function (arg1 : access openssl_types_h.evp_md_ctx_st; arg2 : access constant openssl_types_h.evp_md_ctx_st) return int) return int  -- /usr/include/openssl/evp.h:132
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_meth_set_copy";

   function EVP_MD_meth_set_cleanup (md : access openssl_types_h.evp_md_st; cleanup : access function (arg1 : access openssl_types_h.evp_md_ctx_st) return int) return int  -- /usr/include/openssl/evp.h:135
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_meth_set_cleanup";

   function EVP_MD_meth_set_ctrl (md : access openssl_types_h.evp_md_st; ctrl : access function
        (arg1 : access openssl_types_h.evp_md_ctx_st;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int) return int  -- /usr/include/openssl/evp.h:137
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_meth_set_ctrl";

   function EVP_MD_meth_get_input_blocksize (md : access constant openssl_types_h.evp_md_st) return int  -- /usr/include/openssl/evp.h:139
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_meth_get_input_blocksize";

   function EVP_MD_meth_get_result_size (md : access constant openssl_types_h.evp_md_st) return int  -- /usr/include/openssl/evp.h:140
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_meth_get_result_size";

   function EVP_MD_meth_get_app_datasize (md : access constant openssl_types_h.evp_md_st) return int  -- /usr/include/openssl/evp.h:141
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_meth_get_app_datasize";

   function EVP_MD_meth_get_flags (md : access constant openssl_types_h.evp_md_st) return unsigned_long  -- /usr/include/openssl/evp.h:142
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_meth_get_flags";

   function EVP_MD_meth_get_init (md : access constant openssl_types_h.evp_md_st) return access function (arg1 : access openssl_types_h.evp_md_ctx_st) return int  -- /usr/include/openssl/evp.h:144
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_meth_get_init";

   function EVP_MD_meth_get_update (md : access constant openssl_types_h.evp_md_st) return access function
        (arg1 : access openssl_types_h.evp_md_ctx_st;
         arg2 : System.Address;
         arg3 : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:146
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_meth_get_update";

   function EVP_MD_meth_get_final (md : access constant openssl_types_h.evp_md_st) return access function (arg1 : access openssl_types_h.evp_md_ctx_st; arg2 : access unsigned_char) return int  -- /usr/include/openssl/evp.h:149
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_meth_get_final";

   function EVP_MD_meth_get_copy (md : access constant openssl_types_h.evp_md_st) return access function (arg1 : access openssl_types_h.evp_md_ctx_st; arg2 : access constant openssl_types_h.evp_md_ctx_st) return int  -- /usr/include/openssl/evp.h:152
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_meth_get_copy";

   function EVP_MD_meth_get_cleanup (md : access constant openssl_types_h.evp_md_st) return access function (arg1 : access openssl_types_h.evp_md_ctx_st) return int  -- /usr/include/openssl/evp.h:155
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_meth_get_cleanup";

   function EVP_MD_meth_get_ctrl (md : access constant openssl_types_h.evp_md_st) return access function
        (arg1 : access openssl_types_h.evp_md_ctx_st;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int  -- /usr/include/openssl/evp.h:157
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_meth_get_ctrl";

  -- digest can only handle a single block  
  -- digest is extensible-output function, XOF  
  -- DigestAlgorithmIdentifier flags...  
  -- NULL or absent parameter accepted. Use NULL  
  -- NULL or absent parameter accepted. Use NULL for PKCS#1 otherwise absent  
  -- Custom handling via ctrl  
  -- Note if suitable for use in FIPS mode  
  -- Digest ctrls  
  -- Minimum Algorithm specific ctrl value  
  -- values for EVP_MD_CTX flags  
  -- * FIPS and pad options are ignored in 1.0.0, definitions are here so we
  -- * don't accidentally reuse the values for other purposes.
  --  

  -- This flag has no effect from openssl-3.0 onwards  
  -- * The following PAD options are also currently ignored in 1.0.0, digest
  -- * parameters are handled through EVP_DigestSign*() and EVP_DigestVerify*()
  -- * instead.
  --  

  -- * Some functions such as EVP_DigestSign only finalise copies of internal
  -- * contexts so additional data can be included after the finalisation call.
  -- * This is inefficient if this functionality is not required: it is disabled
  -- * if the following flag is set.
  --  

  -- NOTE: 0x0400 and 0x0800 are reserved for internal usage  
   function EVP_CIPHER_meth_new
     (cipher_type : int;
      block_size : int;
      key_len : int) return access openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:236
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_meth_new";

   function EVP_CIPHER_meth_dup (cipher : access constant openssl_types_h.evp_cipher_st) return access openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:238
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_meth_dup";

   procedure EVP_CIPHER_meth_free (cipher : access openssl_types_h.evp_cipher_st)  -- /usr/include/openssl/evp.h:240
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_meth_free";

   function EVP_CIPHER_meth_set_iv_length (cipher : access openssl_types_h.evp_cipher_st; iv_len : int) return int  -- /usr/include/openssl/evp.h:242
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_meth_set_iv_length";

   function EVP_CIPHER_meth_set_flags (cipher : access openssl_types_h.evp_cipher_st; flags : unsigned_long) return int  -- /usr/include/openssl/evp.h:244
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_meth_set_flags";

   function EVP_CIPHER_meth_set_impl_ctx_size (cipher : access openssl_types_h.evp_cipher_st; ctx_size : int) return int  -- /usr/include/openssl/evp.h:246
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_meth_set_impl_ctx_size";

   function EVP_CIPHER_meth_set_init (cipher : access openssl_types_h.evp_cipher_st; init : access function
        (arg1 : access openssl_types_h.evp_cipher_ctx_st;
         arg2 : access unsigned_char;
         arg3 : access unsigned_char;
         arg4 : int) return int) return int  -- /usr/include/openssl/evp.h:248
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_meth_set_init";

   function EVP_CIPHER_meth_set_do_cipher (cipher : access openssl_types_h.evp_cipher_st; do_cipher : access function
        (arg1 : access openssl_types_h.evp_cipher_ctx_st;
         arg2 : access unsigned_char;
         arg3 : access unsigned_char;
         arg4 : stddef_h.size_t) return int) return int  -- /usr/include/openssl/evp.h:254
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_meth_set_do_cipher";

   function EVP_CIPHER_meth_set_cleanup (cipher : access openssl_types_h.evp_cipher_st; cleanup : access function (arg1 : access openssl_types_h.evp_cipher_ctx_st) return int) return int  -- /usr/include/openssl/evp.h:260
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_meth_set_cleanup";

   function EVP_CIPHER_meth_set_set_asn1_params (cipher : access openssl_types_h.evp_cipher_st; set_asn1_parameters : access function (arg1 : access openssl_types_h.evp_cipher_ctx_st; arg2 : access openssl_asn1_h.asn1_type_st) return int) return int  -- /usr/include/openssl/evp.h:263
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_meth_set_set_asn1_params";

   function EVP_CIPHER_meth_set_get_asn1_params (cipher : access openssl_types_h.evp_cipher_st; get_asn1_parameters : access function (arg1 : access openssl_types_h.evp_cipher_ctx_st; arg2 : access openssl_asn1_h.asn1_type_st) return int) return int  -- /usr/include/openssl/evp.h:267
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_meth_set_get_asn1_params";

   function EVP_CIPHER_meth_set_ctrl (cipher : access openssl_types_h.evp_cipher_st; ctrl : access function
        (arg1 : access openssl_types_h.evp_cipher_ctx_st;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int) return int  -- /usr/include/openssl/evp.h:271
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_meth_set_ctrl";

   function EVP_CIPHER_meth_get_init (cipher : access constant openssl_types_h.evp_cipher_st) return access function
        (arg1 : access openssl_types_h.evp_cipher_ctx_st;
         arg2 : access unsigned_char;
         arg3 : access unsigned_char;
         arg4 : int) return int  -- /usr/include/openssl/evp.h:275
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_meth_get_init";

   function EVP_CIPHER_meth_get_do_cipher (cipher : access constant openssl_types_h.evp_cipher_st) return access function
        (arg1 : access openssl_types_h.evp_cipher_ctx_st;
         arg2 : access unsigned_char;
         arg3 : access unsigned_char;
         arg4 : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:280
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_meth_get_do_cipher";

   function EVP_CIPHER_meth_get_cleanup (cipher : access constant openssl_types_h.evp_cipher_st) return access function (arg1 : access openssl_types_h.evp_cipher_ctx_st) return int  -- /usr/include/openssl/evp.h:285
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_meth_get_cleanup";

   function EVP_CIPHER_meth_get_set_asn1_params (cipher : access constant openssl_types_h.evp_cipher_st) return access function (arg1 : access openssl_types_h.evp_cipher_ctx_st; arg2 : access openssl_asn1_h.asn1_type_st) return int  -- /usr/include/openssl/evp.h:287
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_meth_get_set_asn1_params";

   function EVP_CIPHER_meth_get_get_asn1_params (cipher : access constant openssl_types_h.evp_cipher_st) return access function (arg1 : access openssl_types_h.evp_cipher_ctx_st; arg2 : access openssl_asn1_h.asn1_type_st) return int  -- /usr/include/openssl/evp.h:290
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_meth_get_get_asn1_params";

   function EVP_CIPHER_meth_get_ctrl (cipher : access constant openssl_types_h.evp_cipher_st) return access function
        (arg1 : access openssl_types_h.evp_cipher_ctx_st;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int  -- /usr/include/openssl/evp.h:293
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_meth_get_ctrl";

  -- Values for cipher flags  
  -- Modes for ciphers  
  -- Set if variable length cipher  
  -- Set if the iv handling should be done by the cipher itself  
  -- Set if the cipher's init() function should be called if key is NULL  
  -- Call ctrl() to init cipher parameters  
  -- Don't use standard key length function  
  -- Don't use standard block padding  
  -- cipher handles random key generation  
  -- cipher has its own additional copying logic  
  -- Don't use standard iv length function  
  -- Legacy and no longer relevant: Allow use default ASN1 get/set iv  
  -- Free:                                         0x1000  
  -- Buffer length in bits not bytes: CFB1 mode only  
  -- Deprecated FIPS flag: was 0x4000  
  -- Deprecated FIPS flag: was 0x8000  
  -- * Cipher handles any and all padding logic as well as finalisation.
  --  

  -- Cipher can handle pipeline operations  
  -- For provider implementations that handle  ASN1 get/set param themselves  
  -- For ciphers generating unprotected CMS attributes  
  -- For supplementary wrap cipher support  
  -- * Cipher context flag to indicate we can handle wrap mode: if allowed in
  -- * older applications it could overflow buffers.
  --  

  -- ctrl() values  
  -- * AEAD cipher deduces payload length and returns number of bytes required to
  -- * store MAC and eventual padding. Subsequent call to EVP_Cipher even
  -- * appends/verifies MAC.
  --  

  -- Used by composite AEAD ciphers, no-op in GCM, CCM...  
  -- Set the GCM invocation field, decrypt only  
  -- EVP_CTRL_SET_SBOX takes the char * specifying S-boxes  
  -- * EVP_CTRL_SBOX_USED takes a 'size_t' and 'char *', pointing at a
  -- * pre-allocated buffer with specified size
  --  

  -- EVP_CTRL_KEY_MESH takes 'size_t' number of bytes to mesh the key after,
  -- * 0 switches meshing off
  --  

  -- EVP_CTRL_BLOCK_PADDING_MODE takes the padding mode  
  -- Set the output buffers to use for a pipelined operation  
  -- Set the input buffers to use for a pipelined operation  
  -- Set the input buffer lengths to use for a pipelined operation  
  -- Get the IV length used by the cipher  
  -- 0x26 is unused  
  -- Tell the cipher it's doing a speed test (SIV disallows multiple ops)  
  -- Get the unprotectedAttrs from cipher ctx  
  -- Get the supplementary wrap cipher  
  -- TLSTREE key diversification  
  -- Padding modes  
  -- RFC 5246 defines additional data to be 13 bytes in length  
   type EVP_CTRL_TLS1_1_MULTIBLOCK_PARAM is record
      c_out : access unsigned_char;  -- /usr/include/openssl/evp.h:454
      inp : access unsigned_char;  -- /usr/include/openssl/evp.h:455
      len : aliased stddef_h.size_t;  -- /usr/include/openssl/evp.h:456
      interleave : aliased unsigned;  -- /usr/include/openssl/evp.h:457
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/openssl/evp.h:458

  -- GCM TLS constants  
  -- Length of fixed part of IV derived from PRF  
  -- Length of explicit part of IV part of TLS records  
  -- Length of tag for TLS  
  -- CCM TLS constants  
  -- Length of fixed part of IV derived from PRF  
  -- Length of explicit part of IV part of TLS records  
  -- Total length of CCM IV length for TLS  
  -- Length of tag for TLS  
  -- Length of CCM8 tag for TLS  
  -- Length of tag for TLS  
   type anon_array5197 is array (0 .. 15) of aliased unsigned_char;
   type evp_cipher_info_st is record
      cipher : access constant openssl_types_h.evp_cipher_st;  -- /usr/include/openssl/evp.h:484
      iv : aliased anon_array5197;  -- /usr/include/openssl/evp.h:485
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/openssl/evp.h:483

   subtype EVP_CIPHER_INFO is evp_cipher_info_st;  -- /usr/include/openssl/evp.h:486

  -- Password based encryption function  
   --  skipped function type EVP_PBE_KEYGEN

   --  skipped function type EVP_PBE_KEYGEN_EX

  -- Add some extra combinations  
   function EVP_MD_get_type (md : access constant openssl_types_h.evp_md_st) return int  -- /usr/include/openssl/evp.h:536
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_get_type";

   function EVP_MD_get0_name (md : access constant openssl_types_h.evp_md_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/evp.h:539
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_get0_name";

   function EVP_MD_get0_description (md : access constant openssl_types_h.evp_md_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/evp.h:541
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_get0_description";

   function EVP_MD_is_a (md : access constant openssl_types_h.evp_md_st; name : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:542
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_is_a";

   function EVP_MD_names_do_all
     (md : access constant openssl_types_h.evp_md_st;
      fn : access procedure (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : System.Address);
      data : System.Address) return int  -- /usr/include/openssl/evp.h:543
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_names_do_all";

   function EVP_MD_get0_provider (md : access constant openssl_types_h.evp_md_st) return access constant openssl_types_h.ossl_provider_st  -- /usr/include/openssl/evp.h:546
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_get0_provider";

   function EVP_MD_get_pkey_type (md : access constant openssl_types_h.evp_md_st) return int  -- /usr/include/openssl/evp.h:547
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_get_pkey_type";

   function EVP_MD_get_size (md : access constant openssl_types_h.evp_md_st) return int  -- /usr/include/openssl/evp.h:549
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_get_size";

   function EVP_MD_get_block_size (md : access constant openssl_types_h.evp_md_st) return int  -- /usr/include/openssl/evp.h:551
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_get_block_size";

   function EVP_MD_get_flags (md : access constant openssl_types_h.evp_md_st) return unsigned_long  -- /usr/include/openssl/evp.h:553
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_get_flags";

   function EVP_MD_CTX_get0_md (ctx : access constant openssl_types_h.evp_md_ctx_st) return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:556
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_CTX_get0_md";

   function EVP_MD_CTX_get1_md (ctx : access openssl_types_h.evp_md_ctx_st) return access openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:557
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_CTX_get1_md";

   function EVP_MD_CTX_md (ctx : access constant openssl_types_h.evp_md_ctx_st) return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:560
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_CTX_md";

   function EVP_MD_CTX_update_fn (ctx : access openssl_types_h.evp_md_ctx_st) return access function
        (arg1 : access openssl_types_h.evp_md_ctx_st;
         arg2 : System.Address;
         arg3 : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:562
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_CTX_update_fn";

   procedure EVP_MD_CTX_set_update_fn (ctx : access openssl_types_h.evp_md_ctx_st; update : access function
        (arg1 : access openssl_types_h.evp_md_ctx_st;
         arg2 : System.Address;
         arg3 : stddef_h.size_t) return int)  -- /usr/include/openssl/evp.h:565
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_CTX_set_update_fn";

   function EVP_MD_CTX_get_pkey_ctx (ctx : access constant openssl_types_h.evp_md_ctx_st) return access openssl_types_h.evp_pkey_ctx_st  -- /usr/include/openssl/evp.h:576
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_CTX_get_pkey_ctx";

   procedure EVP_MD_CTX_set_pkey_ctx (ctx : access openssl_types_h.evp_md_ctx_st; pctx : access openssl_types_h.evp_pkey_ctx_st)  -- /usr/include/openssl/evp.h:578
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_CTX_set_pkey_ctx";

   function EVP_MD_CTX_get0_md_data (ctx : access constant openssl_types_h.evp_md_ctx_st) return System.Address  -- /usr/include/openssl/evp.h:579
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_CTX_get0_md_data";

   function EVP_CIPHER_get_nid (cipher : access constant openssl_types_h.evp_cipher_st) return int  -- /usr/include/openssl/evp.h:582
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_get_nid";

   function EVP_CIPHER_get0_name (cipher : access constant openssl_types_h.evp_cipher_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/evp.h:584
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_get0_name";

   function EVP_CIPHER_get0_description (cipher : access constant openssl_types_h.evp_cipher_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/evp.h:586
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_get0_description";

   function EVP_CIPHER_is_a (cipher : access constant openssl_types_h.evp_cipher_st; name : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:587
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_is_a";

   function EVP_CIPHER_names_do_all
     (cipher : access constant openssl_types_h.evp_cipher_st;
      fn : access procedure (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : System.Address);
      data : System.Address) return int  -- /usr/include/openssl/evp.h:588
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_names_do_all";

   function EVP_CIPHER_get0_provider (cipher : access constant openssl_types_h.evp_cipher_st) return access constant openssl_types_h.ossl_provider_st  -- /usr/include/openssl/evp.h:591
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_get0_provider";

   function EVP_CIPHER_get_block_size (cipher : access constant openssl_types_h.evp_cipher_st) return int  -- /usr/include/openssl/evp.h:592
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_get_block_size";

   function EVP_CIPHER_impl_ctx_size (cipher : access constant openssl_types_h.evp_cipher_st) return int  -- /usr/include/openssl/evp.h:596
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_impl_ctx_size";

   function EVP_CIPHER_get_key_length (cipher : access constant openssl_types_h.evp_cipher_st) return int  -- /usr/include/openssl/evp.h:598
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_get_key_length";

   function EVP_CIPHER_get_iv_length (cipher : access constant openssl_types_h.evp_cipher_st) return int  -- /usr/include/openssl/evp.h:600
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_get_iv_length";

   function EVP_CIPHER_get_flags (cipher : access constant openssl_types_h.evp_cipher_st) return unsigned_long  -- /usr/include/openssl/evp.h:602
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_get_flags";

   function EVP_CIPHER_get_mode (cipher : access constant openssl_types_h.evp_cipher_st) return int  -- /usr/include/openssl/evp.h:604
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_get_mode";

   function EVP_CIPHER_get_type (cipher : access constant openssl_types_h.evp_cipher_st) return int  -- /usr/include/openssl/evp.h:606
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_get_type";

   function EVP_CIPHER_fetch
     (ctx : access openssl_types_h.ossl_lib_ctx_st;
      algorithm : Interfaces.C.Strings.chars_ptr;
      properties : Interfaces.C.Strings.chars_ptr) return access openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:608
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_fetch";

   function EVP_CIPHER_up_ref (cipher : access openssl_types_h.evp_cipher_st) return int  -- /usr/include/openssl/evp.h:610
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_up_ref";

   procedure EVP_CIPHER_free (cipher : access openssl_types_h.evp_cipher_st)  -- /usr/include/openssl/evp.h:611
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_free";

   function EVP_CIPHER_CTX_get0_cipher (ctx : access constant openssl_types_h.evp_cipher_ctx_st) return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:613
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_get0_cipher";

   function EVP_CIPHER_CTX_get1_cipher (ctx : access openssl_types_h.evp_cipher_ctx_st) return access openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:614
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_get1_cipher";

   function EVP_CIPHER_CTX_is_encrypting (ctx : access constant openssl_types_h.evp_cipher_ctx_st) return int  -- /usr/include/openssl/evp.h:615
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_is_encrypting";

   function EVP_CIPHER_CTX_get_nid (ctx : access constant openssl_types_h.evp_cipher_ctx_st) return int  -- /usr/include/openssl/evp.h:617
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_get_nid";

   function EVP_CIPHER_CTX_get_block_size (ctx : access constant openssl_types_h.evp_cipher_ctx_st) return int  -- /usr/include/openssl/evp.h:619
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_get_block_size";

   function EVP_CIPHER_CTX_get_key_length (ctx : access constant openssl_types_h.evp_cipher_ctx_st) return int  -- /usr/include/openssl/evp.h:621
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_get_key_length";

   function EVP_CIPHER_CTX_get_iv_length (ctx : access constant openssl_types_h.evp_cipher_ctx_st) return int  -- /usr/include/openssl/evp.h:623
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_get_iv_length";

   function EVP_CIPHER_CTX_get_tag_length (ctx : access constant openssl_types_h.evp_cipher_ctx_st) return int  -- /usr/include/openssl/evp.h:625
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_get_tag_length";

   function EVP_CIPHER_CTX_cipher (ctx : access constant openssl_types_h.evp_cipher_ctx_st) return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:628
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_cipher";

   function EVP_CIPHER_CTX_iv (ctx : access constant openssl_types_h.evp_cipher_ctx_st) return access unsigned_char  -- /usr/include/openssl/evp.h:629
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_iv";

   function EVP_CIPHER_CTX_original_iv (ctx : access constant openssl_types_h.evp_cipher_ctx_st) return access unsigned_char  -- /usr/include/openssl/evp.h:630
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_original_iv";

   function EVP_CIPHER_CTX_iv_noconst (ctx : access openssl_types_h.evp_cipher_ctx_st) return access unsigned_char  -- /usr/include/openssl/evp.h:631
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_iv_noconst";

   function EVP_CIPHER_CTX_get_updated_iv
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      buf : System.Address;
      len : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:633
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_get_updated_iv";

   function EVP_CIPHER_CTX_get_original_iv
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      buf : System.Address;
      len : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:634
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_get_original_iv";

   function EVP_CIPHER_CTX_buf_noconst (ctx : access openssl_types_h.evp_cipher_ctx_st) return access unsigned_char  -- /usr/include/openssl/evp.h:637
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_buf_noconst";

   function EVP_CIPHER_CTX_get_num (ctx : access constant openssl_types_h.evp_cipher_ctx_st) return int  -- /usr/include/openssl/evp.h:639
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_get_num";

   function EVP_CIPHER_CTX_set_num (ctx : access openssl_types_h.evp_cipher_ctx_st; num : int) return int  -- /usr/include/openssl/evp.h:641
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_set_num";

   function EVP_CIPHER_CTX_dup (c_in : access constant openssl_types_h.evp_cipher_ctx_st) return access openssl_types_h.evp_cipher_ctx_st  -- /usr/include/openssl/evp.h:642
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_dup";

   function EVP_CIPHER_CTX_copy (c_out : access openssl_types_h.evp_cipher_ctx_st; c_in : access constant openssl_types_h.evp_cipher_ctx_st) return int  -- /usr/include/openssl/evp.h:643
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_copy";

   function EVP_CIPHER_CTX_get_app_data (ctx : access constant openssl_types_h.evp_cipher_ctx_st) return System.Address  -- /usr/include/openssl/evp.h:644
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_get_app_data";

   procedure EVP_CIPHER_CTX_set_app_data (ctx : access openssl_types_h.evp_cipher_ctx_st; data : System.Address)  -- /usr/include/openssl/evp.h:645
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_set_app_data";

   function EVP_CIPHER_CTX_get_cipher_data (ctx : access constant openssl_types_h.evp_cipher_ctx_st) return System.Address  -- /usr/include/openssl/evp.h:646
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_get_cipher_data";

   function EVP_CIPHER_CTX_set_cipher_data (ctx : access openssl_types_h.evp_cipher_ctx_st; cipher_data : System.Address) return System.Address  -- /usr/include/openssl/evp.h:647
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_set_cipher_data";

   function EVP_Cipher
     (c : access openssl_types_h.evp_cipher_ctx_st;
      c_out : access unsigned_char;
      c_in : access unsigned_char;
      inl : unsigned) return int  -- /usr/include/openssl/evp.h:680
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_Cipher";

   function EVP_MD_get_params (digest : access constant openssl_types_h.evp_md_st; params : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:693
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_get_params";

   function EVP_MD_CTX_set_params (ctx : access openssl_types_h.evp_md_ctx_st; params : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:694
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_CTX_set_params";

   function EVP_MD_CTX_get_params (ctx : access openssl_types_h.evp_md_ctx_st; params : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:695
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_CTX_get_params";

   function EVP_MD_gettable_params (digest : access constant openssl_types_h.evp_md_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:696
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_gettable_params";

   function EVP_MD_settable_ctx_params (md : access constant openssl_types_h.evp_md_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:697
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_settable_ctx_params";

   function EVP_MD_gettable_ctx_params (md : access constant openssl_types_h.evp_md_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:698
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_gettable_ctx_params";

   function EVP_MD_CTX_settable_params (ctx : access openssl_types_h.evp_md_ctx_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:699
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_CTX_settable_params";

   function EVP_MD_CTX_gettable_params (ctx : access openssl_types_h.evp_md_ctx_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:700
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_CTX_gettable_params";

   function EVP_MD_CTX_ctrl
     (ctx : access openssl_types_h.evp_md_ctx_st;
      cmd : int;
      p1 : int;
      p2 : System.Address) return int  -- /usr/include/openssl/evp.h:701
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_CTX_ctrl";

   function EVP_MD_CTX_new return access openssl_types_h.evp_md_ctx_st  -- /usr/include/openssl/evp.h:702
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_CTX_new";

   function EVP_MD_CTX_reset (ctx : access openssl_types_h.evp_md_ctx_st) return int  -- /usr/include/openssl/evp.h:703
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_CTX_reset";

   procedure EVP_MD_CTX_free (ctx : access openssl_types_h.evp_md_ctx_st)  -- /usr/include/openssl/evp.h:704
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_CTX_free";

   function EVP_MD_CTX_dup (c_in : access constant openssl_types_h.evp_md_ctx_st) return access openssl_types_h.evp_md_ctx_st  -- /usr/include/openssl/evp.h:708
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_CTX_dup";

   function EVP_MD_CTX_copy_ex (c_out : access openssl_types_h.evp_md_ctx_st; c_in : access constant openssl_types_h.evp_md_ctx_st) return int  -- /usr/include/openssl/evp.h:709
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_CTX_copy_ex";

   procedure EVP_MD_CTX_set_flags (ctx : access openssl_types_h.evp_md_ctx_st; flags : int)  -- /usr/include/openssl/evp.h:710
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_CTX_set_flags";

   procedure EVP_MD_CTX_clear_flags (ctx : access openssl_types_h.evp_md_ctx_st; flags : int)  -- /usr/include/openssl/evp.h:711
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_CTX_clear_flags";

   function EVP_MD_CTX_test_flags (ctx : access constant openssl_types_h.evp_md_ctx_st; flags : int) return int  -- /usr/include/openssl/evp.h:712
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_CTX_test_flags";

   function EVP_DigestInit_ex2
     (ctx : access openssl_types_h.evp_md_ctx_st;
      c_type : access constant openssl_types_h.evp_md_st;
      params : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:713
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DigestInit_ex2";

   function EVP_DigestInit_ex
     (ctx : access openssl_types_h.evp_md_ctx_st;
      c_type : access constant openssl_types_h.evp_md_st;
      impl : access openssl_types_h.engine_st) return int  -- /usr/include/openssl/evp.h:715
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DigestInit_ex";

   function EVP_DigestUpdate
     (ctx : access openssl_types_h.evp_md_ctx_st;
      d : System.Address;
      cnt : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:717
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DigestUpdate";

   function EVP_DigestFinal_ex
     (ctx : access openssl_types_h.evp_md_ctx_st;
      md : access unsigned_char;
      s : access unsigned) return int  -- /usr/include/openssl/evp.h:719
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DigestFinal_ex";

   function EVP_Digest
     (data : System.Address;
      count : stddef_h.size_t;
      md : access unsigned_char;
      size : access unsigned;
      c_type : access constant openssl_types_h.evp_md_st;
      impl : access openssl_types_h.engine_st) return int  -- /usr/include/openssl/evp.h:721
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_Digest";

   function EVP_Q_digest
     (libctx : access openssl_types_h.ossl_lib_ctx_st;
      name : Interfaces.C.Strings.chars_ptr;
      propq : Interfaces.C.Strings.chars_ptr;
      data : System.Address;
      datalen : stddef_h.size_t;
      md : access unsigned_char;
      mdlen : access stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:724
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_Q_digest";

   function EVP_MD_CTX_copy (c_out : access openssl_types_h.evp_md_ctx_st; c_in : access constant openssl_types_h.evp_md_ctx_st) return int  -- /usr/include/openssl/evp.h:728
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_CTX_copy";

   function EVP_DigestInit (ctx : access openssl_types_h.evp_md_ctx_st; c_type : access constant openssl_types_h.evp_md_st) return int  -- /usr/include/openssl/evp.h:729
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DigestInit";

   function EVP_DigestFinal
     (ctx : access openssl_types_h.evp_md_ctx_st;
      md : access unsigned_char;
      s : access unsigned) return int  -- /usr/include/openssl/evp.h:730
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DigestFinal";

   function EVP_DigestFinalXOF
     (ctx : access openssl_types_h.evp_md_ctx_st;
      md : access unsigned_char;
      len : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:732
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DigestFinalXOF";

   function EVP_MD_fetch
     (ctx : access openssl_types_h.ossl_lib_ctx_st;
      algorithm : Interfaces.C.Strings.chars_ptr;
      properties : Interfaces.C.Strings.chars_ptr) return access openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:735
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_fetch";

   function EVP_MD_up_ref (md : access openssl_types_h.evp_md_st) return int  -- /usr/include/openssl/evp.h:738
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_up_ref";

   procedure EVP_MD_free (md : access openssl_types_h.evp_md_st)  -- /usr/include/openssl/evp.h:739
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_free";

   function EVP_read_pw_string
     (buf : Interfaces.C.Strings.chars_ptr;
      length : int;
      prompt : Interfaces.C.Strings.chars_ptr;
      verify : int) return int  -- /usr/include/openssl/evp.h:741
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_read_pw_string";

   function EVP_read_pw_string_min
     (buf : Interfaces.C.Strings.chars_ptr;
      minlen : int;
      maxlen : int;
      prompt : Interfaces.C.Strings.chars_ptr;
      verify : int) return int  -- /usr/include/openssl/evp.h:742
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_read_pw_string_min";

   procedure EVP_set_pw_prompt (prompt : Interfaces.C.Strings.chars_ptr)  -- /usr/include/openssl/evp.h:744
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_set_pw_prompt";

   function EVP_get_pw_prompt return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/evp.h:745
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_get_pw_prompt";

   function EVP_BytesToKey
     (c_type : access constant openssl_types_h.evp_cipher_st;
      md : access constant openssl_types_h.evp_md_st;
      salt : access unsigned_char;
      data : access unsigned_char;
      datal : int;
      count : int;
      key : access unsigned_char;
      iv : access unsigned_char) return int  -- /usr/include/openssl/evp.h:747
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_BytesToKey";

   procedure EVP_CIPHER_CTX_set_flags (ctx : access openssl_types_h.evp_cipher_ctx_st; flags : int)  -- /usr/include/openssl/evp.h:752
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_set_flags";

   procedure EVP_CIPHER_CTX_clear_flags (ctx : access openssl_types_h.evp_cipher_ctx_st; flags : int)  -- /usr/include/openssl/evp.h:753
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_clear_flags";

   function EVP_CIPHER_CTX_test_flags (ctx : access constant openssl_types_h.evp_cipher_ctx_st; flags : int) return int  -- /usr/include/openssl/evp.h:754
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_test_flags";

   function EVP_EncryptInit
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      cipher : access constant openssl_types_h.evp_cipher_st;
      key : access unsigned_char;
      iv : access unsigned_char) return int  -- /usr/include/openssl/evp.h:756
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_EncryptInit";

   function EVP_EncryptInit_ex
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      cipher : access constant openssl_types_h.evp_cipher_st;
      impl : access openssl_types_h.engine_st;
      key : access unsigned_char;
      iv : access unsigned_char) return int  -- /usr/include/openssl/evp.h:758
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_EncryptInit_ex";

   function EVP_EncryptInit_ex2
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      cipher : access constant openssl_types_h.evp_cipher_st;
      key : access unsigned_char;
      iv : access unsigned_char;
      params : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:762
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_EncryptInit_ex2";

   function EVP_EncryptUpdate
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      c_out : access unsigned_char;
      outl : access int;
      c_in : access unsigned_char;
      inl : int) return int  -- /usr/include/openssl/evp.h:766
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_EncryptUpdate";

   function EVP_EncryptFinal_ex
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      c_out : access unsigned_char;
      outl : access int) return int  -- /usr/include/openssl/evp.h:768
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_EncryptFinal_ex";

   function EVP_EncryptFinal
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      c_out : access unsigned_char;
      outl : access int) return int  -- /usr/include/openssl/evp.h:770
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_EncryptFinal";

   function EVP_DecryptInit
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      cipher : access constant openssl_types_h.evp_cipher_st;
      key : access unsigned_char;
      iv : access unsigned_char) return int  -- /usr/include/openssl/evp.h:773
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DecryptInit";

   function EVP_DecryptInit_ex
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      cipher : access constant openssl_types_h.evp_cipher_st;
      impl : access openssl_types_h.engine_st;
      key : access unsigned_char;
      iv : access unsigned_char) return int  -- /usr/include/openssl/evp.h:775
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DecryptInit_ex";

   function EVP_DecryptInit_ex2
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      cipher : access constant openssl_types_h.evp_cipher_st;
      key : access unsigned_char;
      iv : access unsigned_char;
      params : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:779
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DecryptInit_ex2";

   function EVP_DecryptUpdate
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      c_out : access unsigned_char;
      outl : access int;
      c_in : access unsigned_char;
      inl : int) return int  -- /usr/include/openssl/evp.h:783
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DecryptUpdate";

   function EVP_DecryptFinal
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      outm : access unsigned_char;
      outl : access int) return int  -- /usr/include/openssl/evp.h:785
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DecryptFinal";

   function EVP_DecryptFinal_ex
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      outm : access unsigned_char;
      outl : access int) return int  -- /usr/include/openssl/evp.h:787
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DecryptFinal_ex";

   function EVP_CipherInit
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      cipher : access constant openssl_types_h.evp_cipher_st;
      key : access unsigned_char;
      iv : access unsigned_char;
      enc : int) return int  -- /usr/include/openssl/evp.h:790
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CipherInit";

   function EVP_CipherInit_ex
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      cipher : access constant openssl_types_h.evp_cipher_st;
      impl : access openssl_types_h.engine_st;
      key : access unsigned_char;
      iv : access unsigned_char;
      enc : int) return int  -- /usr/include/openssl/evp.h:793
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CipherInit_ex";

   function EVP_CipherInit_ex2
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      cipher : access constant openssl_types_h.evp_cipher_st;
      key : access unsigned_char;
      iv : access unsigned_char;
      enc : int;
      params : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:797
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CipherInit_ex2";

   function EVP_CipherUpdate
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      c_out : access unsigned_char;
      outl : access int;
      c_in : access unsigned_char;
      inl : int) return int  -- /usr/include/openssl/evp.h:800
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CipherUpdate";

   function EVP_CipherFinal
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      outm : access unsigned_char;
      outl : access int) return int  -- /usr/include/openssl/evp.h:802
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CipherFinal";

   function EVP_CipherFinal_ex
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      outm : access unsigned_char;
      outl : access int) return int  -- /usr/include/openssl/evp.h:804
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CipherFinal_ex";

   function EVP_SignFinal
     (ctx : access openssl_types_h.evp_md_ctx_st;
      md : access unsigned_char;
      s : access unsigned;
      pkey : access openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:807
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_SignFinal";

   function EVP_SignFinal_ex
     (ctx : access openssl_types_h.evp_md_ctx_st;
      md : access unsigned_char;
      s : access unsigned;
      pkey : access openssl_types_h.evp_pkey_st;
      libctx : access openssl_types_h.ossl_lib_ctx_st;
      propq : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:809
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_SignFinal_ex";

   function EVP_DigestSign
     (ctx : access openssl_types_h.evp_md_ctx_st;
      sigret : access unsigned_char;
      siglen : access stddef_h.size_t;
      tbs : access unsigned_char;
      tbslen : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:813
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DigestSign";

   function EVP_VerifyFinal
     (ctx : access openssl_types_h.evp_md_ctx_st;
      sigbuf : access unsigned_char;
      siglen : unsigned;
      pkey : access openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:817
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_VerifyFinal";

   function EVP_VerifyFinal_ex
     (ctx : access openssl_types_h.evp_md_ctx_st;
      sigbuf : access unsigned_char;
      siglen : unsigned;
      pkey : access openssl_types_h.evp_pkey_st;
      libctx : access openssl_types_h.ossl_lib_ctx_st;
      propq : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:819
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_VerifyFinal_ex";

   function EVP_DigestVerify
     (ctx : access openssl_types_h.evp_md_ctx_st;
      sigret : access unsigned_char;
      siglen : stddef_h.size_t;
      tbs : access unsigned_char;
      tbslen : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:823
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DigestVerify";

   function EVP_DigestSignInit_ex
     (ctx : access openssl_types_h.evp_md_ctx_st;
      pctx : System.Address;
      mdname : Interfaces.C.Strings.chars_ptr;
      libctx : access openssl_types_h.ossl_lib_ctx_st;
      props : Interfaces.C.Strings.chars_ptr;
      pkey : access openssl_types_h.evp_pkey_st;
      params : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:827
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DigestSignInit_ex";

   function EVP_DigestSignInit
     (ctx : access openssl_types_h.evp_md_ctx_st;
      pctx : System.Address;
      c_type : access constant openssl_types_h.evp_md_st;
      e : access openssl_types_h.engine_st;
      pkey : access openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:831
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DigestSignInit";

   function EVP_DigestSignUpdate
     (ctx : access openssl_types_h.evp_md_ctx_st;
      data : System.Address;
      dsize : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:834
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DigestSignUpdate";

   function EVP_DigestSignFinal
     (ctx : access openssl_types_h.evp_md_ctx_st;
      sigret : access unsigned_char;
      siglen : access stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:835
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DigestSignFinal";

   function EVP_DigestVerifyInit_ex
     (ctx : access openssl_types_h.evp_md_ctx_st;
      pctx : System.Address;
      mdname : Interfaces.C.Strings.chars_ptr;
      libctx : access openssl_types_h.ossl_lib_ctx_st;
      props : Interfaces.C.Strings.chars_ptr;
      pkey : access openssl_types_h.evp_pkey_st;
      params : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:838
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DigestVerifyInit_ex";

   function EVP_DigestVerifyInit
     (ctx : access openssl_types_h.evp_md_ctx_st;
      pctx : System.Address;
      c_type : access constant openssl_types_h.evp_md_st;
      e : access openssl_types_h.engine_st;
      pkey : access openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:842
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DigestVerifyInit";

   function EVP_DigestVerifyUpdate
     (ctx : access openssl_types_h.evp_md_ctx_st;
      data : System.Address;
      dsize : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:845
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DigestVerifyUpdate";

   function EVP_DigestVerifyFinal
     (ctx : access openssl_types_h.evp_md_ctx_st;
      sig : access unsigned_char;
      siglen : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:846
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DigestVerifyFinal";

   function EVP_OpenInit
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      c_type : access constant openssl_types_h.evp_cipher_st;
      ek : access unsigned_char;
      ekl : int;
      iv : access unsigned_char;
      priv : access openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:849
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_OpenInit";

   function EVP_OpenFinal
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      c_out : access unsigned_char;
      outl : access int) return int  -- /usr/include/openssl/evp.h:852
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_OpenFinal";

   function EVP_SealInit
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      c_type : access constant openssl_types_h.evp_cipher_st;
      ek : System.Address;
      ekl : access int;
      iv : access unsigned_char;
      pubk : System.Address;
      npubk : int) return int  -- /usr/include/openssl/evp.h:854
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_SealInit";

   function EVP_SealFinal
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      c_out : access unsigned_char;
      outl : access int) return int  -- /usr/include/openssl/evp.h:857
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_SealFinal";

   function EVP_ENCODE_CTX_new return access openssl_types_h.evp_Encode_Ctx_st  -- /usr/include/openssl/evp.h:859
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_ENCODE_CTX_new";

   procedure EVP_ENCODE_CTX_free (ctx : access openssl_types_h.evp_Encode_Ctx_st)  -- /usr/include/openssl/evp.h:860
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_ENCODE_CTX_free";

   function EVP_ENCODE_CTX_copy (dctx : access openssl_types_h.evp_Encode_Ctx_st; sctx : access constant openssl_types_h.evp_Encode_Ctx_st) return int  -- /usr/include/openssl/evp.h:861
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_ENCODE_CTX_copy";

   function EVP_ENCODE_CTX_num (ctx : access openssl_types_h.evp_Encode_Ctx_st) return int  -- /usr/include/openssl/evp.h:862
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_ENCODE_CTX_num";

   procedure EVP_EncodeInit (ctx : access openssl_types_h.evp_Encode_Ctx_st)  -- /usr/include/openssl/evp.h:863
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_EncodeInit";

   function EVP_EncodeUpdate
     (ctx : access openssl_types_h.evp_Encode_Ctx_st;
      c_out : access unsigned_char;
      outl : access int;
      c_in : access unsigned_char;
      inl : int) return int  -- /usr/include/openssl/evp.h:864
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_EncodeUpdate";

   procedure EVP_EncodeFinal
     (ctx : access openssl_types_h.evp_Encode_Ctx_st;
      c_out : access unsigned_char;
      outl : access int)  -- /usr/include/openssl/evp.h:866
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_EncodeFinal";

   function EVP_EncodeBlock
     (t : access unsigned_char;
      f : access unsigned_char;
      n : int) return int  -- /usr/include/openssl/evp.h:867
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_EncodeBlock";

   procedure EVP_DecodeInit (ctx : access openssl_types_h.evp_Encode_Ctx_st)  -- /usr/include/openssl/evp.h:869
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DecodeInit";

   function EVP_DecodeUpdate
     (ctx : access openssl_types_h.evp_Encode_Ctx_st;
      c_out : access unsigned_char;
      outl : access int;
      c_in : access unsigned_char;
      inl : int) return int  -- /usr/include/openssl/evp.h:870
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DecodeUpdate";

   function EVP_DecodeFinal
     (ctx : access openssl_types_h.evp_Encode_Ctx_st;
      c_out : access unsigned_char;
      outl : access int) return int  -- /usr/include/openssl/evp.h:872
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DecodeFinal";

   function EVP_DecodeBlock
     (t : access unsigned_char;
      f : access unsigned_char;
      n : int) return int  -- /usr/include/openssl/evp.h:874
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_DecodeBlock";

   function EVP_CIPHER_CTX_new return access openssl_types_h.evp_cipher_ctx_st  -- /usr/include/openssl/evp.h:880
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_new";

   function EVP_CIPHER_CTX_reset (c : access openssl_types_h.evp_cipher_ctx_st) return int  -- /usr/include/openssl/evp.h:881
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_reset";

   procedure EVP_CIPHER_CTX_free (c : access openssl_types_h.evp_cipher_ctx_st)  -- /usr/include/openssl/evp.h:882
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_free";

   function EVP_CIPHER_CTX_set_key_length (x : access openssl_types_h.evp_cipher_ctx_st; keylen : int) return int  -- /usr/include/openssl/evp.h:883
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_set_key_length";

   function EVP_CIPHER_CTX_set_padding (c : access openssl_types_h.evp_cipher_ctx_st; pad : int) return int  -- /usr/include/openssl/evp.h:884
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_set_padding";

   function EVP_CIPHER_CTX_ctrl
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      c_type : int;
      arg : int;
      ptr : System.Address) return int  -- /usr/include/openssl/evp.h:885
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_ctrl";

   function EVP_CIPHER_CTX_rand_key (ctx : access openssl_types_h.evp_cipher_ctx_st; key : access unsigned_char) return int  -- /usr/include/openssl/evp.h:886
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_rand_key";

   function EVP_CIPHER_get_params (cipher : access openssl_types_h.evp_cipher_st; params : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:887
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_get_params";

   function EVP_CIPHER_CTX_set_params (ctx : access openssl_types_h.evp_cipher_ctx_st; params : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:888
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_set_params";

   function EVP_CIPHER_CTX_get_params (ctx : access openssl_types_h.evp_cipher_ctx_st; params : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:889
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_get_params";

   function EVP_CIPHER_gettable_params (cipher : access constant openssl_types_h.evp_cipher_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:890
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_gettable_params";

   function EVP_CIPHER_settable_ctx_params (cipher : access constant openssl_types_h.evp_cipher_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:891
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_settable_ctx_params";

   function EVP_CIPHER_gettable_ctx_params (cipher : access constant openssl_types_h.evp_cipher_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:892
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_gettable_ctx_params";

   function EVP_CIPHER_CTX_settable_params (ctx : access openssl_types_h.evp_cipher_ctx_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:893
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_settable_params";

   function EVP_CIPHER_CTX_gettable_params (ctx : access openssl_types_h.evp_cipher_ctx_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:894
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_CTX_gettable_params";

   function BIO_f_md return access constant openssl_bio_h.bio_method_st  -- /usr/include/openssl/evp.h:896
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_f_md";

   function BIO_f_base64 return access constant openssl_bio_h.bio_method_st  -- /usr/include/openssl/evp.h:897
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_f_base64";

   function BIO_f_cipher return access constant openssl_bio_h.bio_method_st  -- /usr/include/openssl/evp.h:898
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_f_cipher";

   function BIO_f_reliable return access constant openssl_bio_h.bio_method_st  -- /usr/include/openssl/evp.h:899
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_f_reliable";

   function BIO_set_cipher
     (b : access openssl_types_h.bio_st;
      c : access constant openssl_types_h.evp_cipher_st;
      k : access unsigned_char;
      i : access unsigned_char;
      enc : int) return int  -- /usr/include/openssl/evp.h:900
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_set_cipher";

   function EVP_md_null return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:903
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_md_null";

   function EVP_md4 return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:908
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_md4";

   function EVP_md5 return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:911
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_md5";

   function EVP_md5_sha1 return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:912
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_md5_sha1";

   function EVP_blake2b512 return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:915
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_blake2b512";

   function EVP_blake2s256 return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:916
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_blake2s256";

   function EVP_sha1 return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:918
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_sha1";

   function EVP_sha224 return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:919
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_sha224";

   function EVP_sha256 return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:920
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_sha256";

   function EVP_sha384 return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:921
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_sha384";

   function EVP_sha512 return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:922
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_sha512";

   function EVP_sha512_224 return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:923
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_sha512_224";

   function EVP_sha512_256 return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:924
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_sha512_256";

   function EVP_sha3_224 return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:925
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_sha3_224";

   function EVP_sha3_256 return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:926
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_sha3_256";

   function EVP_sha3_384 return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:927
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_sha3_384";

   function EVP_sha3_512 return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:928
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_sha3_512";

   function EVP_shake128 return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:929
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_shake128";

   function EVP_shake256 return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:930
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_shake256";

   function EVP_mdc2 return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_mdc2";

   function EVP_ripemd160 return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:936
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_ripemd160";

   function EVP_whirlpool return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:939
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_whirlpool";

   function EVP_sm3 return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:942
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_sm3";

  -- does nothing :-)  
   function EVP_enc_null return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:944
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_enc_null";

   function EVP_des_ecb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:946
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_des_ecb";

   function EVP_des_ede return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:947
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_des_ede";

   function EVP_des_ede3 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:948
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_des_ede3";

   function EVP_des_ede_ecb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:949
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_des_ede_ecb";

   function EVP_des_ede3_ecb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:950
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_des_ede3_ecb";

   function EVP_des_cfb64 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:951
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_des_cfb64";

   function EVP_des_cfb1 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:953
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_des_cfb1";

   function EVP_des_cfb8 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:954
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_des_cfb8";

   function EVP_des_ede_cfb64 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:955
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_des_ede_cfb64";

   function EVP_des_ede3_cfb64 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:957
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_des_ede3_cfb64";

   function EVP_des_ede3_cfb1 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:959
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_des_ede3_cfb1";

   function EVP_des_ede3_cfb8 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:960
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_des_ede3_cfb8";

   function EVP_des_ofb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:961
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_des_ofb";

   function EVP_des_ede_ofb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:962
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_des_ede_ofb";

   function EVP_des_ede3_ofb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:963
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_des_ede3_ofb";

   function EVP_des_cbc return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:964
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_des_cbc";

   function EVP_des_ede_cbc return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:965
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_des_ede_cbc";

   function EVP_des_ede3_cbc return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:966
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_des_ede3_cbc";

   function EVP_desx_cbc return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:967
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_desx_cbc";

   function EVP_des_ede3_wrap return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:968
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_des_ede3_wrap";

  -- * This should now be supported through the dev_crypto ENGINE. But also, why
  -- * are rc4 and md5 declarations made here inside a "NO_DES" precompiler
  -- * branch?
  --  

   function EVP_rc4 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:976
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_rc4";

   function EVP_rc4_40 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:977
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_rc4_40";

   function EVP_rc4_hmac_md5 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:979
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_rc4_hmac_md5";

   function EVP_idea_ecb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:983
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_idea_ecb";

   function EVP_idea_cfb64 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:984
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_idea_cfb64";

   function EVP_idea_ofb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:986
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_idea_ofb";

   function EVP_idea_cbc return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:987
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_idea_cbc";

   function EVP_rc2_ecb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:990
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_rc2_ecb";

   function EVP_rc2_cbc return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:991
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_rc2_cbc";

   function EVP_rc2_40_cbc return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:992
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_rc2_40_cbc";

   function EVP_rc2_64_cbc return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:993
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_rc2_64_cbc";

   function EVP_rc2_cfb64 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:994
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_rc2_cfb64";

   function EVP_rc2_ofb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:996
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_rc2_ofb";

   function EVP_bf_ecb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:999
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_bf_ecb";

   function EVP_bf_cbc return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1000
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_bf_cbc";

   function EVP_bf_cfb64 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1001
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_bf_cfb64";

   function EVP_bf_ofb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1003
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_bf_ofb";

   function EVP_cast5_ecb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1006
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_cast5_ecb";

   function EVP_cast5_cbc return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1007
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_cast5_cbc";

   function EVP_cast5_cfb64 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1008
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_cast5_cfb64";

   function EVP_cast5_ofb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1010
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_cast5_ofb";

   function EVP_aes_128_ecb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1019
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_128_ecb";

   function EVP_aes_128_cbc return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1020
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_128_cbc";

   function EVP_aes_128_cfb1 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1021
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_128_cfb1";

   function EVP_aes_128_cfb8 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1022
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_128_cfb8";

   function EVP_aes_128_cfb128 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1023
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_128_cfb128";

   function EVP_aes_128_ofb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1025
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_128_ofb";

   function EVP_aes_128_ctr return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1026
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_128_ctr";

   function EVP_aes_128_ccm return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1027
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_128_ccm";

   function EVP_aes_128_gcm return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1028
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_128_gcm";

   function EVP_aes_128_xts return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1029
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_128_xts";

   function EVP_aes_128_wrap return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1030
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_128_wrap";

   function EVP_aes_128_wrap_pad return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1031
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_128_wrap_pad";

   function EVP_aes_128_ocb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1033
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_128_ocb";

   function EVP_aes_192_ecb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1035
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_192_ecb";

   function EVP_aes_192_cbc return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1036
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_192_cbc";

   function EVP_aes_192_cfb1 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1037
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_192_cfb1";

   function EVP_aes_192_cfb8 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1038
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_192_cfb8";

   function EVP_aes_192_cfb128 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1039
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_192_cfb128";

   function EVP_aes_192_ofb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1041
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_192_ofb";

   function EVP_aes_192_ctr return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1042
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_192_ctr";

   function EVP_aes_192_ccm return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1043
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_192_ccm";

   function EVP_aes_192_gcm return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1044
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_192_gcm";

   function EVP_aes_192_wrap return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1045
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_192_wrap";

   function EVP_aes_192_wrap_pad return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1046
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_192_wrap_pad";

   function EVP_aes_192_ocb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1048
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_192_ocb";

   function EVP_aes_256_ecb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1050
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_256_ecb";

   function EVP_aes_256_cbc return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1051
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_256_cbc";

   function EVP_aes_256_cfb1 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1052
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_256_cfb1";

   function EVP_aes_256_cfb8 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1053
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_256_cfb8";

   function EVP_aes_256_cfb128 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1054
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_256_cfb128";

   function EVP_aes_256_ofb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1056
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_256_ofb";

   function EVP_aes_256_ctr return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1057
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_256_ctr";

   function EVP_aes_256_ccm return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1058
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_256_ccm";

   function EVP_aes_256_gcm return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1059
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_256_gcm";

   function EVP_aes_256_xts return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1060
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_256_xts";

   function EVP_aes_256_wrap return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1061
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_256_wrap";

   function EVP_aes_256_wrap_pad return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1062
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_256_wrap_pad";

   function EVP_aes_256_ocb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1064
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_256_ocb";

   function EVP_aes_128_cbc_hmac_sha1 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1066
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_128_cbc_hmac_sha1";

   function EVP_aes_256_cbc_hmac_sha1 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1067
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_256_cbc_hmac_sha1";

   function EVP_aes_128_cbc_hmac_sha256 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1068
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_128_cbc_hmac_sha256";

   function EVP_aes_256_cbc_hmac_sha256 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1069
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aes_256_cbc_hmac_sha256";

   function EVP_aria_128_ecb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1071
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_128_ecb";

   function EVP_aria_128_cbc return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1072
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_128_cbc";

   function EVP_aria_128_cfb1 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1073
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_128_cfb1";

   function EVP_aria_128_cfb8 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1074
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_128_cfb8";

   function EVP_aria_128_cfb128 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1075
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_128_cfb128";

   function EVP_aria_128_ctr return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1077
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_128_ctr";

   function EVP_aria_128_ofb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1078
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_128_ofb";

   function EVP_aria_128_gcm return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1079
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_128_gcm";

   function EVP_aria_128_ccm return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1080
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_128_ccm";

   function EVP_aria_192_ecb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1081
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_192_ecb";

   function EVP_aria_192_cbc return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1082
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_192_cbc";

   function EVP_aria_192_cfb1 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1083
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_192_cfb1";

   function EVP_aria_192_cfb8 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1084
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_192_cfb8";

   function EVP_aria_192_cfb128 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1085
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_192_cfb128";

   function EVP_aria_192_ctr return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1087
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_192_ctr";

   function EVP_aria_192_ofb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1088
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_192_ofb";

   function EVP_aria_192_gcm return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1089
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_192_gcm";

   function EVP_aria_192_ccm return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1090
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_192_ccm";

   function EVP_aria_256_ecb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1091
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_256_ecb";

   function EVP_aria_256_cbc return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1092
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_256_cbc";

   function EVP_aria_256_cfb1 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1093
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_256_cfb1";

   function EVP_aria_256_cfb8 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1094
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_256_cfb8";

   function EVP_aria_256_cfb128 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1095
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_256_cfb128";

   function EVP_aria_256_ctr return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1097
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_256_ctr";

   function EVP_aria_256_ofb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1098
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_256_ofb";

   function EVP_aria_256_gcm return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1099
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_256_gcm";

   function EVP_aria_256_ccm return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1100
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_aria_256_ccm";

   function EVP_camellia_128_ecb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1103
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_camellia_128_ecb";

   function EVP_camellia_128_cbc return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1104
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_camellia_128_cbc";

   function EVP_camellia_128_cfb1 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1105
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_camellia_128_cfb1";

   function EVP_camellia_128_cfb8 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1106
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_camellia_128_cfb8";

   function EVP_camellia_128_cfb128 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1107
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_camellia_128_cfb128";

   function EVP_camellia_128_ofb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1109
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_camellia_128_ofb";

   function EVP_camellia_128_ctr return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1110
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_camellia_128_ctr";

   function EVP_camellia_192_ecb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1111
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_camellia_192_ecb";

   function EVP_camellia_192_cbc return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1112
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_camellia_192_cbc";

   function EVP_camellia_192_cfb1 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1113
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_camellia_192_cfb1";

   function EVP_camellia_192_cfb8 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1114
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_camellia_192_cfb8";

   function EVP_camellia_192_cfb128 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1115
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_camellia_192_cfb128";

   function EVP_camellia_192_ofb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1117
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_camellia_192_ofb";

   function EVP_camellia_192_ctr return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1118
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_camellia_192_ctr";

   function EVP_camellia_256_ecb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1119
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_camellia_256_ecb";

   function EVP_camellia_256_cbc return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1120
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_camellia_256_cbc";

   function EVP_camellia_256_cfb1 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1121
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_camellia_256_cfb1";

   function EVP_camellia_256_cfb8 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1122
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_camellia_256_cfb8";

   function EVP_camellia_256_cfb128 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1123
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_camellia_256_cfb128";

   function EVP_camellia_256_ofb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1125
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_camellia_256_ofb";

   function EVP_camellia_256_ctr return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1126
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_camellia_256_ctr";

   function EVP_chacha20 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1129
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_chacha20";

   function EVP_chacha20_poly1305 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1131
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_chacha20_poly1305";

   function EVP_seed_ecb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1136
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_seed_ecb";

   function EVP_seed_cbc return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1137
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_seed_cbc";

   function EVP_seed_cfb128 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1138
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_seed_cfb128";

   function EVP_seed_ofb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1140
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_seed_ofb";

   function EVP_sm4_ecb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1144
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_sm4_ecb";

   function EVP_sm4_cbc return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1145
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_sm4_cbc";

   function EVP_sm4_cfb128 return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1146
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_sm4_cfb128";

   function EVP_sm4_ofb return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1148
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_sm4_ofb";

   function EVP_sm4_ctr return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1149
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_sm4_ctr";

   function EVP_add_cipher (cipher : access constant openssl_types_h.evp_cipher_st) return int  -- /usr/include/openssl/evp.h:1175
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_add_cipher";

   function EVP_add_digest (digest : access constant openssl_types_h.evp_md_st) return int  -- /usr/include/openssl/evp.h:1176
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_add_digest";

   function EVP_get_cipherbyname (name : Interfaces.C.Strings.chars_ptr) return access constant openssl_types_h.evp_cipher_st  -- /usr/include/openssl/evp.h:1178
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_get_cipherbyname";

   function EVP_get_digestbyname (name : Interfaces.C.Strings.chars_ptr) return access constant openssl_types_h.evp_md_st  -- /usr/include/openssl/evp.h:1179
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_get_digestbyname";

   procedure EVP_CIPHER_do_all (fn : access procedure
        (arg1 : access constant openssl_types_h.evp_cipher_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : System.Address); arg : System.Address)  -- /usr/include/openssl/evp.h:1181
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_do_all";

   procedure EVP_CIPHER_do_all_sorted (fn : access procedure
        (arg1 : access constant openssl_types_h.evp_cipher_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : System.Address); arg : System.Address)  -- /usr/include/openssl/evp.h:1184
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_do_all_sorted";

   procedure EVP_CIPHER_do_all_provided
     (libctx : access openssl_types_h.ossl_lib_ctx_st;
      fn : access procedure (arg1 : access openssl_types_h.evp_cipher_st; arg2 : System.Address);
      arg : System.Address)  -- /usr/include/openssl/evp.h:1187
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_do_all_provided";

   procedure EVP_MD_do_all (fn : access procedure
        (arg1 : access constant openssl_types_h.evp_md_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : System.Address); arg : System.Address)  -- /usr/include/openssl/evp.h:1191
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_do_all";

   procedure EVP_MD_do_all_sorted (fn : access procedure
        (arg1 : access constant openssl_types_h.evp_md_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : System.Address); arg : System.Address)  -- /usr/include/openssl/evp.h:1194
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_do_all_sorted";

   procedure EVP_MD_do_all_provided
     (libctx : access openssl_types_h.ossl_lib_ctx_st;
      fn : access procedure (arg1 : access openssl_types_h.evp_md_st; arg2 : System.Address);
      arg : System.Address)  -- /usr/include/openssl/evp.h:1197
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MD_do_all_provided";

  -- MAC stuff  
   function EVP_MAC_fetch
     (libctx : access openssl_types_h.ossl_lib_ctx_st;
      algorithm : Interfaces.C.Strings.chars_ptr;
      properties : Interfaces.C.Strings.chars_ptr) return access openssl_types_h.evp_mac_st  -- /usr/include/openssl/evp.h:1203
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_fetch";

   function EVP_MAC_up_ref (mac : access openssl_types_h.evp_mac_st) return int  -- /usr/include/openssl/evp.h:1205
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_up_ref";

   procedure EVP_MAC_free (mac : access openssl_types_h.evp_mac_st)  -- /usr/include/openssl/evp.h:1206
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_free";

   function EVP_MAC_get0_name (mac : access constant openssl_types_h.evp_mac_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/evp.h:1207
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_get0_name";

   function EVP_MAC_get0_description (mac : access constant openssl_types_h.evp_mac_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/evp.h:1208
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_get0_description";

   function EVP_MAC_is_a (mac : access constant openssl_types_h.evp_mac_st; name : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:1209
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_is_a";

   function EVP_MAC_get0_provider (mac : access constant openssl_types_h.evp_mac_st) return access constant openssl_types_h.ossl_provider_st  -- /usr/include/openssl/evp.h:1210
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_get0_provider";

   function EVP_MAC_get_params (mac : access openssl_types_h.evp_mac_st; params : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:1211
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_get_params";

   function EVP_MAC_CTX_new (mac : access openssl_types_h.evp_mac_st) return access openssl_types_h.evp_mac_ctx_st  -- /usr/include/openssl/evp.h:1213
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_CTX_new";

   procedure EVP_MAC_CTX_free (ctx : access openssl_types_h.evp_mac_ctx_st)  -- /usr/include/openssl/evp.h:1214
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_CTX_free";

   function EVP_MAC_CTX_dup (src : access constant openssl_types_h.evp_mac_ctx_st) return access openssl_types_h.evp_mac_ctx_st  -- /usr/include/openssl/evp.h:1215
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_CTX_dup";

   function EVP_MAC_CTX_get0_mac (ctx : access openssl_types_h.evp_mac_ctx_st) return access openssl_types_h.evp_mac_st  -- /usr/include/openssl/evp.h:1216
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_CTX_get0_mac";

   function EVP_MAC_CTX_get_params (ctx : access openssl_types_h.evp_mac_ctx_st; params : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:1217
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_CTX_get_params";

   function EVP_MAC_CTX_set_params (ctx : access openssl_types_h.evp_mac_ctx_st; params : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:1218
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_CTX_set_params";

   function EVP_MAC_CTX_get_mac_size (ctx : access openssl_types_h.evp_mac_ctx_st) return stddef_h.size_t  -- /usr/include/openssl/evp.h:1220
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_CTX_get_mac_size";

   function EVP_MAC_CTX_get_block_size (ctx : access openssl_types_h.evp_mac_ctx_st) return stddef_h.size_t  -- /usr/include/openssl/evp.h:1221
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_CTX_get_block_size";

   function EVP_Q_mac
     (libctx : access openssl_types_h.ossl_lib_ctx_st;
      name : Interfaces.C.Strings.chars_ptr;
      propq : Interfaces.C.Strings.chars_ptr;
      subalg : Interfaces.C.Strings.chars_ptr;
      params : access constant openssl_core_h.ossl_param_st;
      key : System.Address;
      keylen : stddef_h.size_t;
      data : access unsigned_char;
      datalen : stddef_h.size_t;
      c_out : access unsigned_char;
      outsize : stddef_h.size_t;
      outlen : access stddef_h.size_t) return access unsigned_char  -- /usr/include/openssl/evp.h:1222
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_Q_mac";

   function EVP_MAC_init
     (ctx : access openssl_types_h.evp_mac_ctx_st;
      key : access unsigned_char;
      keylen : stddef_h.size_t;
      params : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:1227
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_init";

   function EVP_MAC_update
     (ctx : access openssl_types_h.evp_mac_ctx_st;
      data : access unsigned_char;
      datalen : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1229
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_update";

   function EVP_MAC_final
     (ctx : access openssl_types_h.evp_mac_ctx_st;
      c_out : access unsigned_char;
      outl : access stddef_h.size_t;
      outsize : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1230
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_final";

   function EVP_MAC_finalXOF
     (ctx : access openssl_types_h.evp_mac_ctx_st;
      c_out : access unsigned_char;
      outsize : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1232
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_finalXOF";

   function EVP_MAC_gettable_params (mac : access constant openssl_types_h.evp_mac_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1233
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_gettable_params";

   function EVP_MAC_gettable_ctx_params (mac : access constant openssl_types_h.evp_mac_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1234
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_gettable_ctx_params";

   function EVP_MAC_settable_ctx_params (mac : access constant openssl_types_h.evp_mac_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1235
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_settable_ctx_params";

   function EVP_MAC_CTX_gettable_params (ctx : access openssl_types_h.evp_mac_ctx_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1236
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_CTX_gettable_params";

   function EVP_MAC_CTX_settable_params (ctx : access openssl_types_h.evp_mac_ctx_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1237
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_CTX_settable_params";

   procedure EVP_MAC_do_all_provided
     (libctx : access openssl_types_h.ossl_lib_ctx_st;
      fn : access procedure (arg1 : access openssl_types_h.evp_mac_st; arg2 : System.Address);
      arg : System.Address)  -- /usr/include/openssl/evp.h:1239
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_do_all_provided";

   function EVP_MAC_names_do_all
     (mac : access constant openssl_types_h.evp_mac_st;
      fn : access procedure (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : System.Address);
      data : System.Address) return int  -- /usr/include/openssl/evp.h:1242
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_MAC_names_do_all";

  -- RAND stuff  
   function EVP_RAND_fetch
     (libctx : access openssl_types_h.ossl_lib_ctx_st;
      algorithm : Interfaces.C.Strings.chars_ptr;
      properties : Interfaces.C.Strings.chars_ptr) return access openssl_types_h.evp_rand_st  -- /usr/include/openssl/evp.h:1247
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_fetch";

   function EVP_RAND_up_ref (rand : access openssl_types_h.evp_rand_st) return int  -- /usr/include/openssl/evp.h:1249
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_up_ref";

   procedure EVP_RAND_free (rand : access openssl_types_h.evp_rand_st)  -- /usr/include/openssl/evp.h:1250
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_free";

   function EVP_RAND_get0_name (rand : access constant openssl_types_h.evp_rand_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/evp.h:1251
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_get0_name";

   function EVP_RAND_get0_description (md : access constant openssl_types_h.evp_rand_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/evp.h:1252
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_get0_description";

   function EVP_RAND_is_a (rand : access constant openssl_types_h.evp_rand_st; name : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:1253
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_is_a";

   function EVP_RAND_get0_provider (rand : access constant openssl_types_h.evp_rand_st) return access constant openssl_types_h.ossl_provider_st  -- /usr/include/openssl/evp.h:1254
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_get0_provider";

   function EVP_RAND_get_params (rand : access openssl_types_h.evp_rand_st; params : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:1255
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_get_params";

   function EVP_RAND_CTX_new (rand : access openssl_types_h.evp_rand_st; parent : access openssl_types_h.evp_rand_ctx_st) return access openssl_types_h.evp_rand_ctx_st  -- /usr/include/openssl/evp.h:1257
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_CTX_new";

   function EVP_RAND_CTX_up_ref (ctx : access openssl_types_h.evp_rand_ctx_st) return int  -- /usr/include/openssl/evp.h:1258
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_CTX_up_ref";

   procedure EVP_RAND_CTX_free (ctx : access openssl_types_h.evp_rand_ctx_st)  -- /usr/include/openssl/evp.h:1259
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_CTX_free";

   function EVP_RAND_CTX_get0_rand (ctx : access openssl_types_h.evp_rand_ctx_st) return access openssl_types_h.evp_rand_st  -- /usr/include/openssl/evp.h:1260
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_CTX_get0_rand";

   function EVP_RAND_CTX_get_params (ctx : access openssl_types_h.evp_rand_ctx_st; params : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:1261
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_CTX_get_params";

   function EVP_RAND_CTX_set_params (ctx : access openssl_types_h.evp_rand_ctx_st; params : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:1262
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_CTX_set_params";

   function EVP_RAND_gettable_params (rand : access constant openssl_types_h.evp_rand_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1263
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_gettable_params";

   function EVP_RAND_gettable_ctx_params (rand : access constant openssl_types_h.evp_rand_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1264
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_gettable_ctx_params";

   function EVP_RAND_settable_ctx_params (rand : access constant openssl_types_h.evp_rand_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1265
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_settable_ctx_params";

   function EVP_RAND_CTX_gettable_params (ctx : access openssl_types_h.evp_rand_ctx_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1266
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_CTX_gettable_params";

   function EVP_RAND_CTX_settable_params (ctx : access openssl_types_h.evp_rand_ctx_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1267
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_CTX_settable_params";

   procedure EVP_RAND_do_all_provided
     (libctx : access openssl_types_h.ossl_lib_ctx_st;
      fn : access procedure (arg1 : access openssl_types_h.evp_rand_st; arg2 : System.Address);
      arg : System.Address)  -- /usr/include/openssl/evp.h:1269
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_do_all_provided";

   function EVP_RAND_names_do_all
     (rand : access constant openssl_types_h.evp_rand_st;
      fn : access procedure (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : System.Address);
      data : System.Address) return int  -- /usr/include/openssl/evp.h:1272
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_names_do_all";

   function EVP_RAND_instantiate
     (ctx : access openssl_types_h.evp_rand_ctx_st;
      strength : unsigned;
      prediction_resistance : int;
      pstr : access unsigned_char;
      pstr_len : stddef_h.size_t;
      params : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:1276
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_instantiate";

   function EVP_RAND_uninstantiate (ctx : access openssl_types_h.evp_rand_ctx_st) return int  -- /usr/include/openssl/evp.h:1280
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_uninstantiate";

   function EVP_RAND_generate
     (ctx : access openssl_types_h.evp_rand_ctx_st;
      c_out : access unsigned_char;
      outlen : stddef_h.size_t;
      strength : unsigned;
      prediction_resistance : int;
      addin : access unsigned_char;
      addin_len : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1281
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_generate";

   function EVP_RAND_reseed
     (ctx : access openssl_types_h.evp_rand_ctx_st;
      prediction_resistance : int;
      ent : access unsigned_char;
      ent_len : stddef_h.size_t;
      addin : access unsigned_char;
      addin_len : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1285
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_reseed";

   function EVP_RAND_nonce
     (ctx : access openssl_types_h.evp_rand_ctx_st;
      c_out : access unsigned_char;
      outlen : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1288
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_nonce";

   function EVP_RAND_enable_locking (ctx : access openssl_types_h.evp_rand_ctx_st) return int  -- /usr/include/openssl/evp.h:1289
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_enable_locking";

   function EVP_RAND_verify_zeroization (ctx : access openssl_types_h.evp_rand_ctx_st) return int  -- /usr/include/openssl/evp.h:1291
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_verify_zeroization";

   function EVP_RAND_get_strength (ctx : access openssl_types_h.evp_rand_ctx_st) return unsigned  -- /usr/include/openssl/evp.h:1292
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_get_strength";

   function EVP_RAND_get_state (ctx : access openssl_types_h.evp_rand_ctx_st) return int  -- /usr/include/openssl/evp.h:1293
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_RAND_get_state";

  -- PKEY stuff  
   function EVP_PKEY_decrypt_old
     (dec_key : access unsigned_char;
      enc_key : access unsigned_char;
      enc_key_len : int;
      private_key : access openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:1301
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_decrypt_old";

   function EVP_PKEY_encrypt_old
     (enc_key : access unsigned_char;
      key : access unsigned_char;
      key_len : int;
      pub_key : access openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:1305
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_encrypt_old";

   function EVP_PKEY_is_a (pkey : access constant openssl_types_h.evp_pkey_st; name : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:1309
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_is_a";

   function EVP_PKEY_type_names_do_all
     (pkey : access constant openssl_types_h.evp_pkey_st;
      fn : access procedure (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : System.Address);
      data : System.Address) return int  -- /usr/include/openssl/evp.h:1310
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_type_names_do_all";

   function EVP_PKEY_type (c_type : int) return int  -- /usr/include/openssl/evp.h:1313
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_type";

   function EVP_PKEY_get_id (pkey : access constant openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:1314
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get_id";

   function EVP_PKEY_get_base_id (pkey : access constant openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:1316
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get_base_id";

   function EVP_PKEY_get_bits (pkey : access constant openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:1318
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get_bits";

   function EVP_PKEY_get_security_bits (pkey : access constant openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:1320
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get_security_bits";

   function EVP_PKEY_get_size (pkey : access constant openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:1322
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get_size";

   function EVP_PKEY_can_sign (pkey : access constant openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:1324
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_can_sign";

   function EVP_PKEY_set_type (pkey : access openssl_types_h.evp_pkey_st; c_type : int) return int  -- /usr/include/openssl/evp.h:1325
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_set_type";

   function EVP_PKEY_set_type_str
     (pkey : access openssl_types_h.evp_pkey_st;
      str : Interfaces.C.Strings.chars_ptr;
      len : int) return int  -- /usr/include/openssl/evp.h:1326
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_set_type_str";

   function EVP_PKEY_set_type_by_keymgmt (pkey : access openssl_types_h.evp_pkey_st; keymgmt : access openssl_types_h.evp_keymgmt_st) return int  -- /usr/include/openssl/evp.h:1327
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_set_type_by_keymgmt";

   function EVP_PKEY_set1_engine (pkey : access openssl_types_h.evp_pkey_st; e : access openssl_types_h.engine_st) return int  -- /usr/include/openssl/evp.h:1331
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_set1_engine";

   function EVP_PKEY_get0_engine (pkey : access constant openssl_types_h.evp_pkey_st) return access openssl_types_h.engine_st  -- /usr/include/openssl/evp.h:1333
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get0_engine";

   function EVP_PKEY_assign
     (pkey : access openssl_types_h.evp_pkey_st;
      c_type : int;
      key : System.Address) return int  -- /usr/include/openssl/evp.h:1336
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_assign";

   function EVP_PKEY_get0 (pkey : access constant openssl_types_h.evp_pkey_st) return System.Address  -- /usr/include/openssl/evp.h:1338
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get0";

   function EVP_PKEY_get0_hmac (pkey : access constant openssl_types_h.evp_pkey_st; len : access stddef_h.size_t) return access unsigned_char  -- /usr/include/openssl/evp.h:1340
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get0_hmac";

   function EVP_PKEY_get0_poly1305 (pkey : access constant openssl_types_h.evp_pkey_st; len : access stddef_h.size_t) return access unsigned_char  -- /usr/include/openssl/evp.h:1343
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get0_poly1305";

   function EVP_PKEY_get0_siphash (pkey : access constant openssl_types_h.evp_pkey_st; len : access stddef_h.size_t) return access unsigned_char  -- /usr/include/openssl/evp.h:1347
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get0_siphash";

   function EVP_PKEY_set1_RSA (pkey : access openssl_types_h.evp_pkey_st; key : access openssl_types_h.rsa_st) return int  -- /usr/include/openssl/evp.h:1352
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_set1_RSA";

   function EVP_PKEY_get0_RSA (pkey : access constant openssl_types_h.evp_pkey_st) return access constant openssl_types_h.rsa_st  -- /usr/include/openssl/evp.h:1354
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get0_RSA";

   function EVP_PKEY_get1_RSA (pkey : access openssl_types_h.evp_pkey_st) return access openssl_types_h.rsa_st  -- /usr/include/openssl/evp.h:1356
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get1_RSA";

   function EVP_PKEY_set1_DSA (pkey : access openssl_types_h.evp_pkey_st; key : access openssl_types_h.dsa_st) return int  -- /usr/include/openssl/evp.h:1361
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_set1_DSA";

   function EVP_PKEY_get0_DSA (pkey : access constant openssl_types_h.evp_pkey_st) return access constant openssl_types_h.dsa_st  -- /usr/include/openssl/evp.h:1363
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get0_DSA";

   function EVP_PKEY_get1_DSA (pkey : access openssl_types_h.evp_pkey_st) return access openssl_types_h.dsa_st  -- /usr/include/openssl/evp.h:1365
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get1_DSA";

   function EVP_PKEY_set1_DH (pkey : access openssl_types_h.evp_pkey_st; key : access openssl_types_h.dh_st) return int  -- /usr/include/openssl/evp.h:1370
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_set1_DH";

   function EVP_PKEY_get0_DH (pkey : access constant openssl_types_h.evp_pkey_st) return access constant openssl_types_h.dh_st  -- /usr/include/openssl/evp.h:1371
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get0_DH";

   function EVP_PKEY_get1_DH (pkey : access openssl_types_h.evp_pkey_st) return access openssl_types_h.dh_st  -- /usr/include/openssl/evp.h:1372
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get1_DH";

   function EVP_PKEY_set1_EC_KEY (pkey : access openssl_types_h.evp_pkey_st; key : access openssl_types_h.ec_key_st) return int  -- /usr/include/openssl/evp.h:1378
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_set1_EC_KEY";

   function EVP_PKEY_get0_EC_KEY (pkey : access constant openssl_types_h.evp_pkey_st) return access constant openssl_types_h.ec_key_st  -- /usr/include/openssl/evp.h:1380
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get0_EC_KEY";

   function EVP_PKEY_get1_EC_KEY (pkey : access openssl_types_h.evp_pkey_st) return access openssl_types_h.ec_key_st  -- /usr/include/openssl/evp.h:1382
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get1_EC_KEY";

   function EVP_PKEY_new return access openssl_types_h.evp_pkey_st  -- /usr/include/openssl/evp.h:1386
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_new";

   function EVP_PKEY_up_ref (pkey : access openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:1387
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_up_ref";

   function EVP_PKEY_dup (pkey : access openssl_types_h.evp_pkey_st) return access openssl_types_h.evp_pkey_st  -- /usr/include/openssl/evp.h:1388
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_dup";

   procedure EVP_PKEY_free (pkey : access openssl_types_h.evp_pkey_st)  -- /usr/include/openssl/evp.h:1389
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_free";

   function EVP_PKEY_get0_description (pkey : access constant openssl_types_h.evp_pkey_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/evp.h:1390
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get0_description";

   function EVP_PKEY_get0_provider (key : access constant openssl_types_h.evp_pkey_st) return access constant openssl_types_h.ossl_provider_st  -- /usr/include/openssl/evp.h:1391
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get0_provider";

   function d2i_PublicKey
     (c_type : int;
      a : System.Address;
      pp : System.Address;
      length : long) return access openssl_types_h.evp_pkey_st  -- /usr/include/openssl/evp.h:1393
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_PublicKey";

   function i2d_PublicKey (a : access constant openssl_types_h.evp_pkey_st; pp : System.Address) return int  -- /usr/include/openssl/evp.h:1395
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_PublicKey";

   function d2i_PrivateKey_ex
     (c_type : int;
      a : System.Address;
      pp : System.Address;
      length : long;
      libctx : access openssl_types_h.ossl_lib_ctx_st;
      propq : Interfaces.C.Strings.chars_ptr) return access openssl_types_h.evp_pkey_st  -- /usr/include/openssl/evp.h:1398
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_PrivateKey_ex";

   function d2i_PrivateKey
     (c_type : int;
      a : System.Address;
      pp : System.Address;
      length : long) return access openssl_types_h.evp_pkey_st  -- /usr/include/openssl/evp.h:1401
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_PrivateKey";

   function d2i_AutoPrivateKey_ex
     (a : System.Address;
      pp : System.Address;
      length : long;
      libctx : access openssl_types_h.ossl_lib_ctx_st;
      propq : Interfaces.C.Strings.chars_ptr) return access openssl_types_h.evp_pkey_st  -- /usr/include/openssl/evp.h:1403
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_AutoPrivateKey_ex";

   function d2i_AutoPrivateKey
     (a : System.Address;
      pp : System.Address;
      length : long) return access openssl_types_h.evp_pkey_st  -- /usr/include/openssl/evp.h:1406
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_AutoPrivateKey";

   function i2d_PrivateKey (a : access constant openssl_types_h.evp_pkey_st; pp : System.Address) return int  -- /usr/include/openssl/evp.h:1408
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_PrivateKey";

   function i2d_KeyParams (a : access constant openssl_types_h.evp_pkey_st; pp : System.Address) return int  -- /usr/include/openssl/evp.h:1410
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_KeyParams";

   function d2i_KeyParams
     (c_type : int;
      a : System.Address;
      pp : System.Address;
      length : long) return access openssl_types_h.evp_pkey_st  -- /usr/include/openssl/evp.h:1411
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_KeyParams";

   function i2d_KeyParams_bio (bp : access openssl_types_h.bio_st; pkey : access constant openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:1413
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_KeyParams_bio";

   function d2i_KeyParams_bio
     (c_type : int;
      a : System.Address;
      c_in : access openssl_types_h.bio_st) return access openssl_types_h.evp_pkey_st  -- /usr/include/openssl/evp.h:1414
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_KeyParams_bio";

   function EVP_PKEY_copy_parameters (to : access openssl_types_h.evp_pkey_st; from : access constant openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:1416
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_copy_parameters";

   function EVP_PKEY_missing_parameters (pkey : access constant openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:1417
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_missing_parameters";

   function EVP_PKEY_save_parameters (pkey : access openssl_types_h.evp_pkey_st; mode : int) return int  -- /usr/include/openssl/evp.h:1418
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_save_parameters";

   function EVP_PKEY_parameters_eq (a : access constant openssl_types_h.evp_pkey_st; b : access constant openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:1419
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_parameters_eq";

   function EVP_PKEY_eq (a : access constant openssl_types_h.evp_pkey_st; b : access constant openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:1420
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_eq";

   function EVP_PKEY_cmp_parameters (a : access constant openssl_types_h.evp_pkey_st; b : access constant openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:1424
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_cmp_parameters";

   function EVP_PKEY_cmp (a : access constant openssl_types_h.evp_pkey_st; b : access constant openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:1426
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_cmp";

   function EVP_PKEY_print_public
     (c_out : access openssl_types_h.bio_st;
      pkey : access constant openssl_types_h.evp_pkey_st;
      indent : int;
      pctx : access openssl_types_h.asn1_pctx_st) return int  -- /usr/include/openssl/evp.h:1429
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_print_public";

   function EVP_PKEY_print_private
     (c_out : access openssl_types_h.bio_st;
      pkey : access constant openssl_types_h.evp_pkey_st;
      indent : int;
      pctx : access openssl_types_h.asn1_pctx_st) return int  -- /usr/include/openssl/evp.h:1431
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_print_private";

   function EVP_PKEY_print_params
     (c_out : access openssl_types_h.bio_st;
      pkey : access constant openssl_types_h.evp_pkey_st;
      indent : int;
      pctx : access openssl_types_h.asn1_pctx_st) return int  -- /usr/include/openssl/evp.h:1433
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_print_params";

   function EVP_PKEY_print_public_fp
     (fp : access bits_types_struct_FILE_h.u_IO_FILE;
      pkey : access constant openssl_types_h.evp_pkey_st;
      indent : int;
      pctx : access openssl_types_h.asn1_pctx_st) return int  -- /usr/include/openssl/evp.h:1436
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_print_public_fp";

   function EVP_PKEY_print_private_fp
     (fp : access bits_types_struct_FILE_h.u_IO_FILE;
      pkey : access constant openssl_types_h.evp_pkey_st;
      indent : int;
      pctx : access openssl_types_h.asn1_pctx_st) return int  -- /usr/include/openssl/evp.h:1438
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_print_private_fp";

   function EVP_PKEY_print_params_fp
     (fp : access bits_types_struct_FILE_h.u_IO_FILE;
      pkey : access constant openssl_types_h.evp_pkey_st;
      indent : int;
      pctx : access openssl_types_h.asn1_pctx_st) return int  -- /usr/include/openssl/evp.h:1440
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_print_params_fp";

   function EVP_PKEY_get_default_digest_nid (pkey : access openssl_types_h.evp_pkey_st; pnid : access int) return int  -- /usr/include/openssl/evp.h:1444
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get_default_digest_nid";

   function EVP_PKEY_get_default_digest_name
     (pkey : access openssl_types_h.evp_pkey_st;
      mdname : Interfaces.C.Strings.chars_ptr;
      mdname_sz : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1445
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get_default_digest_name";

   function EVP_PKEY_digestsign_supports_digest
     (pkey : access openssl_types_h.evp_pkey_st;
      libctx : access openssl_types_h.ossl_lib_ctx_st;
      name : Interfaces.C.Strings.chars_ptr;
      propq : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:1447
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_digestsign_supports_digest";

  -- * For backwards compatibility. Use EVP_PKEY_set1_encoded_public_key in
  -- * preference
  --  

   function EVP_PKEY_set1_encoded_public_key
     (pkey : access openssl_types_h.evp_pkey_st;
      pub : access unsigned_char;
      publen : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1459
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_set1_encoded_public_key";

  -- * For backwards compatibility. Use EVP_PKEY_get1_encoded_public_key in
  -- * preference
  --  

   function EVP_PKEY_get1_encoded_public_key (pkey : access openssl_types_h.evp_pkey_st; ppub : System.Address) return stddef_h.size_t  -- /usr/include/openssl/evp.h:1471
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get1_encoded_public_key";

  -- calls methods  
   function EVP_CIPHER_param_to_asn1 (c : access openssl_types_h.evp_cipher_ctx_st; c_type : access openssl_asn1_h.asn1_type_st) return int  -- /usr/include/openssl/evp.h:1474
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_param_to_asn1";

   function EVP_CIPHER_asn1_to_param (c : access openssl_types_h.evp_cipher_ctx_st; c_type : access openssl_asn1_h.asn1_type_st) return int  -- /usr/include/openssl/evp.h:1475
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_asn1_to_param";

  -- These are used by EVP_CIPHER methods  
   function EVP_CIPHER_set_asn1_iv (c : access openssl_types_h.evp_cipher_ctx_st; c_type : access openssl_asn1_h.asn1_type_st) return int  -- /usr/include/openssl/evp.h:1478
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_set_asn1_iv";

   function EVP_CIPHER_get_asn1_iv (c : access openssl_types_h.evp_cipher_ctx_st; c_type : access openssl_asn1_h.asn1_type_st) return int  -- /usr/include/openssl/evp.h:1479
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_CIPHER_get_asn1_iv";

  -- PKCS5 password based encryption  
   function PKCS5_PBE_keyivgen
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      param : access openssl_asn1_h.asn1_type_st;
      cipher : access constant openssl_types_h.evp_cipher_st;
      md : access constant openssl_types_h.evp_md_st;
      en_de : int) return int  -- /usr/include/openssl/evp.h:1482
   with Import => True, 
        Convention => C, 
        External_Name => "PKCS5_PBE_keyivgen";

   function PKCS5_PBE_keyivgen_ex
     (cctx : access openssl_types_h.evp_cipher_ctx_st;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      param : access openssl_asn1_h.asn1_type_st;
      cipher : access constant openssl_types_h.evp_cipher_st;
      md : access constant openssl_types_h.evp_md_st;
      en_de : int;
      libctx : access openssl_types_h.ossl_lib_ctx_st;
      propq : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:1485
   with Import => True, 
        Convention => C, 
        External_Name => "PKCS5_PBE_keyivgen_ex";

   function PKCS5_PBKDF2_HMAC_SHA1
     (pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      salt : access unsigned_char;
      saltlen : int;
      iter : int;
      keylen : int;
      c_out : access unsigned_char) return int  -- /usr/include/openssl/evp.h:1489
   with Import => True, 
        Convention => C, 
        External_Name => "PKCS5_PBKDF2_HMAC_SHA1";

   function PKCS5_PBKDF2_HMAC
     (pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      salt : access unsigned_char;
      saltlen : int;
      iter : int;
      digest : access constant openssl_types_h.evp_md_st;
      keylen : int;
      c_out : access unsigned_char) return int  -- /usr/include/openssl/evp.h:1492
   with Import => True, 
        Convention => C, 
        External_Name => "PKCS5_PBKDF2_HMAC";

   function PKCS5_v2_PBE_keyivgen
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      param : access openssl_asn1_h.asn1_type_st;
      cipher : access constant openssl_types_h.evp_cipher_st;
      md : access constant openssl_types_h.evp_md_st;
      en_de : int) return int  -- /usr/include/openssl/evp.h:1495
   with Import => True, 
        Convention => C, 
        External_Name => "PKCS5_v2_PBE_keyivgen";

   function PKCS5_v2_PBE_keyivgen_ex
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      param : access openssl_asn1_h.asn1_type_st;
      cipher : access constant openssl_types_h.evp_cipher_st;
      md : access constant openssl_types_h.evp_md_st;
      en_de : int;
      libctx : access openssl_types_h.ossl_lib_ctx_st;
      propq : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:1498
   with Import => True, 
        Convention => C, 
        External_Name => "PKCS5_v2_PBE_keyivgen_ex";

   function EVP_PBE_scrypt
     (pass : Interfaces.C.Strings.chars_ptr;
      passlen : stddef_h.size_t;
      salt : access unsigned_char;
      saltlen : stddef_h.size_t;
      N : bits_stdint_uintn_h.uint64_t;
      r : bits_stdint_uintn_h.uint64_t;
      p : bits_stdint_uintn_h.uint64_t;
      maxmem : bits_stdint_uintn_h.uint64_t;
      key : access unsigned_char;
      keylen : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1504
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PBE_scrypt";

   function EVP_PBE_scrypt_ex
     (pass : Interfaces.C.Strings.chars_ptr;
      passlen : stddef_h.size_t;
      salt : access unsigned_char;
      saltlen : stddef_h.size_t;
      N : bits_stdint_uintn_h.uint64_t;
      r : bits_stdint_uintn_h.uint64_t;
      p : bits_stdint_uintn_h.uint64_t;
      maxmem : bits_stdint_uintn_h.uint64_t;
      key : access unsigned_char;
      keylen : stddef_h.size_t;
      ctx : access openssl_types_h.ossl_lib_ctx_st;
      propq : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:1508
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PBE_scrypt_ex";

   function PKCS5_v2_scrypt_keyivgen
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      param : access openssl_asn1_h.asn1_type_st;
      c : access constant openssl_types_h.evp_cipher_st;
      md : access constant openssl_types_h.evp_md_st;
      en_de : int) return int  -- /usr/include/openssl/evp.h:1514
   with Import => True, 
        Convention => C, 
        External_Name => "PKCS5_v2_scrypt_keyivgen";

   function PKCS5_v2_scrypt_keyivgen_ex
     (ctx : access openssl_types_h.evp_cipher_ctx_st;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      param : access openssl_asn1_h.asn1_type_st;
      c : access constant openssl_types_h.evp_cipher_st;
      md : access constant openssl_types_h.evp_md_st;
      en_de : int;
      libctx : access openssl_types_h.ossl_lib_ctx_st;
      propq : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:1517
   with Import => True, 
        Convention => C, 
        External_Name => "PKCS5_v2_scrypt_keyivgen_ex";

   procedure PKCS5_PBE_add  -- /usr/include/openssl/evp.h:1523
   with Import => True, 
        Convention => C, 
        External_Name => "PKCS5_PBE_add";

   function EVP_PBE_CipherInit
     (pbe_obj : access openssl_types_h.asn1_object_st;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      param : access openssl_asn1_h.asn1_type_st;
      ctx : access openssl_types_h.evp_cipher_ctx_st;
      en_de : int) return int  -- /usr/include/openssl/evp.h:1525
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PBE_CipherInit";

   function EVP_PBE_CipherInit_ex
     (pbe_obj : access openssl_types_h.asn1_object_st;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      param : access openssl_asn1_h.asn1_type_st;
      ctx : access openssl_types_h.evp_cipher_ctx_st;
      en_de : int;
      libctx : access openssl_types_h.ossl_lib_ctx_st;
      propq : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:1528
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PBE_CipherInit_ex";

  -- PBE type  
  -- Can appear as the outermost AlgorithmIdentifier  
  -- Is an PRF type OID  
  -- Is a PKCS#5 v2.0 KDF  
   function EVP_PBE_alg_add_type
     (pbe_type : int;
      pbe_nid : int;
      cipher_nid : int;
      md_nid : int;
      keygen : access function
        (arg1 : access openssl_types_h.evp_cipher_ctx_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int;
         arg4 : access openssl_asn1_h.asn1_type_st;
         arg5 : access constant openssl_types_h.evp_cipher_st;
         arg6 : access constant openssl_types_h.evp_md_st;
         arg7 : int) return int) return int  -- /usr/include/openssl/evp.h:1541
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PBE_alg_add_type";

   function EVP_PBE_alg_add
     (nid : int;
      cipher : access constant openssl_types_h.evp_cipher_st;
      md : access constant openssl_types_h.evp_md_st;
      keygen : access function
        (arg1 : access openssl_types_h.evp_cipher_ctx_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int;
         arg4 : access openssl_asn1_h.asn1_type_st;
         arg5 : access constant openssl_types_h.evp_cipher_st;
         arg6 : access constant openssl_types_h.evp_md_st;
         arg7 : int) return int) return int  -- /usr/include/openssl/evp.h:1543
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PBE_alg_add";

   function EVP_PBE_find
     (c_type : int;
      pbe_nid : int;
      pcnid : access int;
      pmnid : access int;
      pkeygen : System.Address) return int  -- /usr/include/openssl/evp.h:1545
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PBE_find";

   function EVP_PBE_find_ex
     (c_type : int;
      pbe_nid : int;
      pcnid : access int;
      pmnid : access int;
      pkeygen : System.Address;
      pkeygen_ex : System.Address) return int  -- /usr/include/openssl/evp.h:1547
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PBE_find_ex";

   procedure EVP_PBE_cleanup  -- /usr/include/openssl/evp.h:1549
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PBE_cleanup";

   function EVP_PBE_get
     (ptype : access int;
      ppbe_nid : access int;
      num : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1550
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PBE_get";

   function EVP_PKEY_asn1_get_count return int  -- /usr/include/openssl/evp.h:1567
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_get_count";

   function EVP_PKEY_asn1_get0 (idx : int) return access constant openssl_types_h.evp_pkey_asn1_method_st  -- /usr/include/openssl/evp.h:1568
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_get0";

   function EVP_PKEY_asn1_find (pe : System.Address; c_type : int) return access constant openssl_types_h.evp_pkey_asn1_method_st  -- /usr/include/openssl/evp.h:1569
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_find";

   function EVP_PKEY_asn1_find_str
     (pe : System.Address;
      str : Interfaces.C.Strings.chars_ptr;
      len : int) return access constant openssl_types_h.evp_pkey_asn1_method_st  -- /usr/include/openssl/evp.h:1570
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_find_str";

   function EVP_PKEY_asn1_add0 (ameth : access constant openssl_types_h.evp_pkey_asn1_method_st) return int  -- /usr/include/openssl/evp.h:1572
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_add0";

   function EVP_PKEY_asn1_add_alias (to : int; from : int) return int  -- /usr/include/openssl/evp.h:1573
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_add_alias";

   function EVP_PKEY_asn1_get0_info
     (ppkey_id : access int;
      pkey_base_id : access int;
      ppkey_flags : access int;
      pinfo : System.Address;
      ppem_str : System.Address;
      ameth : access constant openssl_types_h.evp_pkey_asn1_method_st) return int  -- /usr/include/openssl/evp.h:1574
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_get0_info";

   function EVP_PKEY_get0_asn1 (pkey : access constant openssl_types_h.evp_pkey_st) return access constant openssl_types_h.evp_pkey_asn1_method_st  -- /usr/include/openssl/evp.h:1579
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get0_asn1";

   function EVP_PKEY_asn1_new
     (id : int;
      flags : int;
      pem_str : Interfaces.C.Strings.chars_ptr;
      info : Interfaces.C.Strings.chars_ptr) return access openssl_types_h.evp_pkey_asn1_method_st  -- /usr/include/openssl/evp.h:1580
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_new";

   procedure EVP_PKEY_asn1_copy (dst : access openssl_types_h.evp_pkey_asn1_method_st; src : access constant openssl_types_h.evp_pkey_asn1_method_st)  -- /usr/include/openssl/evp.h:1583
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_copy";

   procedure EVP_PKEY_asn1_free (ameth : access openssl_types_h.evp_pkey_asn1_method_st)  -- /usr/include/openssl/evp.h:1585
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_free";

   procedure EVP_PKEY_asn1_set_public
     (ameth : access openssl_types_h.evp_pkey_asn1_method_st;
      pub_decode : access function (arg1 : access openssl_types_h.evp_pkey_st; arg2 : access constant openssl_types_h.X509_pubkey_st) return int;
      pub_encode : access function (arg1 : access openssl_types_h.X509_pubkey_st; arg2 : access constant openssl_types_h.evp_pkey_st) return int;
      pub_cmp : access function (arg1 : access constant openssl_types_h.evp_pkey_st; arg2 : access constant openssl_types_h.evp_pkey_st) return int;
      pub_print : access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : access constant openssl_types_h.evp_pkey_st;
         arg3 : int;
         arg4 : access openssl_types_h.asn1_pctx_st) return int;
      pkey_size : access function (arg1 : access constant openssl_types_h.evp_pkey_st) return int;
      pkey_bits : access function (arg1 : access constant openssl_types_h.evp_pkey_st) return int)  -- /usr/include/openssl/evp.h:1586
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_set_public";

   procedure EVP_PKEY_asn1_set_private
     (ameth : access openssl_types_h.evp_pkey_asn1_method_st;
      priv_decode : access function (arg1 : access openssl_types_h.evp_pkey_st; arg2 : access constant openssl_types_h.pkcs8_priv_key_info_st) return int;
      priv_encode : access function (arg1 : access openssl_types_h.pkcs8_priv_key_info_st; arg2 : access constant openssl_types_h.evp_pkey_st) return int;
      priv_print : access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : access constant openssl_types_h.evp_pkey_st;
         arg3 : int;
         arg4 : access openssl_types_h.asn1_pctx_st) return int)  -- /usr/include/openssl/evp.h:1598
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_set_private";

   procedure EVP_PKEY_asn1_set_param
     (ameth : access openssl_types_h.evp_pkey_asn1_method_st;
      param_decode : access function
        (arg1 : access openssl_types_h.evp_pkey_st;
         arg2 : System.Address;
         arg3 : int) return int;
      param_encode : access function (arg1 : access constant openssl_types_h.evp_pkey_st; arg2 : System.Address) return int;
      param_missing : access function (arg1 : access constant openssl_types_h.evp_pkey_st) return int;
      param_copy : access function (arg1 : access openssl_types_h.evp_pkey_st; arg2 : access constant openssl_types_h.evp_pkey_st) return int;
      param_cmp : access function (arg1 : access constant openssl_types_h.evp_pkey_st; arg2 : access constant openssl_types_h.evp_pkey_st) return int;
      param_print : access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : access constant openssl_types_h.evp_pkey_st;
         arg3 : int;
         arg4 : access openssl_types_h.asn1_pctx_st) return int)  -- /usr/include/openssl/evp.h:1608
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_set_param";

   procedure EVP_PKEY_asn1_set_free (ameth : access openssl_types_h.evp_pkey_asn1_method_st; pkey_free : access procedure (arg1 : access openssl_types_h.evp_pkey_st))  -- /usr/include/openssl/evp.h:1624
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_set_free";

   procedure EVP_PKEY_asn1_set_ctrl (ameth : access openssl_types_h.evp_pkey_asn1_method_st; pkey_ctrl : access function
        (arg1 : access openssl_types_h.evp_pkey_st;
         arg2 : int;
         arg3 : long;
         arg4 : System.Address) return int)  -- /usr/include/openssl/evp.h:1626
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_set_ctrl";

   procedure EVP_PKEY_asn1_set_item
     (ameth : access openssl_types_h.evp_pkey_asn1_method_st;
      item_verify : access function
        (arg1 : access openssl_types_h.evp_md_ctx_st;
         arg2 : access constant openssl_types_h.ASN1_ITEM_st;
         arg3 : System.Address;
         arg4 : access constant openssl_types_h.X509_algor_st;
         arg5 : access constant openssl_asn1_h.asn1_string_st;
         arg6 : access openssl_types_h.evp_pkey_st) return int;
      item_sign : access function
        (arg1 : access openssl_types_h.evp_md_ctx_st;
         arg2 : access constant openssl_types_h.ASN1_ITEM_st;
         arg3 : System.Address;
         arg4 : access openssl_types_h.X509_algor_st;
         arg5 : access openssl_types_h.X509_algor_st;
         arg6 : access openssl_asn1_h.asn1_string_st) return int)  -- /usr/include/openssl/evp.h:1629
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_set_item";

   procedure EVP_PKEY_asn1_set_siginf (ameth : access openssl_types_h.evp_pkey_asn1_method_st; siginf_set : access function
        (arg1 : access openssl_types_h.x509_sig_info_st;
         arg2 : access constant openssl_types_h.X509_algor_st;
         arg3 : access constant openssl_asn1_h.asn1_string_st) return int)  -- /usr/include/openssl/evp.h:1643
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_set_siginf";

   procedure EVP_PKEY_asn1_set_check (ameth : access openssl_types_h.evp_pkey_asn1_method_st; pkey_check : access function (arg1 : access constant openssl_types_h.evp_pkey_st) return int)  -- /usr/include/openssl/evp.h:1648
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_set_check";

   procedure EVP_PKEY_asn1_set_public_check (ameth : access openssl_types_h.evp_pkey_asn1_method_st; pkey_pub_check : access function (arg1 : access constant openssl_types_h.evp_pkey_st) return int)  -- /usr/include/openssl/evp.h:1651
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_set_public_check";

   procedure EVP_PKEY_asn1_set_param_check (ameth : access openssl_types_h.evp_pkey_asn1_method_st; pkey_param_check : access function (arg1 : access constant openssl_types_h.evp_pkey_st) return int)  -- /usr/include/openssl/evp.h:1654
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_set_param_check";

   procedure EVP_PKEY_asn1_set_set_priv_key (ameth : access openssl_types_h.evp_pkey_asn1_method_st; set_priv_key : access function
        (arg1 : access openssl_types_h.evp_pkey_st;
         arg2 : access unsigned_char;
         arg3 : stddef_h.size_t) return int)  -- /usr/include/openssl/evp.h:1657
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_set_set_priv_key";

   procedure EVP_PKEY_asn1_set_set_pub_key (ameth : access openssl_types_h.evp_pkey_asn1_method_st; set_pub_key : access function
        (arg1 : access openssl_types_h.evp_pkey_st;
         arg2 : access unsigned_char;
         arg3 : stddef_h.size_t) return int)  -- /usr/include/openssl/evp.h:1662
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_set_set_pub_key";

   procedure EVP_PKEY_asn1_set_get_priv_key (ameth : access openssl_types_h.evp_pkey_asn1_method_st; get_priv_key : access function
        (arg1 : access constant openssl_types_h.evp_pkey_st;
         arg2 : access unsigned_char;
         arg3 : access stddef_h.size_t) return int)  -- /usr/include/openssl/evp.h:1666
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_set_get_priv_key";

   procedure EVP_PKEY_asn1_set_get_pub_key (ameth : access openssl_types_h.evp_pkey_asn1_method_st; get_pub_key : access function
        (arg1 : access constant openssl_types_h.evp_pkey_st;
         arg2 : access unsigned_char;
         arg3 : access stddef_h.size_t) return int)  -- /usr/include/openssl/evp.h:1670
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_set_get_pub_key";

   procedure EVP_PKEY_asn1_set_security_bits (ameth : access openssl_types_h.evp_pkey_asn1_method_st; pkey_security_bits : access function (arg1 : access constant openssl_types_h.evp_pkey_st) return int)  -- /usr/include/openssl/evp.h:1675
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_asn1_set_security_bits";

   function EVP_PKEY_CTX_get_signature_md (ctx : access openssl_types_h.evp_pkey_ctx_st; md : System.Address) return int  -- /usr/include/openssl/evp.h:1679
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_get_signature_md";

   function EVP_PKEY_CTX_set_signature_md (ctx : access openssl_types_h.evp_pkey_ctx_st; md : access constant openssl_types_h.evp_md_st) return int  -- /usr/include/openssl/evp.h:1680
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_set_signature_md";

   function EVP_PKEY_CTX_set1_id
     (ctx : access openssl_types_h.evp_pkey_ctx_st;
      id : System.Address;
      len : int) return int  -- /usr/include/openssl/evp.h:1682
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_set1_id";

   function EVP_PKEY_CTX_get1_id (ctx : access openssl_types_h.evp_pkey_ctx_st; id : System.Address) return int  -- /usr/include/openssl/evp.h:1683
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_get1_id";

   function EVP_PKEY_CTX_get1_id_len (ctx : access openssl_types_h.evp_pkey_ctx_st; id_len : access stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1684
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_get1_id_len";

   function EVP_PKEY_CTX_set_kem_op (ctx : access openssl_types_h.evp_pkey_ctx_st; op : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:1686
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_set_kem_op";

   function EVP_PKEY_get0_type_name (key : access constant openssl_types_h.evp_pkey_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/evp.h:1688
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get0_type_name";

   function EVP_PKEY_CTX_set_mac_key
     (ctx : access openssl_types_h.evp_pkey_ctx_st;
      key : access unsigned_char;
      keylen : int) return int  -- /usr/include/openssl/evp.h:1719
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_set_mac_key";

  -- Used by GOST key encryption in TLS  
  -- * Method handles all operations: don't assume any digest related defaults.
  --  

   function EVP_PKEY_meth_find (c_type : int) return access constant openssl_types_h.evp_pkey_method_st  -- /usr/include/openssl/evp.h:1751
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_find";

   function EVP_PKEY_meth_new (id : int; flags : int) return access openssl_types_h.evp_pkey_method_st  -- /usr/include/openssl/evp.h:1752
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_new";

   procedure EVP_PKEY_meth_get0_info
     (ppkey_id : access int;
      pflags : access int;
      meth : access constant openssl_types_h.evp_pkey_method_st)  -- /usr/include/openssl/evp.h:1753
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_get0_info";

   procedure EVP_PKEY_meth_copy (dst : access openssl_types_h.evp_pkey_method_st; src : access constant openssl_types_h.evp_pkey_method_st)  -- /usr/include/openssl/evp.h:1755
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_copy";

   procedure EVP_PKEY_meth_free (pmeth : access openssl_types_h.evp_pkey_method_st)  -- /usr/include/openssl/evp.h:1757
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_free";

   function EVP_PKEY_meth_add0 (pmeth : access constant openssl_types_h.evp_pkey_method_st) return int  -- /usr/include/openssl/evp.h:1758
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_add0";

   function EVP_PKEY_meth_remove (pmeth : access constant openssl_types_h.evp_pkey_method_st) return int  -- /usr/include/openssl/evp.h:1759
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_remove";

   function EVP_PKEY_meth_get_count return stddef_h.size_t  -- /usr/include/openssl/evp.h:1760
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_get_count";

   function EVP_PKEY_meth_get0 (idx : stddef_h.size_t) return access constant openssl_types_h.evp_pkey_method_st  -- /usr/include/openssl/evp.h:1761
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_get0";

   function EVP_KEYMGMT_fetch
     (ctx : access openssl_types_h.ossl_lib_ctx_st;
      algorithm : Interfaces.C.Strings.chars_ptr;
      properties : Interfaces.C.Strings.chars_ptr) return access openssl_types_h.evp_keymgmt_st  -- /usr/include/openssl/evp.h:1764
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEYMGMT_fetch";

   function EVP_KEYMGMT_up_ref (keymgmt : access openssl_types_h.evp_keymgmt_st) return int  -- /usr/include/openssl/evp.h:1766
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEYMGMT_up_ref";

   procedure EVP_KEYMGMT_free (keymgmt : access openssl_types_h.evp_keymgmt_st)  -- /usr/include/openssl/evp.h:1767
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEYMGMT_free";

   function EVP_KEYMGMT_get0_provider (keymgmt : access constant openssl_types_h.evp_keymgmt_st) return access constant openssl_types_h.ossl_provider_st  -- /usr/include/openssl/evp.h:1768
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEYMGMT_get0_provider";

   function EVP_KEYMGMT_get0_name (keymgmt : access constant openssl_types_h.evp_keymgmt_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/evp.h:1769
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEYMGMT_get0_name";

   function EVP_KEYMGMT_get0_description (keymgmt : access constant openssl_types_h.evp_keymgmt_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/evp.h:1770
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEYMGMT_get0_description";

   function EVP_KEYMGMT_is_a (keymgmt : access constant openssl_types_h.evp_keymgmt_st; name : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:1771
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEYMGMT_is_a";

   procedure EVP_KEYMGMT_do_all_provided
     (libctx : access openssl_types_h.ossl_lib_ctx_st;
      fn : access procedure (arg1 : access openssl_types_h.evp_keymgmt_st; arg2 : System.Address);
      arg : System.Address)  -- /usr/include/openssl/evp.h:1772
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEYMGMT_do_all_provided";

   function EVP_KEYMGMT_names_do_all
     (keymgmt : access constant openssl_types_h.evp_keymgmt_st;
      fn : access procedure (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : System.Address);
      data : System.Address) return int  -- /usr/include/openssl/evp.h:1775
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEYMGMT_names_do_all";

   function EVP_KEYMGMT_gettable_params (keymgmt : access constant openssl_types_h.evp_keymgmt_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1778
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEYMGMT_gettable_params";

   function EVP_KEYMGMT_settable_params (keymgmt : access constant openssl_types_h.evp_keymgmt_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1779
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEYMGMT_settable_params";

   function EVP_KEYMGMT_gen_settable_params (keymgmt : access constant openssl_types_h.evp_keymgmt_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1780
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEYMGMT_gen_settable_params";

   function EVP_PKEY_CTX_new (pkey : access openssl_types_h.evp_pkey_st; e : access openssl_types_h.engine_st) return access openssl_types_h.evp_pkey_ctx_st  -- /usr/include/openssl/evp.h:1782
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_new";

   function EVP_PKEY_CTX_new_id (id : int; e : access openssl_types_h.engine_st) return access openssl_types_h.evp_pkey_ctx_st  -- /usr/include/openssl/evp.h:1783
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_new_id";

   function EVP_PKEY_CTX_new_from_name
     (libctx : access openssl_types_h.ossl_lib_ctx_st;
      name : Interfaces.C.Strings.chars_ptr;
      propquery : Interfaces.C.Strings.chars_ptr) return access openssl_types_h.evp_pkey_ctx_st  -- /usr/include/openssl/evp.h:1784
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_new_from_name";

   function EVP_PKEY_CTX_new_from_pkey
     (libctx : access openssl_types_h.ossl_lib_ctx_st;
      pkey : access openssl_types_h.evp_pkey_st;
      propquery : Interfaces.C.Strings.chars_ptr) return access openssl_types_h.evp_pkey_ctx_st  -- /usr/include/openssl/evp.h:1787
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_new_from_pkey";

   function EVP_PKEY_CTX_dup (ctx : access constant openssl_types_h.evp_pkey_ctx_st) return access openssl_types_h.evp_pkey_ctx_st  -- /usr/include/openssl/evp.h:1789
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_dup";

   procedure EVP_PKEY_CTX_free (ctx : access openssl_types_h.evp_pkey_ctx_st)  -- /usr/include/openssl/evp.h:1790
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_free";

   function EVP_PKEY_CTX_is_a (ctx : access openssl_types_h.evp_pkey_ctx_st; keytype : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:1791
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_is_a";

   function EVP_PKEY_CTX_get_params (ctx : access openssl_types_h.evp_pkey_ctx_st; params : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:1793
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_get_params";

   function EVP_PKEY_CTX_gettable_params (ctx : access constant openssl_types_h.evp_pkey_ctx_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1794
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_gettable_params";

   function EVP_PKEY_CTX_set_params (ctx : access openssl_types_h.evp_pkey_ctx_st; params : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:1795
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_set_params";

   function EVP_PKEY_CTX_settable_params (ctx : access constant openssl_types_h.evp_pkey_ctx_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1796
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_settable_params";

   function EVP_PKEY_CTX_ctrl
     (ctx : access openssl_types_h.evp_pkey_ctx_st;
      keytype : int;
      optype : int;
      cmd : int;
      p1 : int;
      p2 : System.Address) return int  -- /usr/include/openssl/evp.h:1797
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_ctrl";

   function EVP_PKEY_CTX_ctrl_str
     (ctx : access openssl_types_h.evp_pkey_ctx_st;
      c_type : Interfaces.C.Strings.chars_ptr;
      value : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:1799
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_ctrl_str";

   function EVP_PKEY_CTX_ctrl_uint64
     (ctx : access openssl_types_h.evp_pkey_ctx_st;
      keytype : int;
      optype : int;
      cmd : int;
      value : bits_stdint_uintn_h.uint64_t) return int  -- /usr/include/openssl/evp.h:1801
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_ctrl_uint64";

   function EVP_PKEY_CTX_str2ctrl
     (ctx : access openssl_types_h.evp_pkey_ctx_st;
      cmd : int;
      str : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:1804
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_str2ctrl";

   function EVP_PKEY_CTX_hex2ctrl
     (ctx : access openssl_types_h.evp_pkey_ctx_st;
      cmd : int;
      hex : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:1805
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_hex2ctrl";

   function EVP_PKEY_CTX_md
     (ctx : access openssl_types_h.evp_pkey_ctx_st;
      optype : int;
      cmd : int;
      md : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:1807
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_md";

   function EVP_PKEY_CTX_get_operation (ctx : access openssl_types_h.evp_pkey_ctx_st) return int  -- /usr/include/openssl/evp.h:1809
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_get_operation";

   procedure EVP_PKEY_CTX_set0_keygen_info
     (ctx : access openssl_types_h.evp_pkey_ctx_st;
      dat : access int;
      datlen : int)  -- /usr/include/openssl/evp.h:1810
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_set0_keygen_info";

   function EVP_PKEY_new_mac_key
     (c_type : int;
      e : access openssl_types_h.engine_st;
      key : access unsigned_char;
      keylen : int) return access openssl_types_h.evp_pkey_st  -- /usr/include/openssl/evp.h:1812
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_new_mac_key";

   function EVP_PKEY_new_raw_private_key_ex
     (libctx : access openssl_types_h.ossl_lib_ctx_st;
      keytype : Interfaces.C.Strings.chars_ptr;
      propq : Interfaces.C.Strings.chars_ptr;
      priv : access unsigned_char;
      len : stddef_h.size_t) return access openssl_types_h.evp_pkey_st  -- /usr/include/openssl/evp.h:1814
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_new_raw_private_key_ex";

   function EVP_PKEY_new_raw_private_key
     (c_type : int;
      e : access openssl_types_h.engine_st;
      priv : access unsigned_char;
      len : stddef_h.size_t) return access openssl_types_h.evp_pkey_st  -- /usr/include/openssl/evp.h:1818
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_new_raw_private_key";

   function EVP_PKEY_new_raw_public_key_ex
     (libctx : access openssl_types_h.ossl_lib_ctx_st;
      keytype : Interfaces.C.Strings.chars_ptr;
      propq : Interfaces.C.Strings.chars_ptr;
      pub : access unsigned_char;
      len : stddef_h.size_t) return access openssl_types_h.evp_pkey_st  -- /usr/include/openssl/evp.h:1821
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_new_raw_public_key_ex";

   function EVP_PKEY_new_raw_public_key
     (c_type : int;
      e : access openssl_types_h.engine_st;
      pub : access unsigned_char;
      len : stddef_h.size_t) return access openssl_types_h.evp_pkey_st  -- /usr/include/openssl/evp.h:1824
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_new_raw_public_key";

   function EVP_PKEY_get_raw_private_key
     (pkey : access constant openssl_types_h.evp_pkey_st;
      priv : access unsigned_char;
      len : access stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1827
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get_raw_private_key";

   function EVP_PKEY_get_raw_public_key
     (pkey : access constant openssl_types_h.evp_pkey_st;
      pub : access unsigned_char;
      len : access stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1829
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get_raw_public_key";

   function EVP_PKEY_new_CMAC_key
     (e : access openssl_types_h.engine_st;
      priv : access unsigned_char;
      len : stddef_h.size_t;
      cipher : access constant openssl_types_h.evp_cipher_st) return access openssl_types_h.evp_pkey_st  -- /usr/include/openssl/evp.h:1834
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_new_CMAC_key";

   procedure EVP_PKEY_CTX_set_data (ctx : access openssl_types_h.evp_pkey_ctx_st; data : System.Address)  -- /usr/include/openssl/evp.h:1838
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_set_data";

   function EVP_PKEY_CTX_get_data (ctx : access constant openssl_types_h.evp_pkey_ctx_st) return System.Address  -- /usr/include/openssl/evp.h:1839
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_get_data";

   function EVP_PKEY_CTX_get0_pkey (ctx : access openssl_types_h.evp_pkey_ctx_st) return access openssl_types_h.evp_pkey_st  -- /usr/include/openssl/evp.h:1840
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_get0_pkey";

   function EVP_PKEY_CTX_get0_peerkey (ctx : access openssl_types_h.evp_pkey_ctx_st) return access openssl_types_h.evp_pkey_st  -- /usr/include/openssl/evp.h:1842
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_get0_peerkey";

   procedure EVP_PKEY_CTX_set_app_data (ctx : access openssl_types_h.evp_pkey_ctx_st; data : System.Address)  -- /usr/include/openssl/evp.h:1844
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_set_app_data";

   function EVP_PKEY_CTX_get_app_data (ctx : access openssl_types_h.evp_pkey_ctx_st) return System.Address  -- /usr/include/openssl/evp.h:1845
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_get_app_data";

   procedure EVP_SIGNATURE_free (signature : access openssl_types_h.evp_signature_st)  -- /usr/include/openssl/evp.h:1847
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_SIGNATURE_free";

   function EVP_SIGNATURE_up_ref (signature : access openssl_types_h.evp_signature_st) return int  -- /usr/include/openssl/evp.h:1848
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_SIGNATURE_up_ref";

   function EVP_SIGNATURE_get0_provider (signature : access constant openssl_types_h.evp_signature_st) return access openssl_types_h.ossl_provider_st  -- /usr/include/openssl/evp.h:1849
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_SIGNATURE_get0_provider";

   function EVP_SIGNATURE_fetch
     (ctx : access openssl_types_h.ossl_lib_ctx_st;
      algorithm : Interfaces.C.Strings.chars_ptr;
      properties : Interfaces.C.Strings.chars_ptr) return access openssl_types_h.evp_signature_st  -- /usr/include/openssl/evp.h:1850
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_SIGNATURE_fetch";

   function EVP_SIGNATURE_is_a (signature : access constant openssl_types_h.evp_signature_st; name : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:1852
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_SIGNATURE_is_a";

   function EVP_SIGNATURE_get0_name (signature : access constant openssl_types_h.evp_signature_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/evp.h:1853
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_SIGNATURE_get0_name";

   function EVP_SIGNATURE_get0_description (signature : access constant openssl_types_h.evp_signature_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/evp.h:1854
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_SIGNATURE_get0_description";

   procedure EVP_SIGNATURE_do_all_provided
     (libctx : access openssl_types_h.ossl_lib_ctx_st;
      fn : access procedure (arg1 : access openssl_types_h.evp_signature_st; arg2 : System.Address);
      data : System.Address)  -- /usr/include/openssl/evp.h:1855
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_SIGNATURE_do_all_provided";

   function EVP_SIGNATURE_names_do_all
     (signature : access constant openssl_types_h.evp_signature_st;
      fn : access procedure (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : System.Address);
      data : System.Address) return int  -- /usr/include/openssl/evp.h:1859
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_SIGNATURE_names_do_all";

   function EVP_SIGNATURE_gettable_ctx_params (sig : access constant openssl_types_h.evp_signature_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1862
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_SIGNATURE_gettable_ctx_params";

   function EVP_SIGNATURE_settable_ctx_params (sig : access constant openssl_types_h.evp_signature_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1863
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_SIGNATURE_settable_ctx_params";

   procedure EVP_ASYM_CIPHER_free (cipher : access openssl_types_h.evp_asym_cipher_st)  -- /usr/include/openssl/evp.h:1865
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_ASYM_CIPHER_free";

   function EVP_ASYM_CIPHER_up_ref (cipher : access openssl_types_h.evp_asym_cipher_st) return int  -- /usr/include/openssl/evp.h:1866
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_ASYM_CIPHER_up_ref";

   function EVP_ASYM_CIPHER_get0_provider (cipher : access constant openssl_types_h.evp_asym_cipher_st) return access openssl_types_h.ossl_provider_st  -- /usr/include/openssl/evp.h:1867
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_ASYM_CIPHER_get0_provider";

   function EVP_ASYM_CIPHER_fetch
     (ctx : access openssl_types_h.ossl_lib_ctx_st;
      algorithm : Interfaces.C.Strings.chars_ptr;
      properties : Interfaces.C.Strings.chars_ptr) return access openssl_types_h.evp_asym_cipher_st  -- /usr/include/openssl/evp.h:1868
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_ASYM_CIPHER_fetch";

   function EVP_ASYM_CIPHER_is_a (cipher : access constant openssl_types_h.evp_asym_cipher_st; name : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:1870
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_ASYM_CIPHER_is_a";

   function EVP_ASYM_CIPHER_get0_name (cipher : access constant openssl_types_h.evp_asym_cipher_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/evp.h:1871
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_ASYM_CIPHER_get0_name";

   function EVP_ASYM_CIPHER_get0_description (cipher : access constant openssl_types_h.evp_asym_cipher_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/evp.h:1872
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_ASYM_CIPHER_get0_description";

   procedure EVP_ASYM_CIPHER_do_all_provided
     (libctx : access openssl_types_h.ossl_lib_ctx_st;
      fn : access procedure (arg1 : access openssl_types_h.evp_asym_cipher_st; arg2 : System.Address);
      arg : System.Address)  -- /usr/include/openssl/evp.h:1873
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_ASYM_CIPHER_do_all_provided";

   function EVP_ASYM_CIPHER_names_do_all
     (cipher : access constant openssl_types_h.evp_asym_cipher_st;
      fn : access procedure (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : System.Address);
      data : System.Address) return int  -- /usr/include/openssl/evp.h:1877
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_ASYM_CIPHER_names_do_all";

   function EVP_ASYM_CIPHER_gettable_ctx_params (ciph : access constant openssl_types_h.evp_asym_cipher_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1880
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_ASYM_CIPHER_gettable_ctx_params";

   function EVP_ASYM_CIPHER_settable_ctx_params (ciph : access constant openssl_types_h.evp_asym_cipher_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1881
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_ASYM_CIPHER_settable_ctx_params";

   procedure EVP_KEM_free (wrap : access openssl_types_h.evp_kem_st)  -- /usr/include/openssl/evp.h:1883
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEM_free";

   function EVP_KEM_up_ref (wrap : access openssl_types_h.evp_kem_st) return int  -- /usr/include/openssl/evp.h:1884
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEM_up_ref";

   function EVP_KEM_get0_provider (wrap : access constant openssl_types_h.evp_kem_st) return access openssl_types_h.ossl_provider_st  -- /usr/include/openssl/evp.h:1885
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEM_get0_provider";

   function EVP_KEM_fetch
     (ctx : access openssl_types_h.ossl_lib_ctx_st;
      algorithm : Interfaces.C.Strings.chars_ptr;
      properties : Interfaces.C.Strings.chars_ptr) return access openssl_types_h.evp_kem_st  -- /usr/include/openssl/evp.h:1886
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEM_fetch";

   function EVP_KEM_is_a (wrap : access constant openssl_types_h.evp_kem_st; name : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:1888
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEM_is_a";

   function EVP_KEM_get0_name (wrap : access constant openssl_types_h.evp_kem_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/evp.h:1889
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEM_get0_name";

   function EVP_KEM_get0_description (wrap : access constant openssl_types_h.evp_kem_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/evp.h:1890
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEM_get0_description";

   procedure EVP_KEM_do_all_provided
     (libctx : access openssl_types_h.ossl_lib_ctx_st;
      fn : access procedure (arg1 : access openssl_types_h.evp_kem_st; arg2 : System.Address);
      arg : System.Address)  -- /usr/include/openssl/evp.h:1891
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEM_do_all_provided";

   function EVP_KEM_names_do_all
     (wrap : access constant openssl_types_h.evp_kem_st;
      fn : access procedure (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : System.Address);
      data : System.Address) return int  -- /usr/include/openssl/evp.h:1893
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEM_names_do_all";

   function EVP_KEM_gettable_ctx_params (kem : access constant openssl_types_h.evp_kem_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1895
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEM_gettable_ctx_params";

   function EVP_KEM_settable_ctx_params (kem : access constant openssl_types_h.evp_kem_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1896
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEM_settable_ctx_params";

   function EVP_PKEY_sign_init (ctx : access openssl_types_h.evp_pkey_ctx_st) return int  -- /usr/include/openssl/evp.h:1898
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_sign_init";

   function EVP_PKEY_sign_init_ex (ctx : access openssl_types_h.evp_pkey_ctx_st; params : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:1899
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_sign_init_ex";

   function EVP_PKEY_sign
     (ctx : access openssl_types_h.evp_pkey_ctx_st;
      sig : access unsigned_char;
      siglen : access stddef_h.size_t;
      tbs : access unsigned_char;
      tbslen : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1900
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_sign";

   function EVP_PKEY_verify_init (ctx : access openssl_types_h.evp_pkey_ctx_st) return int  -- /usr/include/openssl/evp.h:1903
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_verify_init";

   function EVP_PKEY_verify_init_ex (ctx : access openssl_types_h.evp_pkey_ctx_st; params : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:1904
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_verify_init_ex";

   function EVP_PKEY_verify
     (ctx : access openssl_types_h.evp_pkey_ctx_st;
      sig : access unsigned_char;
      siglen : stddef_h.size_t;
      tbs : access unsigned_char;
      tbslen : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1905
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_verify";

   function EVP_PKEY_verify_recover_init (ctx : access openssl_types_h.evp_pkey_ctx_st) return int  -- /usr/include/openssl/evp.h:1908
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_verify_recover_init";

   function EVP_PKEY_verify_recover_init_ex (ctx : access openssl_types_h.evp_pkey_ctx_st; params : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:1909
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_verify_recover_init_ex";

   function EVP_PKEY_verify_recover
     (ctx : access openssl_types_h.evp_pkey_ctx_st;
      rout : access unsigned_char;
      routlen : access stddef_h.size_t;
      sig : access unsigned_char;
      siglen : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1911
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_verify_recover";

   function EVP_PKEY_encrypt_init (ctx : access openssl_types_h.evp_pkey_ctx_st) return int  -- /usr/include/openssl/evp.h:1914
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_encrypt_init";

   function EVP_PKEY_encrypt_init_ex (ctx : access openssl_types_h.evp_pkey_ctx_st; params : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:1915
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_encrypt_init_ex";

   function EVP_PKEY_encrypt
     (ctx : access openssl_types_h.evp_pkey_ctx_st;
      c_out : access unsigned_char;
      outlen : access stddef_h.size_t;
      c_in : access unsigned_char;
      inlen : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1916
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_encrypt";

   function EVP_PKEY_decrypt_init (ctx : access openssl_types_h.evp_pkey_ctx_st) return int  -- /usr/include/openssl/evp.h:1919
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_decrypt_init";

   function EVP_PKEY_decrypt_init_ex (ctx : access openssl_types_h.evp_pkey_ctx_st; params : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:1920
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_decrypt_init_ex";

   function EVP_PKEY_decrypt
     (ctx : access openssl_types_h.evp_pkey_ctx_st;
      c_out : access unsigned_char;
      outlen : access stddef_h.size_t;
      c_in : access unsigned_char;
      inlen : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1921
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_decrypt";

   function EVP_PKEY_derive_init (ctx : access openssl_types_h.evp_pkey_ctx_st) return int  -- /usr/include/openssl/evp.h:1925
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_derive_init";

   function EVP_PKEY_derive_init_ex (ctx : access openssl_types_h.evp_pkey_ctx_st; params : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:1926
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_derive_init_ex";

   function EVP_PKEY_derive_set_peer_ex
     (ctx : access openssl_types_h.evp_pkey_ctx_st;
      peer : access openssl_types_h.evp_pkey_st;
      validate_peer : int) return int  -- /usr/include/openssl/evp.h:1927
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_derive_set_peer_ex";

   function EVP_PKEY_derive_set_peer (ctx : access openssl_types_h.evp_pkey_ctx_st; peer : access openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:1929
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_derive_set_peer";

   function EVP_PKEY_derive
     (ctx : access openssl_types_h.evp_pkey_ctx_st;
      key : access unsigned_char;
      keylen : access stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1930
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_derive";

   function EVP_PKEY_encapsulate_init (ctx : access openssl_types_h.evp_pkey_ctx_st; params : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:1932
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_encapsulate_init";

   function EVP_PKEY_auth_encapsulate_init
     (ctx : access openssl_types_h.evp_pkey_ctx_st;
      authpriv : access openssl_types_h.evp_pkey_st;
      params : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:1933
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_auth_encapsulate_init";

   function EVP_PKEY_encapsulate
     (ctx : access openssl_types_h.evp_pkey_ctx_st;
      wrappedkey : access unsigned_char;
      wrappedkeylen : access stddef_h.size_t;
      genkey : access unsigned_char;
      genkeylen : access stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1935
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_encapsulate";

   function EVP_PKEY_decapsulate_init (ctx : access openssl_types_h.evp_pkey_ctx_st; params : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:1938
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_decapsulate_init";

   function EVP_PKEY_auth_decapsulate_init
     (ctx : access openssl_types_h.evp_pkey_ctx_st;
      authpub : access openssl_types_h.evp_pkey_st;
      params : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:1939
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_auth_decapsulate_init";

   function EVP_PKEY_decapsulate
     (ctx : access openssl_types_h.evp_pkey_ctx_st;
      unwrapped : access unsigned_char;
      unwrappedlen : access stddef_h.size_t;
      wrapped : access unsigned_char;
      wrappedlen : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1941
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_decapsulate";

   --  skipped function type EVP_PKEY_gen_cb

   function EVP_PKEY_fromdata_init (ctx : access openssl_types_h.evp_pkey_ctx_st) return int  -- /usr/include/openssl/evp.h:1946
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_fromdata_init";

   function EVP_PKEY_fromdata
     (ctx : access openssl_types_h.evp_pkey_ctx_st;
      ppkey : System.Address;
      selection : int;
      param : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:1947
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_fromdata";

   function EVP_PKEY_fromdata_settable (ctx : access openssl_types_h.evp_pkey_ctx_st; selection : int) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1949
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_fromdata_settable";

   function EVP_PKEY_todata
     (pkey : access constant openssl_types_h.evp_pkey_st;
      selection : int;
      params : System.Address) return int  -- /usr/include/openssl/evp.h:1951
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_todata";

   function EVP_PKEY_export
     (pkey : access constant openssl_types_h.evp_pkey_st;
      selection : int;
      export_cb : access function (arg1 : access constant openssl_core_h.ossl_param_st; arg2 : System.Address) return int;
      export_cbarg : System.Address) return int  -- /usr/include/openssl/evp.h:1952
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_export";

   function EVP_PKEY_gettable_params (pkey : access constant openssl_types_h.evp_pkey_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1955
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_gettable_params";

   function EVP_PKEY_get_params (pkey : access constant openssl_types_h.evp_pkey_st; params : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:1956
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get_params";

   function EVP_PKEY_get_int_param
     (pkey : access constant openssl_types_h.evp_pkey_st;
      key_name : Interfaces.C.Strings.chars_ptr;
      c_out : access int) return int  -- /usr/include/openssl/evp.h:1957
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get_int_param";

   function EVP_PKEY_get_size_t_param
     (pkey : access constant openssl_types_h.evp_pkey_st;
      key_name : Interfaces.C.Strings.chars_ptr;
      c_out : access stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1959
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get_size_t_param";

   function EVP_PKEY_get_bn_param
     (pkey : access constant openssl_types_h.evp_pkey_st;
      key_name : Interfaces.C.Strings.chars_ptr;
      bn : System.Address) return int  -- /usr/include/openssl/evp.h:1961
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get_bn_param";

   function EVP_PKEY_get_utf8_string_param
     (pkey : access constant openssl_types_h.evp_pkey_st;
      key_name : Interfaces.C.Strings.chars_ptr;
      str : Interfaces.C.Strings.chars_ptr;
      max_buf_sz : stddef_h.size_t;
      out_sz : access stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1963
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get_utf8_string_param";

   function EVP_PKEY_get_octet_string_param
     (pkey : access constant openssl_types_h.evp_pkey_st;
      key_name : Interfaces.C.Strings.chars_ptr;
      buf : access unsigned_char;
      max_buf_sz : stddef_h.size_t;
      out_sz : access stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1965
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get_octet_string_param";

   function EVP_PKEY_settable_params (pkey : access constant openssl_types_h.evp_pkey_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:1969
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_settable_params";

   function EVP_PKEY_set_params (pkey : access openssl_types_h.evp_pkey_st; params : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/evp.h:1970
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_set_params";

   function EVP_PKEY_set_int_param
     (pkey : access openssl_types_h.evp_pkey_st;
      key_name : Interfaces.C.Strings.chars_ptr;
      c_in : int) return int  -- /usr/include/openssl/evp.h:1971
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_set_int_param";

   function EVP_PKEY_set_size_t_param
     (pkey : access openssl_types_h.evp_pkey_st;
      key_name : Interfaces.C.Strings.chars_ptr;
      c_in : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1972
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_set_size_t_param";

   function EVP_PKEY_set_bn_param
     (pkey : access openssl_types_h.evp_pkey_st;
      key_name : Interfaces.C.Strings.chars_ptr;
      bn : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/evp.h:1973
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_set_bn_param";

   function EVP_PKEY_set_utf8_string_param
     (pkey : access openssl_types_h.evp_pkey_st;
      key_name : Interfaces.C.Strings.chars_ptr;
      str : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:1975
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_set_utf8_string_param";

   function EVP_PKEY_set_octet_string_param
     (pkey : access openssl_types_h.evp_pkey_st;
      key_name : Interfaces.C.Strings.chars_ptr;
      buf : access unsigned_char;
      bsize : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:1977
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_set_octet_string_param";

   function EVP_PKEY_get_ec_point_conv_form (pkey : access constant openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:1980
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get_ec_point_conv_form";

   function EVP_PKEY_get_field_type (pkey : access constant openssl_types_h.evp_pkey_st) return int  -- /usr/include/openssl/evp.h:1981
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get_field_type";

   function EVP_PKEY_Q_keygen
     (libctx : access openssl_types_h.ossl_lib_ctx_st;
      propq : Interfaces.C.Strings.chars_ptr;
      c_type : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return access openssl_types_h.evp_pkey_st  -- /usr/include/openssl/evp.h:1983
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_Q_keygen";

   function EVP_PKEY_paramgen_init (ctx : access openssl_types_h.evp_pkey_ctx_st) return int  -- /usr/include/openssl/evp.h:1985
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_paramgen_init";

   function EVP_PKEY_paramgen (ctx : access openssl_types_h.evp_pkey_ctx_st; ppkey : System.Address) return int  -- /usr/include/openssl/evp.h:1986
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_paramgen";

   function EVP_PKEY_keygen_init (ctx : access openssl_types_h.evp_pkey_ctx_st) return int  -- /usr/include/openssl/evp.h:1987
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_keygen_init";

   function EVP_PKEY_keygen (ctx : access openssl_types_h.evp_pkey_ctx_st; ppkey : System.Address) return int  -- /usr/include/openssl/evp.h:1988
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_keygen";

   function EVP_PKEY_generate (ctx : access openssl_types_h.evp_pkey_ctx_st; ppkey : System.Address) return int  -- /usr/include/openssl/evp.h:1989
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_generate";

   function EVP_PKEY_check (ctx : access openssl_types_h.evp_pkey_ctx_st) return int  -- /usr/include/openssl/evp.h:1990
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_check";

   function EVP_PKEY_public_check (ctx : access openssl_types_h.evp_pkey_ctx_st) return int  -- /usr/include/openssl/evp.h:1991
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_public_check";

   function EVP_PKEY_public_check_quick (ctx : access openssl_types_h.evp_pkey_ctx_st) return int  -- /usr/include/openssl/evp.h:1992
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_public_check_quick";

   function EVP_PKEY_param_check (ctx : access openssl_types_h.evp_pkey_ctx_st) return int  -- /usr/include/openssl/evp.h:1993
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_param_check";

   function EVP_PKEY_param_check_quick (ctx : access openssl_types_h.evp_pkey_ctx_st) return int  -- /usr/include/openssl/evp.h:1994
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_param_check_quick";

   function EVP_PKEY_private_check (ctx : access openssl_types_h.evp_pkey_ctx_st) return int  -- /usr/include/openssl/evp.h:1995
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_private_check";

   function EVP_PKEY_pairwise_check (ctx : access openssl_types_h.evp_pkey_ctx_st) return int  -- /usr/include/openssl/evp.h:1996
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_pairwise_check";

   function EVP_PKEY_set_ex_data
     (key : access openssl_types_h.evp_pkey_st;
      idx : int;
      arg : System.Address) return int  -- /usr/include/openssl/evp.h:2000
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_set_ex_data";

   function EVP_PKEY_get_ex_data (key : access constant openssl_types_h.evp_pkey_st; idx : int) return System.Address  -- /usr/include/openssl/evp.h:2001
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get_ex_data";

   procedure EVP_PKEY_CTX_set_cb (ctx : access openssl_types_h.evp_pkey_ctx_st; cb : access function (arg1 : access openssl_types_h.evp_pkey_ctx_st) return int)  -- /usr/include/openssl/evp.h:2003
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_set_cb";

   function EVP_PKEY_CTX_get_cb (ctx : access openssl_types_h.evp_pkey_ctx_st) return access function (arg1 : access openssl_types_h.evp_pkey_ctx_st) return int  -- /usr/include/openssl/evp.h:2004
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_get_cb";

   function EVP_PKEY_CTX_get_keygen_info (ctx : access openssl_types_h.evp_pkey_ctx_st; idx : int) return int  -- /usr/include/openssl/evp.h:2006
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_get_keygen_info";

   procedure EVP_PKEY_meth_set_init (pmeth : access openssl_types_h.evp_pkey_method_st; init : access function (arg1 : access openssl_types_h.evp_pkey_ctx_st) return int)  -- /usr/include/openssl/evp.h:2008
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_set_init";

   procedure EVP_PKEY_meth_set_copy (pmeth : access openssl_types_h.evp_pkey_method_st; copy : access function (arg1 : access openssl_types_h.evp_pkey_ctx_st; arg2 : access constant openssl_types_h.evp_pkey_ctx_st) return int)  -- /usr/include/openssl/evp.h:2010
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_set_copy";

   procedure EVP_PKEY_meth_set_cleanup (pmeth : access openssl_types_h.evp_pkey_method_st; cleanup : access procedure (arg1 : access openssl_types_h.evp_pkey_ctx_st))  -- /usr/include/openssl/evp.h:2013
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_set_cleanup";

   procedure EVP_PKEY_meth_set_paramgen
     (pmeth : access openssl_types_h.evp_pkey_method_st;
      paramgen_init : access function (arg1 : access openssl_types_h.evp_pkey_ctx_st) return int;
      paramgen : access function (arg1 : access openssl_types_h.evp_pkey_ctx_st; arg2 : access openssl_types_h.evp_pkey_st) return int)  -- /usr/include/openssl/evp.h:2015
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_set_paramgen";

   procedure EVP_PKEY_meth_set_keygen
     (pmeth : access openssl_types_h.evp_pkey_method_st;
      keygen_init : access function (arg1 : access openssl_types_h.evp_pkey_ctx_st) return int;
      keygen : access function (arg1 : access openssl_types_h.evp_pkey_ctx_st; arg2 : access openssl_types_h.evp_pkey_st) return int)  -- /usr/include/openssl/evp.h:2018
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_set_keygen";

   procedure EVP_PKEY_meth_set_sign
     (pmeth : access openssl_types_h.evp_pkey_method_st;
      sign_init : access function (arg1 : access openssl_types_h.evp_pkey_ctx_st) return int;
      sign : access function
        (arg1 : access openssl_types_h.evp_pkey_ctx_st;
         arg2 : access unsigned_char;
         arg3 : access stddef_h.size_t;
         arg4 : access unsigned_char;
         arg5 : stddef_h.size_t) return int)  -- /usr/include/openssl/evp.h:2021
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_set_sign";

   procedure EVP_PKEY_meth_set_verify
     (pmeth : access openssl_types_h.evp_pkey_method_st;
      verify_init : access function (arg1 : access openssl_types_h.evp_pkey_ctx_st) return int;
      verify : access function
        (arg1 : access openssl_types_h.evp_pkey_ctx_st;
         arg2 : access unsigned_char;
         arg3 : stddef_h.size_t;
         arg4 : access unsigned_char;
         arg5 : stddef_h.size_t) return int)  -- /usr/include/openssl/evp.h:2025
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_set_verify";

   procedure EVP_PKEY_meth_set_verify_recover
     (pmeth : access openssl_types_h.evp_pkey_method_st;
      verify_recover_init : access function (arg1 : access openssl_types_h.evp_pkey_ctx_st) return int;
      verify_recover : access function
        (arg1 : access openssl_types_h.evp_pkey_ctx_st;
         arg2 : access unsigned_char;
         arg3 : access stddef_h.size_t;
         arg4 : access unsigned_char;
         arg5 : stddef_h.size_t) return int)  -- /usr/include/openssl/evp.h:2029
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_set_verify_recover";

   procedure EVP_PKEY_meth_set_signctx
     (pmeth : access openssl_types_h.evp_pkey_method_st;
      signctx_init : access function (arg1 : access openssl_types_h.evp_pkey_ctx_st; arg2 : access openssl_types_h.evp_md_ctx_st) return int;
      signctx : access function
        (arg1 : access openssl_types_h.evp_pkey_ctx_st;
         arg2 : access unsigned_char;
         arg3 : access stddef_h.size_t;
         arg4 : access openssl_types_h.evp_md_ctx_st) return int)  -- /usr/include/openssl/evp.h:2034
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_set_signctx";

   procedure EVP_PKEY_meth_set_verifyctx
     (pmeth : access openssl_types_h.evp_pkey_method_st;
      verifyctx_init : access function (arg1 : access openssl_types_h.evp_pkey_ctx_st; arg2 : access openssl_types_h.evp_md_ctx_st) return int;
      verifyctx : access function
        (arg1 : access openssl_types_h.evp_pkey_ctx_st;
         arg2 : access unsigned_char;
         arg3 : int;
         arg4 : access openssl_types_h.evp_md_ctx_st) return int)  -- /usr/include/openssl/evp.h:2039
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_set_verifyctx";

   procedure EVP_PKEY_meth_set_encrypt
     (pmeth : access openssl_types_h.evp_pkey_method_st;
      encrypt_init : access function (arg1 : access openssl_types_h.evp_pkey_ctx_st) return int;
      encryptfn : access function
        (arg1 : access openssl_types_h.evp_pkey_ctx_st;
         arg2 : access unsigned_char;
         arg3 : access stddef_h.size_t;
         arg4 : access unsigned_char;
         arg5 : stddef_h.size_t) return int)  -- /usr/include/openssl/evp.h:2044
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_set_encrypt";

   procedure EVP_PKEY_meth_set_decrypt
     (pmeth : access openssl_types_h.evp_pkey_method_st;
      decrypt_init : access function (arg1 : access openssl_types_h.evp_pkey_ctx_st) return int;
      decrypt : access function
        (arg1 : access openssl_types_h.evp_pkey_ctx_st;
         arg2 : access unsigned_char;
         arg3 : access stddef_h.size_t;
         arg4 : access unsigned_char;
         arg5 : stddef_h.size_t) return int)  -- /usr/include/openssl/evp.h:2048
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_set_decrypt";

   procedure EVP_PKEY_meth_set_derive
     (pmeth : access openssl_types_h.evp_pkey_method_st;
      derive_init : access function (arg1 : access openssl_types_h.evp_pkey_ctx_st) return int;
      derive : access function
        (arg1 : access openssl_types_h.evp_pkey_ctx_st;
         arg2 : access unsigned_char;
         arg3 : access stddef_h.size_t) return int)  -- /usr/include/openssl/evp.h:2052
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_set_derive";

   procedure EVP_PKEY_meth_set_ctrl
     (pmeth : access openssl_types_h.evp_pkey_method_st;
      ctrl : access function
        (arg1 : access openssl_types_h.evp_pkey_ctx_st;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      ctrl_str : access function
        (arg1 : access openssl_types_h.evp_pkey_ctx_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : Interfaces.C.Strings.chars_ptr) return int)  -- /usr/include/openssl/evp.h:2055
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_set_ctrl";

   procedure EVP_PKEY_meth_set_digestsign (pmeth : access openssl_types_h.evp_pkey_method_st; digestsign : access function
        (arg1 : access openssl_types_h.evp_md_ctx_st;
         arg2 : access unsigned_char;
         arg3 : access stddef_h.size_t;
         arg4 : access unsigned_char;
         arg5 : stddef_h.size_t) return int)  -- /usr/include/openssl/evp.h:2059
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_set_digestsign";

   procedure EVP_PKEY_meth_set_digestverify (pmeth : access openssl_types_h.evp_pkey_method_st; digestverify : access function
        (arg1 : access openssl_types_h.evp_md_ctx_st;
         arg2 : access unsigned_char;
         arg3 : stddef_h.size_t;
         arg4 : access unsigned_char;
         arg5 : stddef_h.size_t) return int)  -- /usr/include/openssl/evp.h:2063
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_set_digestverify";

   procedure EVP_PKEY_meth_set_check (pmeth : access openssl_types_h.evp_pkey_method_st; check : access function (arg1 : access openssl_types_h.evp_pkey_st) return int)  -- /usr/include/openssl/evp.h:2068
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_set_check";

   procedure EVP_PKEY_meth_set_public_check (pmeth : access openssl_types_h.evp_pkey_method_st; check : access function (arg1 : access openssl_types_h.evp_pkey_st) return int)  -- /usr/include/openssl/evp.h:2070
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_set_public_check";

   procedure EVP_PKEY_meth_set_param_check (pmeth : access openssl_types_h.evp_pkey_method_st; check : access function (arg1 : access openssl_types_h.evp_pkey_st) return int)  -- /usr/include/openssl/evp.h:2072
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_set_param_check";

   procedure EVP_PKEY_meth_set_digest_custom (pmeth : access openssl_types_h.evp_pkey_method_st; digest_custom : access function (arg1 : access openssl_types_h.evp_pkey_ctx_st; arg2 : access openssl_types_h.evp_md_ctx_st) return int)  -- /usr/include/openssl/evp.h:2074
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_set_digest_custom";

   procedure EVP_PKEY_meth_get_init (pmeth : access constant openssl_types_h.evp_pkey_method_st; pinit : System.Address)  -- /usr/include/openssl/evp.h:2077
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_get_init";

   procedure EVP_PKEY_meth_get_copy (pmeth : access constant openssl_types_h.evp_pkey_method_st; pcopy : System.Address)  -- /usr/include/openssl/evp.h:2079
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_get_copy";

   procedure EVP_PKEY_meth_get_cleanup (pmeth : access constant openssl_types_h.evp_pkey_method_st; pcleanup : System.Address)  -- /usr/include/openssl/evp.h:2082
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_get_cleanup";

   procedure EVP_PKEY_meth_get_paramgen
     (pmeth : access constant openssl_types_h.evp_pkey_method_st;
      pparamgen_init : System.Address;
      pparamgen : System.Address)  -- /usr/include/openssl/evp.h:2084
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_get_paramgen";

   procedure EVP_PKEY_meth_get_keygen
     (pmeth : access constant openssl_types_h.evp_pkey_method_st;
      pkeygen_init : System.Address;
      pkeygen : System.Address)  -- /usr/include/openssl/evp.h:2087
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_get_keygen";

   procedure EVP_PKEY_meth_get_sign
     (pmeth : access constant openssl_types_h.evp_pkey_method_st;
      psign_init : System.Address;
      psign : System.Address)  -- /usr/include/openssl/evp.h:2090
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_get_sign";

   procedure EVP_PKEY_meth_get_verify
     (pmeth : access constant openssl_types_h.evp_pkey_method_st;
      pverify_init : System.Address;
      pverify : System.Address)  -- /usr/include/openssl/evp.h:2094
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_get_verify";

   procedure EVP_PKEY_meth_get_verify_recover
     (pmeth : access constant openssl_types_h.evp_pkey_method_st;
      pverify_recover_init : System.Address;
      pverify_recover : System.Address)  -- /usr/include/openssl/evp.h:2098
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_get_verify_recover";

   procedure EVP_PKEY_meth_get_signctx
     (pmeth : access constant openssl_types_h.evp_pkey_method_st;
      psignctx_init : System.Address;
      psignctx : System.Address)  -- /usr/include/openssl/evp.h:2104
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_get_signctx";

   procedure EVP_PKEY_meth_get_verifyctx
     (pmeth : access constant openssl_types_h.evp_pkey_method_st;
      pverifyctx_init : System.Address;
      pverifyctx : System.Address)  -- /usr/include/openssl/evp.h:2109
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_get_verifyctx";

   procedure EVP_PKEY_meth_get_encrypt
     (pmeth : access constant openssl_types_h.evp_pkey_method_st;
      pencrypt_init : System.Address;
      pencryptfn : System.Address)  -- /usr/include/openssl/evp.h:2114
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_get_encrypt";

   procedure EVP_PKEY_meth_get_decrypt
     (pmeth : access constant openssl_types_h.evp_pkey_method_st;
      pdecrypt_init : System.Address;
      pdecrypt : System.Address)  -- /usr/include/openssl/evp.h:2118
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_get_decrypt";

   procedure EVP_PKEY_meth_get_derive
     (pmeth : access constant openssl_types_h.evp_pkey_method_st;
      pderive_init : System.Address;
      pderive : System.Address)  -- /usr/include/openssl/evp.h:2122
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_get_derive";

   procedure EVP_PKEY_meth_get_ctrl
     (pmeth : access constant openssl_types_h.evp_pkey_method_st;
      pctrl : System.Address;
      pctrl_str : System.Address)  -- /usr/include/openssl/evp.h:2125
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_get_ctrl";

   procedure EVP_PKEY_meth_get_digestsign (pmeth : access constant openssl_types_h.evp_pkey_method_st; digestsign : System.Address)  -- /usr/include/openssl/evp.h:2130
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_get_digestsign";

   procedure EVP_PKEY_meth_get_digestverify (pmeth : access constant openssl_types_h.evp_pkey_method_st; digestverify : System.Address)  -- /usr/include/openssl/evp.h:2134
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_get_digestverify";

   procedure EVP_PKEY_meth_get_check (pmeth : access constant openssl_types_h.evp_pkey_method_st; pcheck : System.Address)  -- /usr/include/openssl/evp.h:2139
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_get_check";

   procedure EVP_PKEY_meth_get_public_check (pmeth : access constant openssl_types_h.evp_pkey_method_st; pcheck : System.Address)  -- /usr/include/openssl/evp.h:2141
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_get_public_check";

   procedure EVP_PKEY_meth_get_param_check (pmeth : access constant openssl_types_h.evp_pkey_method_st; pcheck : System.Address)  -- /usr/include/openssl/evp.h:2143
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_get_param_check";

   procedure EVP_PKEY_meth_get_digest_custom (pmeth : access constant openssl_types_h.evp_pkey_method_st; pdigest_custom : System.Address)  -- /usr/include/openssl/evp.h:2145
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_meth_get_digest_custom";

   procedure EVP_KEYEXCH_free (exchange : access openssl_types_h.evp_keyexch_st)  -- /usr/include/openssl/evp.h:2150
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEYEXCH_free";

   function EVP_KEYEXCH_up_ref (exchange : access openssl_types_h.evp_keyexch_st) return int  -- /usr/include/openssl/evp.h:2151
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEYEXCH_up_ref";

   function EVP_KEYEXCH_fetch
     (ctx : access openssl_types_h.ossl_lib_ctx_st;
      algorithm : Interfaces.C.Strings.chars_ptr;
      properties : Interfaces.C.Strings.chars_ptr) return access openssl_types_h.evp_keyexch_st  -- /usr/include/openssl/evp.h:2152
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEYEXCH_fetch";

   function EVP_KEYEXCH_get0_provider (exchange : access constant openssl_types_h.evp_keyexch_st) return access openssl_types_h.ossl_provider_st  -- /usr/include/openssl/evp.h:2154
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEYEXCH_get0_provider";

   function EVP_KEYEXCH_is_a (keyexch : access constant openssl_types_h.evp_keyexch_st; name : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:2155
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEYEXCH_is_a";

   function EVP_KEYEXCH_get0_name (keyexch : access constant openssl_types_h.evp_keyexch_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/evp.h:2156
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEYEXCH_get0_name";

   function EVP_KEYEXCH_get0_description (keyexch : access constant openssl_types_h.evp_keyexch_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/evp.h:2157
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEYEXCH_get0_description";

   procedure EVP_KEYEXCH_do_all_provided
     (libctx : access openssl_types_h.ossl_lib_ctx_st;
      fn : access procedure (arg1 : access openssl_types_h.evp_keyexch_st; arg2 : System.Address);
      data : System.Address)  -- /usr/include/openssl/evp.h:2158
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEYEXCH_do_all_provided";

   function EVP_KEYEXCH_names_do_all
     (keyexch : access constant openssl_types_h.evp_keyexch_st;
      fn : access procedure (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : System.Address);
      data : System.Address) return int  -- /usr/include/openssl/evp.h:2161
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEYEXCH_names_do_all";

   function EVP_KEYEXCH_gettable_ctx_params (keyexch : access constant openssl_types_h.evp_keyexch_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:2164
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEYEXCH_gettable_ctx_params";

   function EVP_KEYEXCH_settable_ctx_params (keyexch : access constant openssl_types_h.evp_keyexch_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/evp.h:2165
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_KEYEXCH_settable_ctx_params";

   procedure EVP_add_alg_module  -- /usr/include/openssl/evp.h:2167
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_add_alg_module";

   function EVP_PKEY_CTX_set_group_name (ctx : access openssl_types_h.evp_pkey_ctx_st; name : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/evp.h:2169
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_set_group_name";

   function EVP_PKEY_CTX_get_group_name
     (ctx : access openssl_types_h.evp_pkey_ctx_st;
      name : Interfaces.C.Strings.chars_ptr;
      namelen : stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:2170
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_get_group_name";

   function EVP_PKEY_get_group_name
     (pkey : access constant openssl_types_h.evp_pkey_st;
      name : Interfaces.C.Strings.chars_ptr;
      name_sz : stddef_h.size_t;
      gname_len : access stddef_h.size_t) return int  -- /usr/include/openssl/evp.h:2171
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_get_group_name";

   function EVP_PKEY_CTX_get0_libctx (ctx : access openssl_types_h.evp_pkey_ctx_st) return access openssl_types_h.ossl_lib_ctx_st  -- /usr/include/openssl/evp.h:2174
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_get0_libctx";

   function EVP_PKEY_CTX_get0_propq (ctx : access constant openssl_types_h.evp_pkey_ctx_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/evp.h:2175
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_get0_propq";

   function EVP_PKEY_CTX_get0_provider (ctx : access constant openssl_types_h.evp_pkey_ctx_st) return access constant openssl_types_h.ossl_provider_st  -- /usr/include/openssl/evp.h:2176
   with Import => True, 
        Convention => C, 
        External_Name => "EVP_PKEY_CTX_get0_provider";

end openssl_evp_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
