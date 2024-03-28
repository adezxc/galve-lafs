pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with openssl_core_h;
with System;
with Interfaces.C.Strings;
with bits_stdint_uintn_h;
with stddef_h;

package openssl_core_dispatch_h is

   --  unsupported macro: OSSL_CORE_MAKE_FUNC(type,name,args) typedef type (OSSL_FUNC_ ##name ##_fn)args; static ossl_unused ossl_inline OSSL_FUNC_ ##name ##_fn *OSSL_FUNC_ ##name(const OSSL_DISPATCH *opf) { return (OSSL_FUNC_ ##name ##_fn *)opf->function; }
   OSSL_FUNC_CORE_GETTABLE_PARAMS : constant := 1;  --  /usr/include/openssl/core_dispatch.h:63

   OSSL_FUNC_CORE_GET_PARAMS : constant := 2;  --  /usr/include/openssl/core_dispatch.h:66

   OSSL_FUNC_CORE_THREAD_START : constant := 3;  --  /usr/include/openssl/core_dispatch.h:69

   OSSL_FUNC_CORE_GET_LIBCTX : constant := 4;  --  /usr/include/openssl/core_dispatch.h:73

   OSSL_FUNC_CORE_NEW_ERROR : constant := 5;  --  /usr/include/openssl/core_dispatch.h:76

   OSSL_FUNC_CORE_SET_ERROR_DEBUG : constant := 6;  --  /usr/include/openssl/core_dispatch.h:78

   OSSL_FUNC_CORE_VSET_ERROR : constant := 7;  --  /usr/include/openssl/core_dispatch.h:82

   OSSL_FUNC_CORE_SET_ERROR_MARK : constant := 8;  --  /usr/include/openssl/core_dispatch.h:86

   OSSL_FUNC_CORE_CLEAR_LAST_ERROR_MARK : constant := 9;  --  /usr/include/openssl/core_dispatch.h:88

   OSSL_FUNC_CORE_POP_ERROR_TO_MARK : constant := 10;  --  /usr/include/openssl/core_dispatch.h:91

   OSSL_FUNC_CORE_OBJ_ADD_SIGID : constant := 11;  --  /usr/include/openssl/core_dispatch.h:97
   OSSL_FUNC_CORE_OBJ_CREATE : constant := 12;  --  /usr/include/openssl/core_dispatch.h:98

   OSSL_FUNC_CRYPTO_MALLOC : constant := 20;  --  /usr/include/openssl/core_dispatch.h:108

   OSSL_FUNC_CRYPTO_ZALLOC : constant := 21;  --  /usr/include/openssl/core_dispatch.h:111

   OSSL_FUNC_CRYPTO_FREE : constant := 22;  --  /usr/include/openssl/core_dispatch.h:114

   OSSL_FUNC_CRYPTO_CLEAR_FREE : constant := 23;  --  /usr/include/openssl/core_dispatch.h:117

   OSSL_FUNC_CRYPTO_REALLOC : constant := 24;  --  /usr/include/openssl/core_dispatch.h:120

   OSSL_FUNC_CRYPTO_CLEAR_REALLOC : constant := 25;  --  /usr/include/openssl/core_dispatch.h:123

   OSSL_FUNC_CRYPTO_SECURE_MALLOC : constant := 26;  --  /usr/include/openssl/core_dispatch.h:127

   OSSL_FUNC_CRYPTO_SECURE_ZALLOC : constant := 27;  --  /usr/include/openssl/core_dispatch.h:130

   OSSL_FUNC_CRYPTO_SECURE_FREE : constant := 28;  --  /usr/include/openssl/core_dispatch.h:133

   OSSL_FUNC_CRYPTO_SECURE_CLEAR_FREE : constant := 29;  --  /usr/include/openssl/core_dispatch.h:136

   OSSL_FUNC_CRYPTO_SECURE_ALLOCATED : constant := 30;  --  /usr/include/openssl/core_dispatch.h:140

   OSSL_FUNC_OPENSSL_CLEANSE : constant := 31;  --  /usr/include/openssl/core_dispatch.h:143

   OSSL_FUNC_BIO_NEW_FILE : constant := 40;  --  /usr/include/openssl/core_dispatch.h:148
   OSSL_FUNC_BIO_NEW_MEMBUF : constant := 41;  --  /usr/include/openssl/core_dispatch.h:149
   OSSL_FUNC_BIO_READ_EX : constant := 42;  --  /usr/include/openssl/core_dispatch.h:150
   OSSL_FUNC_BIO_WRITE_EX : constant := 43;  --  /usr/include/openssl/core_dispatch.h:151
   OSSL_FUNC_BIO_UP_REF : constant := 44;  --  /usr/include/openssl/core_dispatch.h:152
   OSSL_FUNC_BIO_FREE : constant := 45;  --  /usr/include/openssl/core_dispatch.h:153
   OSSL_FUNC_BIO_VPRINTF : constant := 46;  --  /usr/include/openssl/core_dispatch.h:154
   OSSL_FUNC_BIO_VSNPRINTF : constant := 47;  --  /usr/include/openssl/core_dispatch.h:155
   OSSL_FUNC_BIO_PUTS : constant := 48;  --  /usr/include/openssl/core_dispatch.h:156
   OSSL_FUNC_BIO_GETS : constant := 49;  --  /usr/include/openssl/core_dispatch.h:157
   OSSL_FUNC_BIO_CTRL : constant := 50;  --  /usr/include/openssl/core_dispatch.h:158

   OSSL_FUNC_CLEANUP_USER_ENTROPY : constant := 96;  --  /usr/include/openssl/core_dispatch.h:180
   OSSL_FUNC_CLEANUP_USER_NONCE : constant := 97;  --  /usr/include/openssl/core_dispatch.h:181
   OSSL_FUNC_GET_USER_ENTROPY : constant := 98;  --  /usr/include/openssl/core_dispatch.h:182
   OSSL_FUNC_GET_USER_NONCE : constant := 99;  --  /usr/include/openssl/core_dispatch.h:183

   OSSL_FUNC_SELF_TEST_CB : constant := 100;  --  /usr/include/openssl/core_dispatch.h:185

   OSSL_FUNC_GET_ENTROPY : constant := 101;  --  /usr/include/openssl/core_dispatch.h:190
   OSSL_FUNC_CLEANUP_ENTROPY : constant := 102;  --  /usr/include/openssl/core_dispatch.h:191
   OSSL_FUNC_GET_NONCE : constant := 103;  --  /usr/include/openssl/core_dispatch.h:192
   OSSL_FUNC_CLEANUP_NONCE : constant := 104;  --  /usr/include/openssl/core_dispatch.h:193

   OSSL_FUNC_PROVIDER_REGISTER_CHILD_CB : constant := 105;  --  /usr/include/openssl/core_dispatch.h:218
   OSSL_FUNC_PROVIDER_DEREGISTER_CHILD_CB : constant := 106;  --  /usr/include/openssl/core_dispatch.h:219
   OSSL_FUNC_PROVIDER_NAME : constant := 107;  --  /usr/include/openssl/core_dispatch.h:220
   OSSL_FUNC_PROVIDER_GET0_PROVIDER_CTX : constant := 108;  --  /usr/include/openssl/core_dispatch.h:221
   OSSL_FUNC_PROVIDER_GET0_DISPATCH : constant := 109;  --  /usr/include/openssl/core_dispatch.h:222
   OSSL_FUNC_PROVIDER_UP_REF : constant := 110;  --  /usr/include/openssl/core_dispatch.h:223
   OSSL_FUNC_PROVIDER_FREE : constant := 111;  --  /usr/include/openssl/core_dispatch.h:224

   OSSL_FUNC_PROVIDER_TEARDOWN : constant := 1024;  --  /usr/include/openssl/core_dispatch.h:246

   OSSL_FUNC_PROVIDER_GETTABLE_PARAMS : constant := 1025;  --  /usr/include/openssl/core_dispatch.h:248

   OSSL_FUNC_PROVIDER_GET_PARAMS : constant := 1026;  --  /usr/include/openssl/core_dispatch.h:251

   OSSL_FUNC_PROVIDER_QUERY_OPERATION : constant := 1027;  --  /usr/include/openssl/core_dispatch.h:254

   OSSL_FUNC_PROVIDER_UNQUERY_OPERATION : constant := 1028;  --  /usr/include/openssl/core_dispatch.h:257

   OSSL_FUNC_PROVIDER_GET_REASON_STRINGS : constant := 1029;  --  /usr/include/openssl/core_dispatch.h:260

   OSSL_FUNC_PROVIDER_GET_CAPABILITIES : constant := 1030;  --  /usr/include/openssl/core_dispatch.h:263

   OSSL_FUNC_PROVIDER_SELF_TEST : constant := 1031;  --  /usr/include/openssl/core_dispatch.h:266

   OSSL_OP_DIGEST : constant := 1;  --  /usr/include/openssl/core_dispatch.h:271
   OSSL_OP_CIPHER : constant := 2;  --  /usr/include/openssl/core_dispatch.h:272
   OSSL_OP_MAC : constant := 3;  --  /usr/include/openssl/core_dispatch.h:273
   OSSL_OP_KDF : constant := 4;  --  /usr/include/openssl/core_dispatch.h:274
   OSSL_OP_RAND : constant := 5;  --  /usr/include/openssl/core_dispatch.h:275
   OSSL_OP_KEYMGMT : constant := 10;  --  /usr/include/openssl/core_dispatch.h:276
   OSSL_OP_KEYEXCH : constant := 11;  --  /usr/include/openssl/core_dispatch.h:277
   OSSL_OP_SIGNATURE : constant := 12;  --  /usr/include/openssl/core_dispatch.h:278
   OSSL_OP_ASYM_CIPHER : constant := 13;  --  /usr/include/openssl/core_dispatch.h:279
   OSSL_OP_KEM : constant := 14;  --  /usr/include/openssl/core_dispatch.h:280

   OSSL_OP_ENCODER : constant := 20;  --  /usr/include/openssl/core_dispatch.h:282
   OSSL_OP_DECODER : constant := 21;  --  /usr/include/openssl/core_dispatch.h:283
   OSSL_OP_STORE : constant := 22;  --  /usr/include/openssl/core_dispatch.h:284

   OSSL_OP_u_HIGHEST : constant := 22;  --  /usr/include/openssl/core_dispatch.h:286

   OSSL_FUNC_DIGEST_NEWCTX : constant := 1;  --  /usr/include/openssl/core_dispatch.h:290
   OSSL_FUNC_DIGEST_INIT : constant := 2;  --  /usr/include/openssl/core_dispatch.h:291
   OSSL_FUNC_DIGEST_UPDATE : constant := 3;  --  /usr/include/openssl/core_dispatch.h:292
   OSSL_FUNC_DIGEST_FINAL : constant := 4;  --  /usr/include/openssl/core_dispatch.h:293
   OSSL_FUNC_DIGEST_DIGEST : constant := 5;  --  /usr/include/openssl/core_dispatch.h:294
   OSSL_FUNC_DIGEST_FREECTX : constant := 6;  --  /usr/include/openssl/core_dispatch.h:295
   OSSL_FUNC_DIGEST_DUPCTX : constant := 7;  --  /usr/include/openssl/core_dispatch.h:296
   OSSL_FUNC_DIGEST_GET_PARAMS : constant := 8;  --  /usr/include/openssl/core_dispatch.h:297
   OSSL_FUNC_DIGEST_SET_CTX_PARAMS : constant := 9;  --  /usr/include/openssl/core_dispatch.h:298
   OSSL_FUNC_DIGEST_GET_CTX_PARAMS : constant := 10;  --  /usr/include/openssl/core_dispatch.h:299
   OSSL_FUNC_DIGEST_GETTABLE_PARAMS : constant := 11;  --  /usr/include/openssl/core_dispatch.h:300
   OSSL_FUNC_DIGEST_SETTABLE_CTX_PARAMS : constant := 12;  --  /usr/include/openssl/core_dispatch.h:301
   OSSL_FUNC_DIGEST_GETTABLE_CTX_PARAMS : constant := 13;  --  /usr/include/openssl/core_dispatch.h:302

   OSSL_FUNC_CIPHER_NEWCTX : constant := 1;  --  /usr/include/openssl/core_dispatch.h:332
   OSSL_FUNC_CIPHER_ENCRYPT_INIT : constant := 2;  --  /usr/include/openssl/core_dispatch.h:333
   OSSL_FUNC_CIPHER_DECRYPT_INIT : constant := 3;  --  /usr/include/openssl/core_dispatch.h:334
   OSSL_FUNC_CIPHER_UPDATE : constant := 4;  --  /usr/include/openssl/core_dispatch.h:335
   OSSL_FUNC_CIPHER_FINAL : constant := 5;  --  /usr/include/openssl/core_dispatch.h:336
   OSSL_FUNC_CIPHER_CIPHER : constant := 6;  --  /usr/include/openssl/core_dispatch.h:337
   OSSL_FUNC_CIPHER_FREECTX : constant := 7;  --  /usr/include/openssl/core_dispatch.h:338
   OSSL_FUNC_CIPHER_DUPCTX : constant := 8;  --  /usr/include/openssl/core_dispatch.h:339
   OSSL_FUNC_CIPHER_GET_PARAMS : constant := 9;  --  /usr/include/openssl/core_dispatch.h:340
   OSSL_FUNC_CIPHER_GET_CTX_PARAMS : constant := 10;  --  /usr/include/openssl/core_dispatch.h:341
   OSSL_FUNC_CIPHER_SET_CTX_PARAMS : constant := 11;  --  /usr/include/openssl/core_dispatch.h:342
   OSSL_FUNC_CIPHER_GETTABLE_PARAMS : constant := 12;  --  /usr/include/openssl/core_dispatch.h:343
   OSSL_FUNC_CIPHER_GETTABLE_CTX_PARAMS : constant := 13;  --  /usr/include/openssl/core_dispatch.h:344
   OSSL_FUNC_CIPHER_SETTABLE_CTX_PARAMS : constant := 14;  --  /usr/include/openssl/core_dispatch.h:345

   OSSL_FUNC_MAC_NEWCTX : constant := 1;  --  /usr/include/openssl/core_dispatch.h:387
   OSSL_FUNC_MAC_DUPCTX : constant := 2;  --  /usr/include/openssl/core_dispatch.h:388
   OSSL_FUNC_MAC_FREECTX : constant := 3;  --  /usr/include/openssl/core_dispatch.h:389
   OSSL_FUNC_MAC_INIT : constant := 4;  --  /usr/include/openssl/core_dispatch.h:390
   OSSL_FUNC_MAC_UPDATE : constant := 5;  --  /usr/include/openssl/core_dispatch.h:391
   OSSL_FUNC_MAC_FINAL : constant := 6;  --  /usr/include/openssl/core_dispatch.h:392
   OSSL_FUNC_MAC_GET_PARAMS : constant := 7;  --  /usr/include/openssl/core_dispatch.h:393
   OSSL_FUNC_MAC_GET_CTX_PARAMS : constant := 8;  --  /usr/include/openssl/core_dispatch.h:394
   OSSL_FUNC_MAC_SET_CTX_PARAMS : constant := 9;  --  /usr/include/openssl/core_dispatch.h:395
   OSSL_FUNC_MAC_GETTABLE_PARAMS : constant := 10;  --  /usr/include/openssl/core_dispatch.h:396
   OSSL_FUNC_MAC_GETTABLE_CTX_PARAMS : constant := 11;  --  /usr/include/openssl/core_dispatch.h:397
   OSSL_FUNC_MAC_SETTABLE_CTX_PARAMS : constant := 12;  --  /usr/include/openssl/core_dispatch.h:398

   OSSL_FUNC_KDF_NEWCTX : constant := 1;  --  /usr/include/openssl/core_dispatch.h:423
   OSSL_FUNC_KDF_DUPCTX : constant := 2;  --  /usr/include/openssl/core_dispatch.h:424
   OSSL_FUNC_KDF_FREECTX : constant := 3;  --  /usr/include/openssl/core_dispatch.h:425
   OSSL_FUNC_KDF_RESET : constant := 4;  --  /usr/include/openssl/core_dispatch.h:426
   OSSL_FUNC_KDF_DERIVE : constant := 5;  --  /usr/include/openssl/core_dispatch.h:427
   OSSL_FUNC_KDF_GETTABLE_PARAMS : constant := 6;  --  /usr/include/openssl/core_dispatch.h:428
   OSSL_FUNC_KDF_GETTABLE_CTX_PARAMS : constant := 7;  --  /usr/include/openssl/core_dispatch.h:429
   OSSL_FUNC_KDF_SETTABLE_CTX_PARAMS : constant := 8;  --  /usr/include/openssl/core_dispatch.h:430
   OSSL_FUNC_KDF_GET_PARAMS : constant := 9;  --  /usr/include/openssl/core_dispatch.h:431
   OSSL_FUNC_KDF_GET_CTX_PARAMS : constant := 10;  --  /usr/include/openssl/core_dispatch.h:432
   OSSL_FUNC_KDF_SET_CTX_PARAMS : constant := 11;  --  /usr/include/openssl/core_dispatch.h:433

   OSSL_FUNC_RAND_NEWCTX : constant := 1;  --  /usr/include/openssl/core_dispatch.h:454
   OSSL_FUNC_RAND_FREECTX : constant := 2;  --  /usr/include/openssl/core_dispatch.h:455
   OSSL_FUNC_RAND_INSTANTIATE : constant := 3;  --  /usr/include/openssl/core_dispatch.h:456
   OSSL_FUNC_RAND_UNINSTANTIATE : constant := 4;  --  /usr/include/openssl/core_dispatch.h:457
   OSSL_FUNC_RAND_GENERATE : constant := 5;  --  /usr/include/openssl/core_dispatch.h:458
   OSSL_FUNC_RAND_RESEED : constant := 6;  --  /usr/include/openssl/core_dispatch.h:459
   OSSL_FUNC_RAND_NONCE : constant := 7;  --  /usr/include/openssl/core_dispatch.h:460
   OSSL_FUNC_RAND_ENABLE_LOCKING : constant := 8;  --  /usr/include/openssl/core_dispatch.h:461
   OSSL_FUNC_RAND_LOCK : constant := 9;  --  /usr/include/openssl/core_dispatch.h:462
   OSSL_FUNC_RAND_UNLOCK : constant := 10;  --  /usr/include/openssl/core_dispatch.h:463
   OSSL_FUNC_RAND_GETTABLE_PARAMS : constant := 11;  --  /usr/include/openssl/core_dispatch.h:464
   OSSL_FUNC_RAND_GETTABLE_CTX_PARAMS : constant := 12;  --  /usr/include/openssl/core_dispatch.h:465
   OSSL_FUNC_RAND_SETTABLE_CTX_PARAMS : constant := 13;  --  /usr/include/openssl/core_dispatch.h:466
   OSSL_FUNC_RAND_GET_PARAMS : constant := 14;  --  /usr/include/openssl/core_dispatch.h:467
   OSSL_FUNC_RAND_GET_CTX_PARAMS : constant := 15;  --  /usr/include/openssl/core_dispatch.h:468
   OSSL_FUNC_RAND_SET_CTX_PARAMS : constant := 16;  --  /usr/include/openssl/core_dispatch.h:469
   OSSL_FUNC_RAND_VERIFY_ZEROIZATION : constant := 17;  --  /usr/include/openssl/core_dispatch.h:470
   OSSL_FUNC_RAND_GET_SEED : constant := 18;  --  /usr/include/openssl/core_dispatch.h:471
   OSSL_FUNC_RAND_CLEAR_SEED : constant := 19;  --  /usr/include/openssl/core_dispatch.h:472

   OSSL_KEYMGMT_SELECT_PRIVATE_KEY : constant := 16#01#;  --  /usr/include/openssl/core_dispatch.h:559
   OSSL_KEYMGMT_SELECT_PUBLIC_KEY : constant := 16#02#;  --  /usr/include/openssl/core_dispatch.h:560
   OSSL_KEYMGMT_SELECT_DOMAIN_PARAMETERS : constant := 16#04#;  --  /usr/include/openssl/core_dispatch.h:561
   OSSL_KEYMGMT_SELECT_OTHER_PARAMETERS : constant := 16#80#;  --  /usr/include/openssl/core_dispatch.h:562
   --  unsupported macro: OSSL_KEYMGMT_SELECT_ALL_PARAMETERS ( OSSL_KEYMGMT_SELECT_DOMAIN_PARAMETERS | OSSL_KEYMGMT_SELECT_OTHER_PARAMETERS)
   --  unsupported macro: OSSL_KEYMGMT_SELECT_KEYPAIR ( OSSL_KEYMGMT_SELECT_PRIVATE_KEY | OSSL_KEYMGMT_SELECT_PUBLIC_KEY )
   --  unsupported macro: OSSL_KEYMGMT_SELECT_ALL ( OSSL_KEYMGMT_SELECT_KEYPAIR | OSSL_KEYMGMT_SELECT_ALL_PARAMETERS )

   OSSL_KEYMGMT_VALIDATE_FULL_CHECK : constant := 0;  --  /usr/include/openssl/core_dispatch.h:573
   OSSL_KEYMGMT_VALIDATE_QUICK_CHECK : constant := 1;  --  /usr/include/openssl/core_dispatch.h:574

   OSSL_FUNC_KEYMGMT_NEW : constant := 1;  --  /usr/include/openssl/core_dispatch.h:577

   OSSL_FUNC_KEYMGMT_GEN_INIT : constant := 2;  --  /usr/include/openssl/core_dispatch.h:581
   OSSL_FUNC_KEYMGMT_GEN_SET_TEMPLATE : constant := 3;  --  /usr/include/openssl/core_dispatch.h:582
   OSSL_FUNC_KEYMGMT_GEN_SET_PARAMS : constant := 4;  --  /usr/include/openssl/core_dispatch.h:583
   OSSL_FUNC_KEYMGMT_GEN_SETTABLE_PARAMS : constant := 5;  --  /usr/include/openssl/core_dispatch.h:584
   OSSL_FUNC_KEYMGMT_GEN : constant := 6;  --  /usr/include/openssl/core_dispatch.h:585
   OSSL_FUNC_KEYMGMT_GEN_CLEANUP : constant := 7;  --  /usr/include/openssl/core_dispatch.h:586

   OSSL_FUNC_KEYMGMT_LOAD : constant := 8;  --  /usr/include/openssl/core_dispatch.h:601

   OSSL_FUNC_KEYMGMT_FREE : constant := 10;  --  /usr/include/openssl/core_dispatch.h:606

   OSSL_FUNC_KEYMGMT_GET_PARAMS : constant := 11;  --  /usr/include/openssl/core_dispatch.h:610
   OSSL_FUNC_KEYMGMT_GETTABLE_PARAMS : constant := 12;  --  /usr/include/openssl/core_dispatch.h:611

   OSSL_FUNC_KEYMGMT_SET_PARAMS : constant := 13;  --  /usr/include/openssl/core_dispatch.h:617
   OSSL_FUNC_KEYMGMT_SETTABLE_PARAMS : constant := 14;  --  /usr/include/openssl/core_dispatch.h:618

   OSSL_FUNC_KEYMGMT_QUERY_OPERATION_NAME : constant := 20;  --  /usr/include/openssl/core_dispatch.h:625

   OSSL_FUNC_KEYMGMT_HAS : constant := 21;  --  /usr/include/openssl/core_dispatch.h:630

   OSSL_FUNC_KEYMGMT_VALIDATE : constant := 22;  --  /usr/include/openssl/core_dispatch.h:634

   OSSL_FUNC_KEYMGMT_MATCH : constant := 23;  --  /usr/include/openssl/core_dispatch.h:639

   OSSL_FUNC_KEYMGMT_IMPORT : constant := 40;  --  /usr/include/openssl/core_dispatch.h:645
   OSSL_FUNC_KEYMGMT_IMPORT_TYPES : constant := 41;  --  /usr/include/openssl/core_dispatch.h:646
   OSSL_FUNC_KEYMGMT_EXPORT : constant := 42;  --  /usr/include/openssl/core_dispatch.h:647
   OSSL_FUNC_KEYMGMT_EXPORT_TYPES : constant := 43;  --  /usr/include/openssl/core_dispatch.h:648

   OSSL_FUNC_KEYMGMT_DUP : constant := 44;  --  /usr/include/openssl/core_dispatch.h:660

   OSSL_FUNC_KEYMGMT_IMPORT_TYPES_EX : constant := 45;  --  /usr/include/openssl/core_dispatch.h:665
   OSSL_FUNC_KEYMGMT_EXPORT_TYPES_EX : constant := 46;  --  /usr/include/openssl/core_dispatch.h:666

   OSSL_FUNC_KEYEXCH_NEWCTX : constant := 1;  --  /usr/include/openssl/core_dispatch.h:674
   OSSL_FUNC_KEYEXCH_INIT : constant := 2;  --  /usr/include/openssl/core_dispatch.h:675
   OSSL_FUNC_KEYEXCH_DERIVE : constant := 3;  --  /usr/include/openssl/core_dispatch.h:676
   OSSL_FUNC_KEYEXCH_SET_PEER : constant := 4;  --  /usr/include/openssl/core_dispatch.h:677
   OSSL_FUNC_KEYEXCH_FREECTX : constant := 5;  --  /usr/include/openssl/core_dispatch.h:678
   OSSL_FUNC_KEYEXCH_DUPCTX : constant := 6;  --  /usr/include/openssl/core_dispatch.h:679
   OSSL_FUNC_KEYEXCH_SET_CTX_PARAMS : constant := 7;  --  /usr/include/openssl/core_dispatch.h:680
   OSSL_FUNC_KEYEXCH_SETTABLE_CTX_PARAMS : constant := 8;  --  /usr/include/openssl/core_dispatch.h:681
   OSSL_FUNC_KEYEXCH_GET_CTX_PARAMS : constant := 9;  --  /usr/include/openssl/core_dispatch.h:682
   OSSL_FUNC_KEYEXCH_GETTABLE_CTX_PARAMS : constant := 10;  --  /usr/include/openssl/core_dispatch.h:683

   OSSL_FUNC_SIGNATURE_NEWCTX : constant := 1;  --  /usr/include/openssl/core_dispatch.h:704
   OSSL_FUNC_SIGNATURE_SIGN_INIT : constant := 2;  --  /usr/include/openssl/core_dispatch.h:705
   OSSL_FUNC_SIGNATURE_SIGN : constant := 3;  --  /usr/include/openssl/core_dispatch.h:706
   OSSL_FUNC_SIGNATURE_VERIFY_INIT : constant := 4;  --  /usr/include/openssl/core_dispatch.h:707
   OSSL_FUNC_SIGNATURE_VERIFY : constant := 5;  --  /usr/include/openssl/core_dispatch.h:708
   OSSL_FUNC_SIGNATURE_VERIFY_RECOVER_INIT : constant := 6;  --  /usr/include/openssl/core_dispatch.h:709
   OSSL_FUNC_SIGNATURE_VERIFY_RECOVER : constant := 7;  --  /usr/include/openssl/core_dispatch.h:710
   OSSL_FUNC_SIGNATURE_DIGEST_SIGN_INIT : constant := 8;  --  /usr/include/openssl/core_dispatch.h:711
   OSSL_FUNC_SIGNATURE_DIGEST_SIGN_UPDATE : constant := 9;  --  /usr/include/openssl/core_dispatch.h:712
   OSSL_FUNC_SIGNATURE_DIGEST_SIGN_FINAL : constant := 10;  --  /usr/include/openssl/core_dispatch.h:713
   OSSL_FUNC_SIGNATURE_DIGEST_SIGN : constant := 11;  --  /usr/include/openssl/core_dispatch.h:714
   OSSL_FUNC_SIGNATURE_DIGEST_VERIFY_INIT : constant := 12;  --  /usr/include/openssl/core_dispatch.h:715
   OSSL_FUNC_SIGNATURE_DIGEST_VERIFY_UPDATE : constant := 13;  --  /usr/include/openssl/core_dispatch.h:716
   OSSL_FUNC_SIGNATURE_DIGEST_VERIFY_FINAL : constant := 14;  --  /usr/include/openssl/core_dispatch.h:717
   OSSL_FUNC_SIGNATURE_DIGEST_VERIFY : constant := 15;  --  /usr/include/openssl/core_dispatch.h:718
   OSSL_FUNC_SIGNATURE_FREECTX : constant := 16;  --  /usr/include/openssl/core_dispatch.h:719
   OSSL_FUNC_SIGNATURE_DUPCTX : constant := 17;  --  /usr/include/openssl/core_dispatch.h:720
   OSSL_FUNC_SIGNATURE_GET_CTX_PARAMS : constant := 18;  --  /usr/include/openssl/core_dispatch.h:721
   OSSL_FUNC_SIGNATURE_GETTABLE_CTX_PARAMS : constant := 19;  --  /usr/include/openssl/core_dispatch.h:722
   OSSL_FUNC_SIGNATURE_SET_CTX_PARAMS : constant := 20;  --  /usr/include/openssl/core_dispatch.h:723
   OSSL_FUNC_SIGNATURE_SETTABLE_CTX_PARAMS : constant := 21;  --  /usr/include/openssl/core_dispatch.h:724
   OSSL_FUNC_SIGNATURE_GET_CTX_MD_PARAMS : constant := 22;  --  /usr/include/openssl/core_dispatch.h:725
   OSSL_FUNC_SIGNATURE_GETTABLE_CTX_MD_PARAMS : constant := 23;  --  /usr/include/openssl/core_dispatch.h:726
   OSSL_FUNC_SIGNATURE_SET_CTX_MD_PARAMS : constant := 24;  --  /usr/include/openssl/core_dispatch.h:727
   OSSL_FUNC_SIGNATURE_SETTABLE_CTX_MD_PARAMS : constant := 25;  --  /usr/include/openssl/core_dispatch.h:728

   OSSL_FUNC_ASYM_CIPHER_NEWCTX : constant := 1;  --  /usr/include/openssl/core_dispatch.h:793
   OSSL_FUNC_ASYM_CIPHER_ENCRYPT_INIT : constant := 2;  --  /usr/include/openssl/core_dispatch.h:794
   OSSL_FUNC_ASYM_CIPHER_ENCRYPT : constant := 3;  --  /usr/include/openssl/core_dispatch.h:795
   OSSL_FUNC_ASYM_CIPHER_DECRYPT_INIT : constant := 4;  --  /usr/include/openssl/core_dispatch.h:796
   OSSL_FUNC_ASYM_CIPHER_DECRYPT : constant := 5;  --  /usr/include/openssl/core_dispatch.h:797
   OSSL_FUNC_ASYM_CIPHER_FREECTX : constant := 6;  --  /usr/include/openssl/core_dispatch.h:798
   OSSL_FUNC_ASYM_CIPHER_DUPCTX : constant := 7;  --  /usr/include/openssl/core_dispatch.h:799
   OSSL_FUNC_ASYM_CIPHER_GET_CTX_PARAMS : constant := 8;  --  /usr/include/openssl/core_dispatch.h:800
   OSSL_FUNC_ASYM_CIPHER_GETTABLE_CTX_PARAMS : constant := 9;  --  /usr/include/openssl/core_dispatch.h:801
   OSSL_FUNC_ASYM_CIPHER_SET_CTX_PARAMS : constant := 10;  --  /usr/include/openssl/core_dispatch.h:802
   OSSL_FUNC_ASYM_CIPHER_SETTABLE_CTX_PARAMS : constant := 11;  --  /usr/include/openssl/core_dispatch.h:803

   OSSL_FUNC_KEM_NEWCTX : constant := 1;  --  /usr/include/openssl/core_dispatch.h:832
   OSSL_FUNC_KEM_ENCAPSULATE_INIT : constant := 2;  --  /usr/include/openssl/core_dispatch.h:833
   OSSL_FUNC_KEM_ENCAPSULATE : constant := 3;  --  /usr/include/openssl/core_dispatch.h:834
   OSSL_FUNC_KEM_DECAPSULATE_INIT : constant := 4;  --  /usr/include/openssl/core_dispatch.h:835
   OSSL_FUNC_KEM_DECAPSULATE : constant := 5;  --  /usr/include/openssl/core_dispatch.h:836
   OSSL_FUNC_KEM_FREECTX : constant := 6;  --  /usr/include/openssl/core_dispatch.h:837
   OSSL_FUNC_KEM_DUPCTX : constant := 7;  --  /usr/include/openssl/core_dispatch.h:838
   OSSL_FUNC_KEM_GET_CTX_PARAMS : constant := 8;  --  /usr/include/openssl/core_dispatch.h:839
   OSSL_FUNC_KEM_GETTABLE_CTX_PARAMS : constant := 9;  --  /usr/include/openssl/core_dispatch.h:840
   OSSL_FUNC_KEM_SET_CTX_PARAMS : constant := 10;  --  /usr/include/openssl/core_dispatch.h:841
   OSSL_FUNC_KEM_SETTABLE_CTX_PARAMS : constant := 11;  --  /usr/include/openssl/core_dispatch.h:842
   OSSL_FUNC_KEM_AUTH_ENCAPSULATE_INIT : constant := 12;  --  /usr/include/openssl/core_dispatch.h:843
   OSSL_FUNC_KEM_AUTH_DECAPSULATE_INIT : constant := 13;  --  /usr/include/openssl/core_dispatch.h:844

   OSSL_FUNC_ENCODER_NEWCTX : constant := 1;  --  /usr/include/openssl/core_dispatch.h:875
   OSSL_FUNC_ENCODER_FREECTX : constant := 2;  --  /usr/include/openssl/core_dispatch.h:876
   OSSL_FUNC_ENCODER_GET_PARAMS : constant := 3;  --  /usr/include/openssl/core_dispatch.h:877
   OSSL_FUNC_ENCODER_GETTABLE_PARAMS : constant := 4;  --  /usr/include/openssl/core_dispatch.h:878
   OSSL_FUNC_ENCODER_SET_CTX_PARAMS : constant := 5;  --  /usr/include/openssl/core_dispatch.h:879
   OSSL_FUNC_ENCODER_SETTABLE_CTX_PARAMS : constant := 6;  --  /usr/include/openssl/core_dispatch.h:880
   OSSL_FUNC_ENCODER_DOES_SELECTION : constant := 10;  --  /usr/include/openssl/core_dispatch.h:881
   OSSL_FUNC_ENCODER_ENCODE : constant := 11;  --  /usr/include/openssl/core_dispatch.h:882
   OSSL_FUNC_ENCODER_IMPORT_OBJECT : constant := 20;  --  /usr/include/openssl/core_dispatch.h:883
   OSSL_FUNC_ENCODER_FREE_OBJECT : constant := 21;  --  /usr/include/openssl/core_dispatch.h:884

   OSSL_FUNC_DECODER_NEWCTX : constant := 1;  --  /usr/include/openssl/core_dispatch.h:907
   OSSL_FUNC_DECODER_FREECTX : constant := 2;  --  /usr/include/openssl/core_dispatch.h:908
   OSSL_FUNC_DECODER_GET_PARAMS : constant := 3;  --  /usr/include/openssl/core_dispatch.h:909
   OSSL_FUNC_DECODER_GETTABLE_PARAMS : constant := 4;  --  /usr/include/openssl/core_dispatch.h:910
   OSSL_FUNC_DECODER_SET_CTX_PARAMS : constant := 5;  --  /usr/include/openssl/core_dispatch.h:911
   OSSL_FUNC_DECODER_SETTABLE_CTX_PARAMS : constant := 6;  --  /usr/include/openssl/core_dispatch.h:912
   OSSL_FUNC_DECODER_DOES_SELECTION : constant := 10;  --  /usr/include/openssl/core_dispatch.h:913
   OSSL_FUNC_DECODER_DECODE : constant := 11;  --  /usr/include/openssl/core_dispatch.h:914
   OSSL_FUNC_DECODER_EXPORT_OBJECT : constant := 20;  --  /usr/include/openssl/core_dispatch.h:915

   OSSL_FUNC_STORE_OPEN : constant := 1;  --  /usr/include/openssl/core_dispatch.h:948
   OSSL_FUNC_STORE_ATTACH : constant := 2;  --  /usr/include/openssl/core_dispatch.h:949
   OSSL_FUNC_STORE_SETTABLE_CTX_PARAMS : constant := 3;  --  /usr/include/openssl/core_dispatch.h:950
   OSSL_FUNC_STORE_SET_CTX_PARAMS : constant := 4;  --  /usr/include/openssl/core_dispatch.h:951
   OSSL_FUNC_STORE_LOAD : constant := 5;  --  /usr/include/openssl/core_dispatch.h:952
   OSSL_FUNC_STORE_EOF : constant := 6;  --  /usr/include/openssl/core_dispatch.h:953
   OSSL_FUNC_STORE_CLOSE : constant := 7;  --  /usr/include/openssl/core_dispatch.h:954
   OSSL_FUNC_STORE_EXPORT_OBJECT : constant := 8;  --  /usr/include/openssl/core_dispatch.h:955
   OSSL_FUNC_STORE_DELETE : constant := 9;  --  /usr/include/openssl/core_dispatch.h:956
   OSSL_FUNC_STORE_OPEN_EX : constant := 10;  --  /usr/include/openssl/core_dispatch.h:957

  -- * Copyright 2019-2023 The OpenSSL Project Authors. All Rights Reserved.
  -- *
  -- * Licensed under the Apache License 2.0 (the "License").  You may not use
  -- * this file except in compliance with the License.  You can obtain a copy
  -- * in the file LICENSE in the source distribution or at
  -- * https://www.openssl.org/source/license.html
  --  

  ---
  -- * Identities
  -- * ----------
  -- *
  -- * All series start with 1, to allow 0 to be an array terminator.
  -- * For any FUNC identity, we also provide a function signature typedef
  -- * and a static inline function to extract a function pointer from a
  -- * OSSL_DISPATCH element in a type safe manner.
  -- *
  -- * Names:
  -- * for any function base name 'foo' (uppercase form 'FOO'), we will have
  -- * the following:
  -- * - a macro for the identity with the name OSSL_FUNC_'FOO' or derivatives
  -- *   thereof (to be specified further down)
  -- * - a function signature typedef with the name OSSL_FUNC_'foo'_fn
  -- * - a function pointer extractor function with the name OSSL_FUNC_'foo'
  --  

  -- * Helper macro to create the function signature typedef and the extractor
  -- * |type| is the return-type of the function, |name| is the name of the
  -- * function to fetch, and |args| is a parenthesized list of parameters
  -- * for the function (that is, it is |name|'s function signature).
  -- * Note: This is considered a "reserved" internal macro. Applications should
  -- * not use this or assume its existence.
  --  

  -- * Core function identities, for the two OSSL_DISPATCH tables being passed
  -- * in the OSSL_provider_init call.
  -- *
  -- * 0 serves as a marker for the end of the OSSL_DISPATCH array, and must
  -- * therefore NEVER be used as a function identity.
  --  

  -- Functions provided by the Core to the provider, reserved numbers 1-1023  
   --  skipped function type OSSL_FUNC_core_gettable_params_fn

   function OSSL_FUNC_core_gettable_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : access constant openssl_core_h.ossl_core_handle_st) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:64
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_core_gettable_params";

   --  skipped function type OSSL_FUNC_core_get_params_fn

   function OSSL_FUNC_core_get_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : access constant openssl_core_h.ossl_core_handle_st; arg2 : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:67
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_core_get_params";

   --  skipped function type OSSL_FUNC_core_thread_start_fn

   function OSSL_FUNC_core_thread_start (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : access constant openssl_core_h.ossl_core_handle_st;
         arg2 : openssl_core_h.OSSL_thread_stop_handler_fn;
         arg3 : System.Address) return int  -- /usr/include/openssl/core_dispatch.h:70
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_core_thread_start";

   --  skipped function type OSSL_FUNC_core_get_libctx_fn

   function OSSL_FUNC_core_get_libctx (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : access constant openssl_core_h.ossl_core_handle_st) return access openssl_core_h.openssl_core_ctx_st  -- /usr/include/openssl/core_dispatch.h:74
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_core_get_libctx";

   --  skipped function type OSSL_FUNC_core_new_error_fn

   function OSSL_FUNC_core_new_error (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure (arg1 : access constant openssl_core_h.ossl_core_handle_st)  -- /usr/include/openssl/core_dispatch.h:77
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_core_new_error";

   --  skipped function type OSSL_FUNC_core_set_error_debug_fn

   function OSSL_FUNC_core_set_error_debug (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure
        (arg1 : access constant openssl_core_h.ossl_core_handle_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int;
         arg4 : Interfaces.C.Strings.chars_ptr)  -- /usr/include/openssl/core_dispatch.h:79
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_core_set_error_debug";

   --  skipped function type OSSL_FUNC_core_vset_error_fn

   function OSSL_FUNC_core_vset_error (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure
        (arg1 : access constant openssl_core_h.ossl_core_handle_st;
         arg2 : bits_stdint_uintn_h.uint32_t;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : access System.Address)  -- /usr/include/openssl/core_dispatch.h:83
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_core_vset_error";

   --  skipped function type OSSL_FUNC_core_set_error_mark_fn

   function OSSL_FUNC_core_set_error_mark (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : access constant openssl_core_h.ossl_core_handle_st) return int  -- /usr/include/openssl/core_dispatch.h:87
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_core_set_error_mark";

   --  skipped function type OSSL_FUNC_core_clear_last_error_mark_fn

   function OSSL_FUNC_core_clear_last_error_mark (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : access constant openssl_core_h.ossl_core_handle_st) return int  -- /usr/include/openssl/core_dispatch.h:89
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_core_clear_last_error_mark";

   --  skipped function type OSSL_FUNC_core_pop_error_to_mark_fn

   function OSSL_FUNC_core_pop_error_to_mark (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : access constant openssl_core_h.ossl_core_handle_st) return int  -- /usr/include/openssl/core_dispatch.h:92
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_core_pop_error_to_mark";

  -- Functions to access the OBJ database  
   --  skipped function type OSSL_FUNC_core_obj_add_sigid_fn

   function OSSL_FUNC_core_obj_add_sigid (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : access constant openssl_core_h.ossl_core_handle_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/core_dispatch.h:100
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_core_obj_add_sigid";

   --  skipped function type OSSL_FUNC_core_obj_create_fn

   function OSSL_FUNC_core_obj_create (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : access constant openssl_core_h.ossl_core_handle_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/core_dispatch.h:103
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_core_obj_create";

  -- Memory allocation, freeing, clearing.  
   --  skipped function type OSSL_FUNC_CRYPTO_malloc_fn

   function OSSL_FUNC_CRYPTO_malloc (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : stddef_h.size_t;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int) return System.Address  -- /usr/include/openssl/core_dispatch.h:109
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_CRYPTO_malloc";

   --  skipped function type OSSL_FUNC_CRYPTO_zalloc_fn

   function OSSL_FUNC_CRYPTO_zalloc (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : stddef_h.size_t;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int) return System.Address  -- /usr/include/openssl/core_dispatch.h:112
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_CRYPTO_zalloc";

   --  skipped function type OSSL_FUNC_CRYPTO_free_fn

   function OSSL_FUNC_CRYPTO_free (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure
        (arg1 : System.Address;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int)  -- /usr/include/openssl/core_dispatch.h:115
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_CRYPTO_free";

   --  skipped function type OSSL_FUNC_CRYPTO_clear_free_fn

   function OSSL_FUNC_CRYPTO_clear_free (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : int)  -- /usr/include/openssl/core_dispatch.h:118
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_CRYPTO_clear_free";

   --  skipped function type OSSL_FUNC_CRYPTO_realloc_fn

   function OSSL_FUNC_CRYPTO_realloc (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : int) return System.Address  -- /usr/include/openssl/core_dispatch.h:121
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_CRYPTO_realloc";

   --  skipped function type OSSL_FUNC_CRYPTO_clear_realloc_fn

   function OSSL_FUNC_CRYPTO_clear_realloc (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : stddef_h.size_t;
         arg4 : Interfaces.C.Strings.chars_ptr;
         arg5 : int) return System.Address  -- /usr/include/openssl/core_dispatch.h:124
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_CRYPTO_clear_realloc";

   --  skipped function type OSSL_FUNC_CRYPTO_secure_malloc_fn

   function OSSL_FUNC_CRYPTO_secure_malloc (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : stddef_h.size_t;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int) return System.Address  -- /usr/include/openssl/core_dispatch.h:128
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_CRYPTO_secure_malloc";

   --  skipped function type OSSL_FUNC_CRYPTO_secure_zalloc_fn

   function OSSL_FUNC_CRYPTO_secure_zalloc (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : stddef_h.size_t;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int) return System.Address  -- /usr/include/openssl/core_dispatch.h:131
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_CRYPTO_secure_zalloc";

   --  skipped function type OSSL_FUNC_CRYPTO_secure_free_fn

   function OSSL_FUNC_CRYPTO_secure_free (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure
        (arg1 : System.Address;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int)  -- /usr/include/openssl/core_dispatch.h:134
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_CRYPTO_secure_free";

   --  skipped function type OSSL_FUNC_CRYPTO_secure_clear_free_fn

   function OSSL_FUNC_CRYPTO_secure_clear_free (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : int)  -- /usr/include/openssl/core_dispatch.h:137
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_CRYPTO_secure_clear_free";

   --  skipped function type OSSL_FUNC_CRYPTO_secure_allocated_fn

   function OSSL_FUNC_CRYPTO_secure_allocated (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return int  -- /usr/include/openssl/core_dispatch.h:141
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_CRYPTO_secure_allocated";

   --  skipped function type OSSL_FUNC_OPENSSL_cleanse_fn

   function OSSL_FUNC_OPENSSL_cleanse (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure (arg1 : System.Address; arg2 : stddef_h.size_t)  -- /usr/include/openssl/core_dispatch.h:144
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_OPENSSL_cleanse";

  -- Bio functions provided by the core  
   --  skipped function type OSSL_FUNC_BIO_new_file_fn

   function OSSL_FUNC_BIO_new_file (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return access openssl_core_h.ossl_core_bio_st  -- /usr/include/openssl/core_dispatch.h:161
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_BIO_new_file";

   --  skipped function type OSSL_FUNC_BIO_new_membuf_fn

   function OSSL_FUNC_BIO_new_membuf (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : int) return access openssl_core_h.ossl_core_bio_st  -- /usr/include/openssl/core_dispatch.h:163
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_BIO_new_membuf";

   --  skipped function type OSSL_FUNC_BIO_read_ex_fn

   function OSSL_FUNC_BIO_read_ex (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : access openssl_core_h.ossl_core_bio_st;
         arg2 : System.Address;
         arg3 : stddef_h.size_t;
         arg4 : access stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:164
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_BIO_read_ex";

   --  skipped function type OSSL_FUNC_BIO_write_ex_fn

   function OSSL_FUNC_BIO_write_ex (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : access openssl_core_h.ossl_core_bio_st;
         arg2 : System.Address;
         arg3 : stddef_h.size_t;
         arg4 : access stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:166
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_BIO_write_ex";

   --  skipped function type OSSL_FUNC_BIO_gets_fn

   function OSSL_FUNC_BIO_gets (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : access openssl_core_h.ossl_core_bio_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int) return int  -- /usr/include/openssl/core_dispatch.h:168
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_BIO_gets";

   --  skipped function type OSSL_FUNC_BIO_puts_fn

   function OSSL_FUNC_BIO_puts (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : access openssl_core_h.ossl_core_bio_st; arg2 : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/core_dispatch.h:169
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_BIO_puts";

   --  skipped function type OSSL_FUNC_BIO_up_ref_fn

   function OSSL_FUNC_BIO_up_ref (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : access openssl_core_h.ossl_core_bio_st) return int  -- /usr/include/openssl/core_dispatch.h:170
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_BIO_up_ref";

   --  skipped function type OSSL_FUNC_BIO_free_fn

   function OSSL_FUNC_BIO_free (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : access openssl_core_h.ossl_core_bio_st) return int  -- /usr/include/openssl/core_dispatch.h:171
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_BIO_free";

   --  skipped function type OSSL_FUNC_BIO_vprintf_fn

   function OSSL_FUNC_BIO_vprintf (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : access openssl_core_h.ossl_core_bio_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : access System.Address) return int  -- /usr/include/openssl/core_dispatch.h:172
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_BIO_vprintf";

   --  skipped function type OSSL_FUNC_BIO_vsnprintf_fn

   function OSSL_FUNC_BIO_vsnprintf (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : stddef_h.size_t;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : access System.Address) return int  -- /usr/include/openssl/core_dispatch.h:174
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_BIO_vsnprintf";

   --  skipped function type OSSL_FUNC_BIO_ctrl_fn

   function OSSL_FUNC_BIO_ctrl (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : access openssl_core_h.ossl_core_bio_st;
         arg2 : int;
         arg3 : long;
         arg4 : System.Address) return int  -- /usr/include/openssl/core_dispatch.h:176
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_BIO_ctrl";

  -- New seeding functions prototypes with the 101-104 series  
   --  skipped function type OSSL_FUNC_self_test_cb_fn

   function OSSL_FUNC_self_test_cb (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure
        (arg1 : access openssl_core_h.openssl_core_ctx_st;
         arg2 : System.Address;
         arg3 : System.Address)  -- /usr/include/openssl/core_dispatch.h:186
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_self_test_cb";

  -- Functions to get seed material from the operating system  
   --  skipped function type OSSL_FUNC_get_entropy_fn

   function OSSL_FUNC_get_entropy (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : access constant openssl_core_h.ossl_core_handle_st;
         arg2 : System.Address;
         arg3 : int;
         arg4 : stddef_h.size_t;
         arg5 : stddef_h.size_t) return stddef_h.size_t  -- /usr/include/openssl/core_dispatch.h:194
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_get_entropy";

   --  skipped function type OSSL_FUNC_get_user_entropy_fn

   function OSSL_FUNC_get_user_entropy (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : access constant openssl_core_h.ossl_core_handle_st;
         arg2 : System.Address;
         arg3 : int;
         arg4 : stddef_h.size_t;
         arg5 : stddef_h.size_t) return stddef_h.size_t  -- /usr/include/openssl/core_dispatch.h:197
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_get_user_entropy";

   --  skipped function type OSSL_FUNC_cleanup_entropy_fn

   function OSSL_FUNC_cleanup_entropy (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure
        (arg1 : access constant openssl_core_h.ossl_core_handle_st;
         arg2 : access unsigned_char;
         arg3 : stddef_h.size_t)  -- /usr/include/openssl/core_dispatch.h:200
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_cleanup_entropy";

   --  skipped function type OSSL_FUNC_cleanup_user_entropy_fn

   function OSSL_FUNC_cleanup_user_entropy (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure
        (arg1 : access constant openssl_core_h.ossl_core_handle_st;
         arg2 : access unsigned_char;
         arg3 : stddef_h.size_t)  -- /usr/include/openssl/core_dispatch.h:202
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_cleanup_user_entropy";

   --  skipped function type OSSL_FUNC_get_nonce_fn

   function OSSL_FUNC_get_nonce (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : access constant openssl_core_h.ossl_core_handle_st;
         arg2 : System.Address;
         arg3 : stddef_h.size_t;
         arg4 : stddef_h.size_t;
         arg5 : System.Address;
         arg6 : stddef_h.size_t) return stddef_h.size_t  -- /usr/include/openssl/core_dispatch.h:204
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_get_nonce";

   --  skipped function type OSSL_FUNC_get_user_nonce_fn

   function OSSL_FUNC_get_user_nonce (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : access constant openssl_core_h.ossl_core_handle_st;
         arg2 : System.Address;
         arg3 : stddef_h.size_t;
         arg4 : stddef_h.size_t;
         arg5 : System.Address;
         arg6 : stddef_h.size_t) return stddef_h.size_t  -- /usr/include/openssl/core_dispatch.h:208
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_get_user_nonce";

   --  skipped function type OSSL_FUNC_cleanup_nonce_fn

   function OSSL_FUNC_cleanup_nonce (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure
        (arg1 : access constant openssl_core_h.ossl_core_handle_st;
         arg2 : access unsigned_char;
         arg3 : stddef_h.size_t)  -- /usr/include/openssl/core_dispatch.h:212
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_cleanup_nonce";

   --  skipped function type OSSL_FUNC_cleanup_user_nonce_fn

   function OSSL_FUNC_cleanup_user_nonce (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure
        (arg1 : access constant openssl_core_h.ossl_core_handle_st;
         arg2 : access unsigned_char;
         arg3 : stddef_h.size_t)  -- /usr/include/openssl/core_dispatch.h:214
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_cleanup_user_nonce";

  -- Functions to access the core's providers  
   --  skipped function type OSSL_FUNC_provider_register_child_cb_fn

   function OSSL_FUNC_provider_register_child_cb (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : access constant openssl_core_h.ossl_core_handle_st;
         arg2 : access function (arg1 : access constant openssl_core_h.ossl_core_handle_st; arg2 : System.Address) return int;
         arg3 : access function (arg1 : access constant openssl_core_h.ossl_core_handle_st; arg2 : System.Address) return int;
         arg4 : access function (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : System.Address) return int;
         arg5 : System.Address) return int  -- /usr/include/openssl/core_dispatch.h:226
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_provider_register_child_cb";

   --  skipped function type OSSL_FUNC_provider_deregister_child_cb_fn

   function OSSL_FUNC_provider_deregister_child_cb (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure (arg1 : access constant openssl_core_h.ossl_core_handle_st)  -- /usr/include/openssl/core_dispatch.h:232
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_provider_deregister_child_cb";

   --  skipped function type OSSL_FUNC_provider_name_fn

   function OSSL_FUNC_provider_name (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : access constant openssl_core_h.ossl_core_handle_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/core_dispatch.h:234
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_provider_name";

   --  skipped function type OSSL_FUNC_provider_get0_provider_ctx_fn

   function OSSL_FUNC_provider_get0_provider_ctx (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : access constant openssl_core_h.ossl_core_handle_st) return System.Address  -- /usr/include/openssl/core_dispatch.h:236
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_provider_get0_provider_ctx";

   --  skipped function type OSSL_FUNC_provider_get0_dispatch_fn

   function OSSL_FUNC_provider_get0_dispatch (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : access constant openssl_core_h.ossl_core_handle_st) return access constant openssl_core_h.ossl_dispatch_st  -- /usr/include/openssl/core_dispatch.h:238
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_provider_get0_dispatch";

   --  skipped function type OSSL_FUNC_provider_up_ref_fn

   function OSSL_FUNC_provider_up_ref (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : access constant openssl_core_h.ossl_core_handle_st; arg2 : int) return int  -- /usr/include/openssl/core_dispatch.h:240
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_provider_up_ref";

   --  skipped function type OSSL_FUNC_provider_free_fn

   function OSSL_FUNC_provider_free (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : access constant openssl_core_h.ossl_core_handle_st; arg2 : int) return int  -- /usr/include/openssl/core_dispatch.h:242
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_provider_free";

  -- Functions provided by the provider to the Core, reserved numbers 1024-1535  
   --  skipped function type OSSL_FUNC_provider_teardown_fn

   function OSSL_FUNC_provider_teardown (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure (arg1 : System.Address)  -- /usr/include/openssl/core_dispatch.h:247
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_provider_teardown";

   --  skipped function type OSSL_FUNC_provider_gettable_params_fn

   function OSSL_FUNC_provider_gettable_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:249
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_provider_gettable_params";

   --  skipped function type OSSL_FUNC_provider_get_params_fn

   function OSSL_FUNC_provider_get_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:252
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_provider_get_params";

   --  skipped function type OSSL_FUNC_provider_query_operation_fn

   function OSSL_FUNC_provider_query_operation (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : int;
         arg3 : access int) return access constant openssl_core_h.ossl_algorithm_st  -- /usr/include/openssl/core_dispatch.h:255
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_provider_query_operation";

   --  skipped function type OSSL_FUNC_provider_unquery_operation_fn

   function OSSL_FUNC_provider_unquery_operation (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure
        (arg1 : System.Address;
         arg2 : int;
         arg3 : access constant openssl_core_h.ossl_algorithm_st)  -- /usr/include/openssl/core_dispatch.h:258
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_provider_unquery_operation";

   --  skipped function type OSSL_FUNC_provider_get_reason_strings_fn

   function OSSL_FUNC_provider_get_reason_strings (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return access constant openssl_core_h.ossl_item_st  -- /usr/include/openssl/core_dispatch.h:261
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_provider_get_reason_strings";

   --  skipped function type OSSL_FUNC_provider_get_capabilities_fn

   function OSSL_FUNC_provider_get_capabilities (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : access function (arg1 : access constant openssl_core_h.ossl_param_st; arg2 : System.Address) return int;
         arg4 : System.Address) return int  -- /usr/include/openssl/core_dispatch.h:264
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_provider_get_capabilities";

   --  skipped function type OSSL_FUNC_provider_self_test_fn

   function OSSL_FUNC_provider_self_test (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return int  -- /usr/include/openssl/core_dispatch.h:267
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_provider_self_test";

  -- Operations  
  -- New section for non-EVP operations  
  -- Highest known operation number  
  -- Digests  
   --  skipped function type OSSL_FUNC_digest_newctx_fn

   function OSSL_FUNC_digest_newctx (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return System.Address  -- /usr/include/openssl/core_dispatch.h:304
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_digest_newctx";

   --  skipped function type OSSL_FUNC_digest_init_fn

   function OSSL_FUNC_digest_init (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:305
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_digest_init";

   --  skipped function type OSSL_FUNC_digest_update_fn

   function OSSL_FUNC_digest_update (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:306
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_digest_update";

   --  skipped function type OSSL_FUNC_digest_final_fn

   function OSSL_FUNC_digest_final (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : access stddef_h.size_t;
         arg4 : stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:308
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_digest_final";

   --  skipped function type OSSL_FUNC_digest_digest_fn

   function OSSL_FUNC_digest_digest (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : stddef_h.size_t;
         arg4 : access unsigned_char;
         arg5 : access stddef_h.size_t;
         arg6 : stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:311
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_digest_digest";

   --  skipped function type OSSL_FUNC_digest_freectx_fn

   function OSSL_FUNC_digest_freectx (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure (arg1 : System.Address)  -- /usr/include/openssl/core_dispatch.h:315
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_digest_freectx";

   --  skipped function type OSSL_FUNC_digest_dupctx_fn

   function OSSL_FUNC_digest_dupctx (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return System.Address  -- /usr/include/openssl/core_dispatch.h:316
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_digest_dupctx";

   --  skipped function type OSSL_FUNC_digest_get_params_fn

   function OSSL_FUNC_digest_get_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:318
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_digest_get_params";

   --  skipped function type OSSL_FUNC_digest_set_ctx_params_fn

   function OSSL_FUNC_digest_set_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:319
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_digest_set_ctx_params";

   --  skipped function type OSSL_FUNC_digest_get_ctx_params_fn

   function OSSL_FUNC_digest_get_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:321
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_digest_get_ctx_params";

   --  skipped function type OSSL_FUNC_digest_gettable_params_fn

   function OSSL_FUNC_digest_gettable_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:323
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_digest_gettable_params";

   --  skipped function type OSSL_FUNC_digest_settable_ctx_params_fn

   function OSSL_FUNC_digest_settable_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:325
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_digest_settable_ctx_params";

   --  skipped function type OSSL_FUNC_digest_gettable_ctx_params_fn

   function OSSL_FUNC_digest_gettable_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:327
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_digest_gettable_ctx_params";

  -- Symmetric Ciphers  
   --  skipped function type OSSL_FUNC_cipher_newctx_fn

   function OSSL_FUNC_cipher_newctx (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return System.Address  -- /usr/include/openssl/core_dispatch.h:347
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_cipher_newctx";

   --  skipped function type OSSL_FUNC_cipher_encrypt_init_fn

   function OSSL_FUNC_cipher_encrypt_init (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : stddef_h.size_t;
         arg4 : access unsigned_char;
         arg5 : stddef_h.size_t;
         arg6 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:348
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_cipher_encrypt_init";

   --  skipped function type OSSL_FUNC_cipher_decrypt_init_fn

   function OSSL_FUNC_cipher_decrypt_init (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : stddef_h.size_t;
         arg4 : access unsigned_char;
         arg5 : stddef_h.size_t;
         arg6 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:354
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_cipher_decrypt_init";

   --  skipped function type OSSL_FUNC_cipher_update_fn

   function OSSL_FUNC_cipher_update (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : access stddef_h.size_t;
         arg4 : stddef_h.size_t;
         arg5 : access unsigned_char;
         arg6 : stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:360
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_cipher_update";

   --  skipped function type OSSL_FUNC_cipher_final_fn

   function OSSL_FUNC_cipher_final (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : access stddef_h.size_t;
         arg4 : stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:364
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_cipher_final";

   --  skipped function type OSSL_FUNC_cipher_cipher_fn

   function OSSL_FUNC_cipher_cipher (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : access stddef_h.size_t;
         arg4 : stddef_h.size_t;
         arg5 : access unsigned_char;
         arg6 : stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:367
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_cipher_cipher";

   --  skipped function type OSSL_FUNC_cipher_freectx_fn

   function OSSL_FUNC_cipher_freectx (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure (arg1 : System.Address)  -- /usr/include/openssl/core_dispatch.h:371
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_cipher_freectx";

   --  skipped function type OSSL_FUNC_cipher_dupctx_fn

   function OSSL_FUNC_cipher_dupctx (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return System.Address  -- /usr/include/openssl/core_dispatch.h:372
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_cipher_dupctx";

   --  skipped function type OSSL_FUNC_cipher_get_params_fn

   function OSSL_FUNC_cipher_get_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:373
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_cipher_get_params";

   --  skipped function type OSSL_FUNC_cipher_get_ctx_params_fn

   function OSSL_FUNC_cipher_get_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:374
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_cipher_get_ctx_params";

   --  skipped function type OSSL_FUNC_cipher_set_ctx_params_fn

   function OSSL_FUNC_cipher_set_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:376
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_cipher_set_ctx_params";

   --  skipped function type OSSL_FUNC_cipher_gettable_params_fn

   function OSSL_FUNC_cipher_gettable_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:378
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_cipher_gettable_params";

   --  skipped function type OSSL_FUNC_cipher_settable_ctx_params_fn

   function OSSL_FUNC_cipher_settable_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:380
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_cipher_settable_ctx_params";

   --  skipped function type OSSL_FUNC_cipher_gettable_ctx_params_fn

   function OSSL_FUNC_cipher_gettable_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:382
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_cipher_gettable_ctx_params";

  -- MACs  
   --  skipped function type OSSL_FUNC_mac_newctx_fn

   function OSSL_FUNC_mac_newctx (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return System.Address  -- /usr/include/openssl/core_dispatch.h:400
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_mac_newctx";

   --  skipped function type OSSL_FUNC_mac_dupctx_fn

   function OSSL_FUNC_mac_dupctx (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return System.Address  -- /usr/include/openssl/core_dispatch.h:401
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_mac_dupctx";

   --  skipped function type OSSL_FUNC_mac_freectx_fn

   function OSSL_FUNC_mac_freectx (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure (arg1 : System.Address)  -- /usr/include/openssl/core_dispatch.h:402
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_mac_freectx";

   --  skipped function type OSSL_FUNC_mac_init_fn

   function OSSL_FUNC_mac_init (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : stddef_h.size_t;
         arg4 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:403
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_mac_init";

   --  skipped function type OSSL_FUNC_mac_update_fn

   function OSSL_FUNC_mac_update (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:405
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_mac_update";

   --  skipped function type OSSL_FUNC_mac_final_fn

   function OSSL_FUNC_mac_final (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : access stddef_h.size_t;
         arg4 : stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:407
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_mac_final";

   --  skipped function type OSSL_FUNC_mac_gettable_params_fn

   function OSSL_FUNC_mac_gettable_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:410
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_mac_gettable_params";

   --  skipped function type OSSL_FUNC_mac_gettable_ctx_params_fn

   function OSSL_FUNC_mac_gettable_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:411
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_mac_gettable_ctx_params";

   --  skipped function type OSSL_FUNC_mac_settable_ctx_params_fn

   function OSSL_FUNC_mac_settable_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:413
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_mac_settable_ctx_params";

   --  skipped function type OSSL_FUNC_mac_get_params_fn

   function OSSL_FUNC_mac_get_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:415
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_mac_get_params";

   --  skipped function type OSSL_FUNC_mac_get_ctx_params_fn

   function OSSL_FUNC_mac_get_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:416
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_mac_get_ctx_params";

   --  skipped function type OSSL_FUNC_mac_set_ctx_params_fn

   function OSSL_FUNC_mac_set_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:418
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_mac_set_ctx_params";

  -- KDFs and PRFs  
   --  skipped function type OSSL_FUNC_kdf_newctx_fn

   function OSSL_FUNC_kdf_newctx (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return System.Address  -- /usr/include/openssl/core_dispatch.h:435
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kdf_newctx";

   --  skipped function type OSSL_FUNC_kdf_dupctx_fn

   function OSSL_FUNC_kdf_dupctx (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return System.Address  -- /usr/include/openssl/core_dispatch.h:436
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kdf_dupctx";

   --  skipped function type OSSL_FUNC_kdf_freectx_fn

   function OSSL_FUNC_kdf_freectx (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure (arg1 : System.Address)  -- /usr/include/openssl/core_dispatch.h:437
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kdf_freectx";

   --  skipped function type OSSL_FUNC_kdf_reset_fn

   function OSSL_FUNC_kdf_reset (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure (arg1 : System.Address)  -- /usr/include/openssl/core_dispatch.h:438
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kdf_reset";

   --  skipped function type OSSL_FUNC_kdf_derive_fn

   function OSSL_FUNC_kdf_derive (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : stddef_h.size_t;
         arg4 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:439
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kdf_derive";

   --  skipped function type OSSL_FUNC_kdf_gettable_params_fn

   function OSSL_FUNC_kdf_gettable_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:441
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kdf_gettable_params";

   --  skipped function type OSSL_FUNC_kdf_gettable_ctx_params_fn

   function OSSL_FUNC_kdf_gettable_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:442
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kdf_gettable_ctx_params";

   --  skipped function type OSSL_FUNC_kdf_settable_ctx_params_fn

   function OSSL_FUNC_kdf_settable_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:444
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kdf_settable_ctx_params";

   --  skipped function type OSSL_FUNC_kdf_get_params_fn

   function OSSL_FUNC_kdf_get_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:446
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kdf_get_params";

   --  skipped function type OSSL_FUNC_kdf_get_ctx_params_fn

   function OSSL_FUNC_kdf_get_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:447
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kdf_get_ctx_params";

   --  skipped function type OSSL_FUNC_kdf_set_ctx_params_fn

   function OSSL_FUNC_kdf_set_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:449
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kdf_set_ctx_params";

  -- RAND  
   --  skipped function type OSSL_FUNC_rand_newctx_fn

   function OSSL_FUNC_rand_newctx (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : access constant openssl_core_h.ossl_dispatch_st) return System.Address  -- /usr/include/openssl/core_dispatch.h:474
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_rand_newctx";

   --  skipped function type OSSL_FUNC_rand_freectx_fn

   function OSSL_FUNC_rand_freectx (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure (arg1 : System.Address)  -- /usr/include/openssl/core_dispatch.h:477
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_rand_freectx";

   --  skipped function type OSSL_FUNC_rand_instantiate_fn

   function OSSL_FUNC_rand_instantiate (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : unsigned;
         arg3 : int;
         arg4 : access unsigned_char;
         arg5 : stddef_h.size_t;
         arg6 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:478
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_rand_instantiate";

   --  skipped function type OSSL_FUNC_rand_uninstantiate_fn

   function OSSL_FUNC_rand_uninstantiate (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return int  -- /usr/include/openssl/core_dispatch.h:483
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_rand_uninstantiate";

   --  skipped function type OSSL_FUNC_rand_generate_fn

   function OSSL_FUNC_rand_generate (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : stddef_h.size_t;
         arg4 : unsigned;
         arg5 : int;
         arg6 : access unsigned_char;
         arg7 : stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:484
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_rand_generate";

   --  skipped function type OSSL_FUNC_rand_reseed_fn

   function OSSL_FUNC_rand_reseed (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : int;
         arg3 : access unsigned_char;
         arg4 : stddef_h.size_t;
         arg5 : access unsigned_char;
         arg6 : stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:488
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_rand_reseed";

   --  skipped function type OSSL_FUNC_rand_nonce_fn

   function OSSL_FUNC_rand_nonce (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : unsigned;
         arg4 : stddef_h.size_t;
         arg5 : stddef_h.size_t) return stddef_h.size_t  -- /usr/include/openssl/core_dispatch.h:492
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_rand_nonce";

   --  skipped function type OSSL_FUNC_rand_enable_locking_fn

   function OSSL_FUNC_rand_enable_locking (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return int  -- /usr/include/openssl/core_dispatch.h:495
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_rand_enable_locking";

   --  skipped function type OSSL_FUNC_rand_lock_fn

   function OSSL_FUNC_rand_lock (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return int  -- /usr/include/openssl/core_dispatch.h:496
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_rand_lock";

   --  skipped function type OSSL_FUNC_rand_unlock_fn

   function OSSL_FUNC_rand_unlock (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure (arg1 : System.Address)  -- /usr/include/openssl/core_dispatch.h:497
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_rand_unlock";

   --  skipped function type OSSL_FUNC_rand_gettable_params_fn

   function OSSL_FUNC_rand_gettable_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:498
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_rand_gettable_params";

   --  skipped function type OSSL_FUNC_rand_gettable_ctx_params_fn

   function OSSL_FUNC_rand_gettable_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:499
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_rand_gettable_ctx_params";

   --  skipped function type OSSL_FUNC_rand_settable_ctx_params_fn

   function OSSL_FUNC_rand_settable_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:501
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_rand_settable_ctx_params";

   --  skipped function type OSSL_FUNC_rand_get_params_fn

   function OSSL_FUNC_rand_get_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:503
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_rand_get_params";

   --  skipped function type OSSL_FUNC_rand_get_ctx_params_fn

   function OSSL_FUNC_rand_get_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:504
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_rand_get_ctx_params";

   --  skipped function type OSSL_FUNC_rand_set_ctx_params_fn

   function OSSL_FUNC_rand_set_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:506
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_rand_set_ctx_params";

   --  skipped function type OSSL_FUNC_rand_set_callbacks_fn

   function OSSL_FUNC_rand_set_callbacks (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure
        (arg1 : System.Address;
         arg2 : access function
           (arg1 : access constant openssl_core_h.ossl_param_st;
            arg2 : access openssl_core_h.ossl_param_st;
            arg3 : System.Address) return int;
         arg3 : access function (arg1 : access constant openssl_core_h.ossl_param_st; arg2 : System.Address) return int;
         arg4 : access function
           (arg1 : access constant openssl_core_h.ossl_param_st;
            arg2 : access openssl_core_h.ossl_param_st;
            arg3 : System.Address) return int;
         arg5 : access function (arg1 : access constant openssl_core_h.ossl_param_st; arg2 : System.Address) return int;
         arg6 : System.Address)  -- /usr/include/openssl/core_dispatch.h:508
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_rand_set_callbacks";

   --  skipped function type OSSL_FUNC_rand_verify_zeroization_fn

   function OSSL_FUNC_rand_verify_zeroization (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return int  -- /usr/include/openssl/core_dispatch.h:513
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_rand_verify_zeroization";

   --  skipped function type OSSL_FUNC_rand_get_seed_fn

   function OSSL_FUNC_rand_get_seed (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : int;
         arg4 : stddef_h.size_t;
         arg5 : stddef_h.size_t;
         arg6 : int;
         arg7 : access unsigned_char;
         arg8 : stddef_h.size_t) return stddef_h.size_t  -- /usr/include/openssl/core_dispatch.h:515
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_rand_get_seed";

   --  skipped function type OSSL_FUNC_rand_clear_seed_fn

   function OSSL_FUNC_rand_clear_seed (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : stddef_h.size_t)  -- /usr/include/openssl/core_dispatch.h:520
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_rand_clear_seed";

  ---
  -- * Key management
  -- *
  -- * The Key Management takes care of provider side key objects, and includes
  -- * all current functionality to create them, destroy them, set parameters
  -- * and key material, etc, essentially everything that manipulates the keys
  -- * themselves and their parameters.
  -- *
  -- * The key objects are commonly referred to as |keydata|, and it MUST be able
  -- * to contain parameters if the key has any, the public key and the private
  -- * key.  All parts are optional, but their presence determines what can be
  -- * done with the key object in terms of encryption, signature, and so on.
  -- * The assumption from libcrypto is that the key object contains any of the
  -- * following data combinations:
  -- *
  -- * - parameters only
  -- * - public key only
  -- * - public key + private key
  -- * - parameters + public key
  -- * - parameters + public key + private key
  -- *
  -- * What "parameters", "public key" and "private key" means in detail is left
  -- * to the implementation.  In the case of DH and DSA, they would typically
  -- * include domain parameters, while for certain variants of RSA, they would
  -- * typically include PSS or OAEP parameters.
  -- *
  -- * Key objects are created with OSSL_FUNC_keymgmt_new() and destroyed with
  -- * OSSL_FUNC_keymgmt_free().  Key objects can have data filled in with
  -- * OSSL_FUNC_keymgmt_import().
  -- *
  -- * Three functions are made available to check what selection of data is
  -- * present in a key object: OSSL_FUNC_keymgmt_has_parameters(),
  -- * OSSL_FUNC_keymgmt_has_public_key(), and OSSL_FUNC_keymgmt_has_private_key(),
  --  

  -- Key data subset selection - individual bits  
  -- Key data subset selection - combinations  
  -- Basic key object creation  
   --  skipped function type OSSL_FUNC_keymgmt_new_fn

   function OSSL_FUNC_keymgmt_new (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return System.Address  -- /usr/include/openssl/core_dispatch.h:578
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_new";

  -- Generation, a more complex constructor  
   --  skipped function type OSSL_FUNC_keymgmt_gen_init_fn

   function OSSL_FUNC_keymgmt_gen_init (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : int;
         arg3 : access constant openssl_core_h.ossl_param_st) return System.Address  -- /usr/include/openssl/core_dispatch.h:587
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_gen_init";

   --  skipped function type OSSL_FUNC_keymgmt_gen_set_template_fn

   function OSSL_FUNC_keymgmt_gen_set_template (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : System.Address) return int  -- /usr/include/openssl/core_dispatch.h:589
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_gen_set_template";

   --  skipped function type OSSL_FUNC_keymgmt_gen_set_params_fn

   function OSSL_FUNC_keymgmt_gen_set_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:591
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_gen_set_params";

   --  skipped function type OSSL_FUNC_keymgmt_gen_settable_params_fn

   function OSSL_FUNC_keymgmt_gen_settable_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:593
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_gen_settable_params";

   --  skipped function type OSSL_FUNC_keymgmt_gen_fn

   function OSSL_FUNC_keymgmt_gen (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access function (arg1 : access constant openssl_core_h.ossl_param_st; arg2 : System.Address) return int;
         arg3 : System.Address) return System.Address  -- /usr/include/openssl/core_dispatch.h:596
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_gen";

   --  skipped function type OSSL_FUNC_keymgmt_gen_cleanup_fn

   function OSSL_FUNC_keymgmt_gen_cleanup (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure (arg1 : System.Address)  -- /usr/include/openssl/core_dispatch.h:598
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_gen_cleanup";

  -- Key loading by object reference  
   --  skipped function type OSSL_FUNC_keymgmt_load_fn

   function OSSL_FUNC_keymgmt_load (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : stddef_h.size_t) return System.Address  -- /usr/include/openssl/core_dispatch.h:602
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_load";

  -- Basic key object destruction  
   --  skipped function type OSSL_FUNC_keymgmt_free_fn

   function OSSL_FUNC_keymgmt_free (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure (arg1 : System.Address)  -- /usr/include/openssl/core_dispatch.h:607
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_free";

  -- Key object information, with discovery  
   --  skipped function type OSSL_FUNC_keymgmt_get_params_fn

   function OSSL_FUNC_keymgmt_get_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:612
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_get_params";

   --  skipped function type OSSL_FUNC_keymgmt_gettable_params_fn

   function OSSL_FUNC_keymgmt_gettable_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:614
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_gettable_params";

   --  skipped function type OSSL_FUNC_keymgmt_set_params_fn

   function OSSL_FUNC_keymgmt_set_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:619
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_set_params";

   --  skipped function type OSSL_FUNC_keymgmt_settable_params_fn

   function OSSL_FUNC_keymgmt_settable_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:621
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_settable_params";

  -- Key checks - discovery of supported operations  
   --  skipped function type OSSL_FUNC_keymgmt_query_operation_name_fn

   function OSSL_FUNC_keymgmt_query_operation_name (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/core_dispatch.h:626
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_query_operation_name";

  -- Key checks - key data content checks  
   --  skipped function type OSSL_FUNC_keymgmt_has_fn

   function OSSL_FUNC_keymgmt_has (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : int) return int  -- /usr/include/openssl/core_dispatch.h:631
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_has";

  -- Key checks - validation  
   --  skipped function type OSSL_FUNC_keymgmt_validate_fn

   function OSSL_FUNC_keymgmt_validate (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : int;
         arg3 : int) return int  -- /usr/include/openssl/core_dispatch.h:635
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_validate";

  -- Key checks - matching  
   --  skipped function type OSSL_FUNC_keymgmt_match_fn

   function OSSL_FUNC_keymgmt_match (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : int) return int  -- /usr/include/openssl/core_dispatch.h:640
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_match";

  -- Import and export functions, with discovery  
   --  skipped function type OSSL_FUNC_keymgmt_import_fn

   function OSSL_FUNC_keymgmt_import (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : int;
         arg3 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:649
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_import";

   --  skipped function type OSSL_FUNC_keymgmt_import_types_fn

   function OSSL_FUNC_keymgmt_import_types (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : int) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:651
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_import_types";

   --  skipped function type OSSL_FUNC_keymgmt_export_fn

   function OSSL_FUNC_keymgmt_export (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : int;
         arg3 : access function (arg1 : access constant openssl_core_h.ossl_param_st; arg2 : System.Address) return int;
         arg4 : System.Address) return int  -- /usr/include/openssl/core_dispatch.h:653
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_export";

   --  skipped function type OSSL_FUNC_keymgmt_export_types_fn

   function OSSL_FUNC_keymgmt_export_types (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : int) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:656
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_export_types";

  -- Dup function, constructor  
   --  skipped function type OSSL_FUNC_keymgmt_dup_fn

   function OSSL_FUNC_keymgmt_dup (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : int) return System.Address  -- /usr/include/openssl/core_dispatch.h:661
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_dup";

  -- Extended import and export functions  
   --  skipped function type OSSL_FUNC_keymgmt_import_types_ex_fn

   function OSSL_FUNC_keymgmt_import_types_ex (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : int) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:667
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_import_types_ex";

   --  skipped function type OSSL_FUNC_keymgmt_export_types_ex_fn

   function OSSL_FUNC_keymgmt_export_types_ex (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : int) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:669
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keymgmt_export_types_ex";

  -- Key Exchange  
   --  skipped function type OSSL_FUNC_keyexch_newctx_fn

   function OSSL_FUNC_keyexch_newctx (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return System.Address  -- /usr/include/openssl/core_dispatch.h:685
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keyexch_newctx";

   --  skipped function type OSSL_FUNC_keyexch_init_fn

   function OSSL_FUNC_keyexch_init (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:686
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keyexch_init";

   --  skipped function type OSSL_FUNC_keyexch_derive_fn

   function OSSL_FUNC_keyexch_derive (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : access stddef_h.size_t;
         arg4 : stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:688
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keyexch_derive";

   --  skipped function type OSSL_FUNC_keyexch_set_peer_fn

   function OSSL_FUNC_keyexch_set_peer (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : System.Address) return int  -- /usr/include/openssl/core_dispatch.h:690
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keyexch_set_peer";

   --  skipped function type OSSL_FUNC_keyexch_freectx_fn

   function OSSL_FUNC_keyexch_freectx (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure (arg1 : System.Address)  -- /usr/include/openssl/core_dispatch.h:691
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keyexch_freectx";

   --  skipped function type OSSL_FUNC_keyexch_dupctx_fn

   function OSSL_FUNC_keyexch_dupctx (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return System.Address  -- /usr/include/openssl/core_dispatch.h:692
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keyexch_dupctx";

   --  skipped function type OSSL_FUNC_keyexch_set_ctx_params_fn

   function OSSL_FUNC_keyexch_set_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:693
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keyexch_set_ctx_params";

   --  skipped function type OSSL_FUNC_keyexch_settable_ctx_params_fn

   function OSSL_FUNC_keyexch_settable_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:695
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keyexch_settable_ctx_params";

   --  skipped function type OSSL_FUNC_keyexch_get_ctx_params_fn

   function OSSL_FUNC_keyexch_get_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:697
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keyexch_get_ctx_params";

   --  skipped function type OSSL_FUNC_keyexch_gettable_ctx_params_fn

   function OSSL_FUNC_keyexch_gettable_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:699
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_keyexch_gettable_ctx_params";

  -- Signature  
   --  skipped function type OSSL_FUNC_signature_newctx_fn

   function OSSL_FUNC_signature_newctx (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : Interfaces.C.Strings.chars_ptr) return System.Address  -- /usr/include/openssl/core_dispatch.h:730
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_newctx";

   --  skipped function type OSSL_FUNC_signature_sign_init_fn

   function OSSL_FUNC_signature_sign_init (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:732
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_sign_init";

   --  skipped function type OSSL_FUNC_signature_sign_fn

   function OSSL_FUNC_signature_sign (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : access stddef_h.size_t;
         arg4 : stddef_h.size_t;
         arg5 : access unsigned_char;
         arg6 : stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:734
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_sign";

   --  skipped function type OSSL_FUNC_signature_verify_init_fn

   function OSSL_FUNC_signature_verify_init (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:738
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_verify_init";

   --  skipped function type OSSL_FUNC_signature_verify_fn

   function OSSL_FUNC_signature_verify (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : stddef_h.size_t;
         arg4 : access unsigned_char;
         arg5 : stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:740
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_verify";

   --  skipped function type OSSL_FUNC_signature_verify_recover_init_fn

   function OSSL_FUNC_signature_verify_recover_init (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:745
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_verify_recover_init";

   --  skipped function type OSSL_FUNC_signature_verify_recover_fn

   function OSSL_FUNC_signature_verify_recover (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : access stddef_h.size_t;
         arg4 : stddef_h.size_t;
         arg5 : access unsigned_char;
         arg6 : stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:747
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_verify_recover";

   --  skipped function type OSSL_FUNC_signature_digest_sign_init_fn

   function OSSL_FUNC_signature_digest_sign_init (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : System.Address;
         arg4 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:750
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_digest_sign_init";

   --  skipped function type OSSL_FUNC_signature_digest_sign_update_fn

   function OSSL_FUNC_signature_digest_sign_update (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:753
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_digest_sign_update";

   --  skipped function type OSSL_FUNC_signature_digest_sign_final_fn

   function OSSL_FUNC_signature_digest_sign_final (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : access stddef_h.size_t;
         arg4 : stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:755
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_digest_sign_final";

   --  skipped function type OSSL_FUNC_signature_digest_sign_fn

   function OSSL_FUNC_signature_digest_sign (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : access stddef_h.size_t;
         arg4 : stddef_h.size_t;
         arg5 : access unsigned_char;
         arg6 : stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:758
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_digest_sign";

   --  skipped function type OSSL_FUNC_signature_digest_verify_init_fn

   function OSSL_FUNC_signature_digest_verify_init (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : System.Address;
         arg4 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:761
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_digest_verify_init";

   --  skipped function type OSSL_FUNC_signature_digest_verify_update_fn

   function OSSL_FUNC_signature_digest_verify_update (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:764
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_digest_verify_update";

   --  skipped function type OSSL_FUNC_signature_digest_verify_final_fn

   function OSSL_FUNC_signature_digest_verify_final (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:766
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_digest_verify_final";

   --  skipped function type OSSL_FUNC_signature_digest_verify_fn

   function OSSL_FUNC_signature_digest_verify (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : stddef_h.size_t;
         arg4 : access unsigned_char;
         arg5 : stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:768
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_digest_verify";

   --  skipped function type OSSL_FUNC_signature_freectx_fn

   function OSSL_FUNC_signature_freectx (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure (arg1 : System.Address)  -- /usr/include/openssl/core_dispatch.h:771
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_freectx";

   --  skipped function type OSSL_FUNC_signature_dupctx_fn

   function OSSL_FUNC_signature_dupctx (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return System.Address  -- /usr/include/openssl/core_dispatch.h:772
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_dupctx";

   --  skipped function type OSSL_FUNC_signature_get_ctx_params_fn

   function OSSL_FUNC_signature_get_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:773
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_get_ctx_params";

   --  skipped function type OSSL_FUNC_signature_gettable_ctx_params_fn

   function OSSL_FUNC_signature_gettable_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:775
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_gettable_ctx_params";

   --  skipped function type OSSL_FUNC_signature_set_ctx_params_fn

   function OSSL_FUNC_signature_set_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:777
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_set_ctx_params";

   --  skipped function type OSSL_FUNC_signature_settable_ctx_params_fn

   function OSSL_FUNC_signature_settable_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:779
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_settable_ctx_params";

   --  skipped function type OSSL_FUNC_signature_get_ctx_md_params_fn

   function OSSL_FUNC_signature_get_ctx_md_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:781
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_get_ctx_md_params";

   --  skipped function type OSSL_FUNC_signature_gettable_ctx_md_params_fn

   function OSSL_FUNC_signature_gettable_ctx_md_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:783
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_gettable_ctx_md_params";

   --  skipped function type OSSL_FUNC_signature_set_ctx_md_params_fn

   function OSSL_FUNC_signature_set_ctx_md_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:785
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_set_ctx_md_params";

   --  skipped function type OSSL_FUNC_signature_settable_ctx_md_params_fn

   function OSSL_FUNC_signature_settable_ctx_md_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:787
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_signature_settable_ctx_md_params";

  -- Asymmetric Ciphers  
   --  skipped function type OSSL_FUNC_asym_cipher_newctx_fn

   function OSSL_FUNC_asym_cipher_newctx (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return System.Address  -- /usr/include/openssl/core_dispatch.h:805
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_asym_cipher_newctx";

   --  skipped function type OSSL_FUNC_asym_cipher_encrypt_init_fn

   function OSSL_FUNC_asym_cipher_encrypt_init (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:806
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_asym_cipher_encrypt_init";

   --  skipped function type OSSL_FUNC_asym_cipher_encrypt_fn

   function OSSL_FUNC_asym_cipher_encrypt (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : access stddef_h.size_t;
         arg4 : stddef_h.size_t;
         arg5 : access unsigned_char;
         arg6 : stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:808
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_asym_cipher_encrypt";

   --  skipped function type OSSL_FUNC_asym_cipher_decrypt_init_fn

   function OSSL_FUNC_asym_cipher_decrypt_init (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:813
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_asym_cipher_decrypt_init";

   --  skipped function type OSSL_FUNC_asym_cipher_decrypt_fn

   function OSSL_FUNC_asym_cipher_decrypt (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : access stddef_h.size_t;
         arg4 : stddef_h.size_t;
         arg5 : access unsigned_char;
         arg6 : stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:815
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_asym_cipher_decrypt";

   --  skipped function type OSSL_FUNC_asym_cipher_freectx_fn

   function OSSL_FUNC_asym_cipher_freectx (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure (arg1 : System.Address)  -- /usr/include/openssl/core_dispatch.h:820
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_asym_cipher_freectx";

   --  skipped function type OSSL_FUNC_asym_cipher_dupctx_fn

   function OSSL_FUNC_asym_cipher_dupctx (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return System.Address  -- /usr/include/openssl/core_dispatch.h:821
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_asym_cipher_dupctx";

   --  skipped function type OSSL_FUNC_asym_cipher_get_ctx_params_fn

   function OSSL_FUNC_asym_cipher_get_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:822
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_asym_cipher_get_ctx_params";

   --  skipped function type OSSL_FUNC_asym_cipher_gettable_ctx_params_fn

   function OSSL_FUNC_asym_cipher_gettable_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:824
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_asym_cipher_gettable_ctx_params";

   --  skipped function type OSSL_FUNC_asym_cipher_set_ctx_params_fn

   function OSSL_FUNC_asym_cipher_set_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:826
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_asym_cipher_set_ctx_params";

   --  skipped function type OSSL_FUNC_asym_cipher_settable_ctx_params_fn

   function OSSL_FUNC_asym_cipher_settable_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:828
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_asym_cipher_settable_ctx_params";

  -- Asymmetric Key encapsulation  
   --  skipped function type OSSL_FUNC_kem_newctx_fn

   function OSSL_FUNC_kem_newctx (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return System.Address  -- /usr/include/openssl/core_dispatch.h:846
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kem_newctx";

   --  skipped function type OSSL_FUNC_kem_encapsulate_init_fn

   function OSSL_FUNC_kem_encapsulate_init (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:847
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kem_encapsulate_init";

   --  skipped function type OSSL_FUNC_kem_auth_encapsulate_init_fn

   function OSSL_FUNC_kem_auth_encapsulate_init (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address;
         arg4 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:849
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kem_auth_encapsulate_init";

   --  skipped function type OSSL_FUNC_kem_encapsulate_fn

   function OSSL_FUNC_kem_encapsulate (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : access stddef_h.size_t;
         arg4 : access unsigned_char;
         arg5 : access stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:852
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kem_encapsulate";

   --  skipped function type OSSL_FUNC_kem_decapsulate_init_fn

   function OSSL_FUNC_kem_decapsulate_init (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:856
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kem_decapsulate_init";

   --  skipped function type OSSL_FUNC_kem_auth_decapsulate_init_fn

   function OSSL_FUNC_kem_auth_decapsulate_init (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address;
         arg4 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:858
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kem_auth_decapsulate_init";

   --  skipped function type OSSL_FUNC_kem_decapsulate_fn

   function OSSL_FUNC_kem_decapsulate (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : access stddef_h.size_t;
         arg4 : access unsigned_char;
         arg5 : stddef_h.size_t) return int  -- /usr/include/openssl/core_dispatch.h:861
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kem_decapsulate";

   --  skipped function type OSSL_FUNC_kem_freectx_fn

   function OSSL_FUNC_kem_freectx (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure (arg1 : System.Address)  -- /usr/include/openssl/core_dispatch.h:864
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kem_freectx";

   --  skipped function type OSSL_FUNC_kem_dupctx_fn

   function OSSL_FUNC_kem_dupctx (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return System.Address  -- /usr/include/openssl/core_dispatch.h:865
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kem_dupctx";

   --  skipped function type OSSL_FUNC_kem_get_ctx_params_fn

   function OSSL_FUNC_kem_get_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:866
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kem_get_ctx_params";

   --  skipped function type OSSL_FUNC_kem_gettable_ctx_params_fn

   function OSSL_FUNC_kem_gettable_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:867
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kem_gettable_ctx_params";

   --  skipped function type OSSL_FUNC_kem_set_ctx_params_fn

   function OSSL_FUNC_kem_set_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:869
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kem_set_ctx_params";

   --  skipped function type OSSL_FUNC_kem_settable_ctx_params_fn

   function OSSL_FUNC_kem_settable_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:871
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_kem_settable_ctx_params";

  -- Encoders and decoders  
   --  skipped function type OSSL_FUNC_encoder_newctx_fn

   function OSSL_FUNC_encoder_newctx (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return System.Address  -- /usr/include/openssl/core_dispatch.h:885
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_encoder_newctx";

   --  skipped function type OSSL_FUNC_encoder_freectx_fn

   function OSSL_FUNC_encoder_freectx (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure (arg1 : System.Address)  -- /usr/include/openssl/core_dispatch.h:886
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_encoder_freectx";

   --  skipped function type OSSL_FUNC_encoder_get_params_fn

   function OSSL_FUNC_encoder_get_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:887
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_encoder_get_params";

   --  skipped function type OSSL_FUNC_encoder_gettable_params_fn

   function OSSL_FUNC_encoder_gettable_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:888
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_encoder_gettable_params";

   --  skipped function type OSSL_FUNC_encoder_set_ctx_params_fn

   function OSSL_FUNC_encoder_set_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:890
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_encoder_set_ctx_params";

   --  skipped function type OSSL_FUNC_encoder_settable_ctx_params_fn

   function OSSL_FUNC_encoder_settable_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:892
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_encoder_settable_ctx_params";

   --  skipped function type OSSL_FUNC_encoder_does_selection_fn

   function OSSL_FUNC_encoder_does_selection (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : int) return int  -- /usr/include/openssl/core_dispatch.h:895
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_encoder_does_selection";

   --  skipped function type OSSL_FUNC_encoder_encode_fn

   function OSSL_FUNC_encoder_encode (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access openssl_core_h.ossl_core_bio_st;
         arg3 : System.Address;
         arg4 : access constant openssl_core_h.ossl_param_st;
         arg5 : int;
         arg6 : access function
           (arg1 : Interfaces.C.Strings.chars_ptr;
            arg2 : stddef_h.size_t;
            arg3 : access stddef_h.size_t;
            arg4 : access constant openssl_core_h.ossl_param_st;
            arg5 : System.Address) return int;
         arg7 : System.Address) return int  -- /usr/include/openssl/core_dispatch.h:897
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_encoder_encode";

   --  skipped function type OSSL_FUNC_encoder_import_object_fn

   function OSSL_FUNC_encoder_import_object (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : int;
         arg3 : access constant openssl_core_h.ossl_param_st) return System.Address  -- /usr/include/openssl/core_dispatch.h:903
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_encoder_import_object";

   --  skipped function type OSSL_FUNC_encoder_free_object_fn

   function OSSL_FUNC_encoder_free_object (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure (arg1 : System.Address)  -- /usr/include/openssl/core_dispatch.h:905
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_encoder_free_object";

   --  skipped function type OSSL_FUNC_decoder_newctx_fn

   function OSSL_FUNC_decoder_newctx (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return System.Address  -- /usr/include/openssl/core_dispatch.h:916
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_decoder_newctx";

   --  skipped function type OSSL_FUNC_decoder_freectx_fn

   function OSSL_FUNC_decoder_freectx (opf : access constant openssl_core_h.ossl_dispatch_st) return access procedure (arg1 : System.Address)  -- /usr/include/openssl/core_dispatch.h:917
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_decoder_freectx";

   --  skipped function type OSSL_FUNC_decoder_get_params_fn

   function OSSL_FUNC_decoder_get_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : access openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:918
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_decoder_get_params";

   --  skipped function type OSSL_FUNC_decoder_gettable_params_fn

   function OSSL_FUNC_decoder_gettable_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:919
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_decoder_gettable_params";

   --  skipped function type OSSL_FUNC_decoder_set_ctx_params_fn

   function OSSL_FUNC_decoder_set_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:921
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_decoder_set_ctx_params";

   --  skipped function type OSSL_FUNC_decoder_settable_ctx_params_fn

   function OSSL_FUNC_decoder_settable_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:923
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_decoder_settable_ctx_params";

   --  skipped function type OSSL_FUNC_decoder_does_selection_fn

   function OSSL_FUNC_decoder_does_selection (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : int) return int  -- /usr/include/openssl/core_dispatch.h:926
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_decoder_does_selection";

   --  skipped function type OSSL_FUNC_decoder_decode_fn

   function OSSL_FUNC_decoder_decode (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access openssl_core_h.ossl_core_bio_st;
         arg3 : int;
         arg4 : access function (arg1 : access constant openssl_core_h.ossl_param_st; arg2 : System.Address) return int;
         arg5 : System.Address;
         arg6 : access function
           (arg1 : Interfaces.C.Strings.chars_ptr;
            arg2 : stddef_h.size_t;
            arg3 : access stddef_h.size_t;
            arg4 : access constant openssl_core_h.ossl_param_st;
            arg5 : System.Address) return int;
         arg7 : System.Address) return int  -- /usr/include/openssl/core_dispatch.h:928
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_decoder_decode";

   --  skipped function type OSSL_FUNC_decoder_export_object_fn

   function OSSL_FUNC_decoder_export_object (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : stddef_h.size_t;
         arg4 : access function (arg1 : access constant openssl_core_h.ossl_param_st; arg2 : System.Address) return int;
         arg5 : System.Address) return int  -- /usr/include/openssl/core_dispatch.h:932
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_decoder_export_object";

  ---
  -- * Store
  -- *
  -- * Objects are scanned by using the 'open', 'load', 'eof' and 'close'
  -- * functions, which implement an OSSL_STORE loader.
  -- *
  -- * store_load() works in a way that's very similar to the decoders, in
  -- * that they pass an abstract object through a callback, either as a DER
  -- * octet string or as an object reference, which libcrypto will have to
  -- * deal with.
  --  

   --  skipped function type OSSL_FUNC_store_open_fn

   function OSSL_FUNC_store_open (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : Interfaces.C.Strings.chars_ptr) return System.Address  -- /usr/include/openssl/core_dispatch.h:958
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_store_open";

   --  skipped function type OSSL_FUNC_store_attach_fn

   function OSSL_FUNC_store_attach (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access openssl_core_h.ossl_core_bio_st) return System.Address  -- /usr/include/openssl/core_dispatch.h:959
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_store_attach";

   --  skipped function type OSSL_FUNC_store_settable_ctx_params_fn

   function OSSL_FUNC_store_settable_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/core_dispatch.h:960
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_store_settable_ctx_params";

   --  skipped function type OSSL_FUNC_store_set_ctx_params_fn

   function OSSL_FUNC_store_set_ctx_params (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address; arg2 : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/core_dispatch.h:962
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_store_set_ctx_params";

   --  skipped function type OSSL_FUNC_store_load_fn

   function OSSL_FUNC_store_load (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : access function (arg1 : access constant openssl_core_h.ossl_param_st; arg2 : System.Address) return int;
         arg3 : System.Address;
         arg4 : access function
           (arg1 : Interfaces.C.Strings.chars_ptr;
            arg2 : stddef_h.size_t;
            arg3 : access stddef_h.size_t;
            arg4 : access constant openssl_core_h.ossl_param_st;
            arg5 : System.Address) return int;
         arg5 : System.Address) return int  -- /usr/include/openssl/core_dispatch.h:964
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_store_load";

   --  skipped function type OSSL_FUNC_store_eof_fn

   function OSSL_FUNC_store_eof (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return int  -- /usr/include/openssl/core_dispatch.h:968
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_store_eof";

   --  skipped function type OSSL_FUNC_store_close_fn

   function OSSL_FUNC_store_close (opf : access constant openssl_core_h.ossl_dispatch_st) return access function (arg1 : System.Address) return int  -- /usr/include/openssl/core_dispatch.h:969
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_store_close";

   --  skipped function type OSSL_FUNC_store_export_object_fn

   function OSSL_FUNC_store_export_object (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : stddef_h.size_t;
         arg4 : access function (arg1 : access constant openssl_core_h.ossl_param_st; arg2 : System.Address) return int;
         arg5 : System.Address) return int  -- /usr/include/openssl/core_dispatch.h:970
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_store_export_object";

   --  skipped function type OSSL_FUNC_store_delete_fn

   function OSSL_FUNC_store_delete (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : access constant openssl_core_h.ossl_param_st;
         arg4 : access function
           (arg1 : Interfaces.C.Strings.chars_ptr;
            arg2 : stddef_h.size_t;
            arg3 : access stddef_h.size_t;
            arg4 : access constant openssl_core_h.ossl_param_st;
            arg5 : System.Address) return int;
         arg5 : System.Address) return int  -- /usr/include/openssl/core_dispatch.h:973
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_store_delete";

   --  skipped function type OSSL_FUNC_store_open_ex_fn

   function OSSL_FUNC_store_open_ex (opf : access constant openssl_core_h.ossl_dispatch_st) return access function
        (arg1 : System.Address;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : access constant openssl_core_h.ossl_param_st;
         arg4 : access function
           (arg1 : Interfaces.C.Strings.chars_ptr;
            arg2 : stddef_h.size_t;
            arg3 : access stddef_h.size_t;
            arg4 : access constant openssl_core_h.ossl_param_st;
            arg5 : System.Address) return int;
         arg5 : System.Address) return System.Address  -- /usr/include/openssl/core_dispatch.h:976
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_FUNC_store_open_ex";

end openssl_core_dispatch_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
