pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package openssl_cryptoerr_legacy_h is

   ASN1_F_A2D_ASN1_OBJECT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:82
   ASN1_F_A2I_ASN1_INTEGER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:83
   ASN1_F_A2I_ASN1_STRING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:84
   ASN1_F_APPEND_EXP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:85
   ASN1_F_ASN1_BIO_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:86
   ASN1_F_ASN1_BIT_STRING_SET_BIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:87
   ASN1_F_ASN1_CB : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:88
   ASN1_F_ASN1_CHECK_TLEN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:89
   ASN1_F_ASN1_COLLECT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:90
   ASN1_F_ASN1_D2I_EX_PRIMITIVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:91
   ASN1_F_ASN1_D2I_FP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:92
   ASN1_F_ASN1_D2I_READ_BIO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:93
   ASN1_F_ASN1_DIGEST : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:94
   ASN1_F_ASN1_DO_ADB : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:95
   ASN1_F_ASN1_DO_LOCK : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:96
   ASN1_F_ASN1_DUP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:97
   ASN1_F_ASN1_ENC_SAVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:98
   ASN1_F_ASN1_EX_C2I : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:99
   ASN1_F_ASN1_FIND_END : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:100
   ASN1_F_ASN1_GENERALIZEDTIME_ADJ : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:101
   ASN1_F_ASN1_GENERATE_V3 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:102
   ASN1_F_ASN1_GET_INT64 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:103
   ASN1_F_ASN1_GET_OBJECT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:104
   ASN1_F_ASN1_GET_UINT64 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:105
   ASN1_F_ASN1_I2D_BIO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:106
   ASN1_F_ASN1_I2D_FP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:107
   ASN1_F_ASN1_ITEM_D2I_FP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:108
   ASN1_F_ASN1_ITEM_DUP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:109
   ASN1_F_ASN1_ITEM_EMBED_D2I : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:110
   ASN1_F_ASN1_ITEM_EMBED_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:111
   ASN1_F_ASN1_ITEM_FLAGS_I2D : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:112
   ASN1_F_ASN1_ITEM_I2D_BIO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:113
   ASN1_F_ASN1_ITEM_I2D_FP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:114
   ASN1_F_ASN1_ITEM_PACK : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:115
   ASN1_F_ASN1_ITEM_SIGN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:116
   ASN1_F_ASN1_ITEM_SIGN_CTX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:117
   ASN1_F_ASN1_ITEM_UNPACK : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:118
   ASN1_F_ASN1_ITEM_VERIFY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:119
   ASN1_F_ASN1_MBSTRING_NCOPY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:120
   ASN1_F_ASN1_OBJECT_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:121
   ASN1_F_ASN1_OUTPUT_DATA : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:122
   ASN1_F_ASN1_PCTX_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:123
   ASN1_F_ASN1_PRIMITIVE_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:124
   ASN1_F_ASN1_SCTX_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:125
   ASN1_F_ASN1_SIGN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:126
   ASN1_F_ASN1_STR2TYPE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:127
   ASN1_F_ASN1_STRING_GET_INT64 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:128
   ASN1_F_ASN1_STRING_GET_UINT64 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:129
   ASN1_F_ASN1_STRING_SET : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:130
   ASN1_F_ASN1_STRING_TABLE_ADD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:131
   ASN1_F_ASN1_STRING_TO_BN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:132
   ASN1_F_ASN1_STRING_TYPE_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:133
   ASN1_F_ASN1_TEMPLATE_EX_D2I : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:134
   ASN1_F_ASN1_TEMPLATE_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:135
   ASN1_F_ASN1_TEMPLATE_NOEXP_D2I : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:136
   ASN1_F_ASN1_TIME_ADJ : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:137
   ASN1_F_ASN1_TYPE_GET_INT_OCTETSTRING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:138
   ASN1_F_ASN1_TYPE_GET_OCTETSTRING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:139
   ASN1_F_ASN1_UTCTIME_ADJ : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:140
   ASN1_F_ASN1_VERIFY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:141
   ASN1_F_B64_READ_ASN1 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:142
   ASN1_F_B64_WRITE_ASN1 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:143
   ASN1_F_BIO_NEW_NDEF : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:144
   ASN1_F_BITSTR_CB : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:145
   ASN1_F_BN_TO_ASN1_STRING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:146
   ASN1_F_C2I_ASN1_BIT_STRING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:147
   ASN1_F_C2I_ASN1_INTEGER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:148
   ASN1_F_C2I_ASN1_OBJECT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:149
   ASN1_F_C2I_IBUF : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:150
   ASN1_F_C2I_UINT64_INT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:151
   ASN1_F_COLLECT_DATA : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:152
   ASN1_F_D2I_ASN1_OBJECT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:153
   ASN1_F_D2I_ASN1_UINTEGER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:154
   ASN1_F_D2I_AUTOPRIVATEKEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:155
   ASN1_F_D2I_PRIVATEKEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:156
   ASN1_F_D2I_PUBLICKEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:157
   ASN1_F_DO_BUF : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:158
   ASN1_F_DO_CREATE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:159
   ASN1_F_DO_DUMP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:160
   ASN1_F_DO_TCREATE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:161
   ASN1_F_I2A_ASN1_OBJECT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:162
   ASN1_F_I2D_ASN1_BIO_STREAM : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:163
   ASN1_F_I2D_ASN1_OBJECT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:164
   ASN1_F_I2D_DSA_PUBKEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:165
   ASN1_F_I2D_EC_PUBKEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:166
   ASN1_F_I2D_PRIVATEKEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:167
   ASN1_F_I2D_PUBLICKEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:168
   ASN1_F_I2D_RSA_PUBKEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:169
   ASN1_F_LONG_C2I : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:170
   ASN1_F_NDEF_PREFIX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:171
   ASN1_F_NDEF_SUFFIX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:172
   ASN1_F_OID_MODULE_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:173
   ASN1_F_PARSE_TAGGING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:174
   ASN1_F_PKCS5_PBE2_SET_IV : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:175
   ASN1_F_PKCS5_PBE2_SET_SCRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:176
   ASN1_F_PKCS5_PBE_SET : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:177
   ASN1_F_PKCS5_PBE_SET0_ALGOR : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:178
   ASN1_F_PKCS5_PBKDF2_SET : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:179
   ASN1_F_PKCS5_SCRYPT_SET : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:180
   ASN1_F_SMIME_READ_ASN1 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:181
   ASN1_F_SMIME_TEXT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:182
   ASN1_F_STABLE_GET : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:183
   ASN1_F_STBL_MODULE_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:184
   ASN1_F_UINT32_C2I : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:185
   ASN1_F_UINT32_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:186
   ASN1_F_UINT64_C2I : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:187
   ASN1_F_UINT64_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:188
   ASN1_F_X509_CRL_ADD0_REVOKED : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:189
   ASN1_F_X509_INFO_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:190
   ASN1_F_X509_NAME_ENCODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:191
   ASN1_F_X509_NAME_EX_D2I : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:192
   ASN1_F_X509_NAME_EX_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:193
   ASN1_F_X509_PKEY_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:194

   ASYNC_F_ASYNC_CTX_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:199
   ASYNC_F_ASYNC_INIT_THREAD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:200
   ASYNC_F_ASYNC_JOB_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:201
   ASYNC_F_ASYNC_PAUSE_JOB : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:202
   ASYNC_F_ASYNC_START_FUNC : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:203
   ASYNC_F_ASYNC_START_JOB : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:204
   ASYNC_F_ASYNC_WAIT_CTX_SET_WAIT_FD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:205

   BIO_F_ACPT_STATE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:210
   BIO_F_ADDRINFO_WRAP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:211
   BIO_F_ADDR_STRINGS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:212
   BIO_F_BIO_ACCEPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:213
   BIO_F_BIO_ACCEPT_EX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:214
   BIO_F_BIO_ACCEPT_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:215
   BIO_F_BIO_ADDR_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:216
   BIO_F_BIO_BIND : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:217
   BIO_F_BIO_CALLBACK_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:218
   BIO_F_BIO_CONNECT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:219
   BIO_F_BIO_CONNECT_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:220
   BIO_F_BIO_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:221
   BIO_F_BIO_GETS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:222
   BIO_F_BIO_GET_HOST_IP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:223
   BIO_F_BIO_GET_NEW_INDEX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:224
   BIO_F_BIO_GET_PORT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:225
   BIO_F_BIO_LISTEN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:226
   BIO_F_BIO_LOOKUP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:227
   BIO_F_BIO_LOOKUP_EX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:228
   BIO_F_BIO_MAKE_PAIR : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:229
   BIO_F_BIO_METH_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:230
   BIO_F_BIO_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:231
   BIO_F_BIO_NEW_DGRAM_SCTP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:232
   BIO_F_BIO_NEW_FILE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:233
   BIO_F_BIO_NEW_MEM_BUF : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:234
   BIO_F_BIO_NREAD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:235
   BIO_F_BIO_NREAD0 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:236
   BIO_F_BIO_NWRITE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:237
   BIO_F_BIO_NWRITE0 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:238
   BIO_F_BIO_PARSE_HOSTSERV : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:239
   BIO_F_BIO_PUTS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:240
   BIO_F_BIO_READ : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:241
   BIO_F_BIO_READ_EX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:242
   BIO_F_BIO_READ_INTERN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:243
   BIO_F_BIO_SOCKET : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:244
   BIO_F_BIO_SOCKET_NBIO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:245
   BIO_F_BIO_SOCK_INFO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:246
   BIO_F_BIO_SOCK_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:247
   BIO_F_BIO_WRITE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:248
   BIO_F_BIO_WRITE_EX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:249
   BIO_F_BIO_WRITE_INTERN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:250
   BIO_F_BUFFER_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:251
   BIO_F_CONN_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:252
   BIO_F_CONN_STATE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:253
   BIO_F_DGRAM_SCTP_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:254
   BIO_F_DGRAM_SCTP_READ : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:255
   BIO_F_DGRAM_SCTP_WRITE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:256
   BIO_F_DOAPR_OUTCH : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:257
   BIO_F_FILE_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:258
   BIO_F_FILE_READ : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:259
   BIO_F_LINEBUFFER_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:260
   BIO_F_LINEBUFFER_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:261
   BIO_F_MEM_WRITE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:262
   BIO_F_NBIOF_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:263
   BIO_F_SLG_WRITE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:264
   BIO_F_SSL_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:265

   BN_F_BNRAND : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:270
   BN_F_BNRAND_RANGE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:271
   BN_F_BN_BLINDING_CONVERT_EX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:272
   BN_F_BN_BLINDING_CREATE_PARAM : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:273
   BN_F_BN_BLINDING_INVERT_EX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:274
   BN_F_BN_BLINDING_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:275
   BN_F_BN_BLINDING_UPDATE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:276
   BN_F_BN_BN2DEC : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:277
   BN_F_BN_BN2HEX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:278
   BN_F_BN_COMPUTE_WNAF : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:279
   BN_F_BN_CTX_GET : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:280
   BN_F_BN_CTX_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:281
   BN_F_BN_CTX_START : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:282
   BN_F_BN_DIV : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:283
   BN_F_BN_DIV_RECP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:284
   BN_F_BN_EXP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:285
   BN_F_BN_EXPAND_INTERNAL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:286
   BN_F_BN_GENCB_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:287
   BN_F_BN_GENERATE_DSA_NONCE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:288
   BN_F_BN_GENERATE_PRIME_EX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:289
   BN_F_BN_GF2M_MOD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:290
   BN_F_BN_GF2M_MOD_EXP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:291
   BN_F_BN_GF2M_MOD_MUL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:292
   BN_F_BN_GF2M_MOD_SOLVE_QUAD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:293
   BN_F_BN_GF2M_MOD_SOLVE_QUAD_ARR : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:294
   BN_F_BN_GF2M_MOD_SQR : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:295
   BN_F_BN_GF2M_MOD_SQRT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:296
   BN_F_BN_LSHIFT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:297
   BN_F_BN_MOD_EXP2_MONT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:298
   BN_F_BN_MOD_EXP_MONT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:299
   BN_F_BN_MOD_EXP_MONT_CONSTTIME : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:300
   BN_F_BN_MOD_EXP_MONT_WORD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:301
   BN_F_BN_MOD_EXP_RECP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:302
   BN_F_BN_MOD_EXP_SIMPLE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:303
   BN_F_BN_MOD_INVERSE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:304
   BN_F_BN_MOD_INVERSE_NO_BRANCH : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:305
   BN_F_BN_MOD_LSHIFT_QUICK : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:306
   BN_F_BN_MOD_SQRT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:307
   BN_F_BN_MONT_CTX_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:308
   BN_F_BN_MPI2BN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:309
   BN_F_BN_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:310
   BN_F_BN_POOL_GET : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:311
   BN_F_BN_RAND : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:312
   BN_F_BN_RAND_RANGE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:313
   BN_F_BN_RECP_CTX_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:314
   BN_F_BN_RSHIFT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:315
   BN_F_BN_SET_WORDS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:316
   BN_F_BN_STACK_PUSH : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:317
   BN_F_BN_USUB : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:318

   BUF_F_BUF_MEM_GROW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:323
   BUF_F_BUF_MEM_GROW_CLEAN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:324
   BUF_F_BUF_MEM_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:325

   CMS_F_CHECK_CONTENT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:331
   CMS_F_CMS_ADD0_CERT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:332
   CMS_F_CMS_ADD0_RECIPIENT_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:333
   CMS_F_CMS_ADD0_RECIPIENT_PASSWORD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:334
   CMS_F_CMS_ADD1_RECEIPTREQUEST : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:335
   CMS_F_CMS_ADD1_RECIPIENT_CERT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:336
   CMS_F_CMS_ADD1_SIGNER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:337
   CMS_F_CMS_ADD1_SIGNINGTIME : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:338
   CMS_F_CMS_COMPRESS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:339
   CMS_F_CMS_COMPRESSEDDATA_CREATE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:340
   CMS_F_CMS_COMPRESSEDDATA_INIT_BIO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:341
   CMS_F_CMS_COPY_CONTENT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:342
   CMS_F_CMS_COPY_MESSAGEDIGEST : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:343
   CMS_F_CMS_DATA : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:344
   CMS_F_CMS_DATAFINAL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:345
   CMS_F_CMS_DATAINIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:346
   CMS_F_CMS_DECRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:347
   CMS_F_CMS_DECRYPT_SET1_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:348
   CMS_F_CMS_DECRYPT_SET1_PASSWORD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:349
   CMS_F_CMS_DECRYPT_SET1_PKEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:350
   CMS_F_CMS_DIGESTALGORITHM_FIND_CTX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:351
   CMS_F_CMS_DIGESTALGORITHM_INIT_BIO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:352
   CMS_F_CMS_DIGESTEDDATA_DO_FINAL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:353
   CMS_F_CMS_DIGEST_VERIFY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:354
   CMS_F_CMS_ENCODE_RECEIPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:355
   CMS_F_CMS_ENCRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:356
   CMS_F_CMS_ENCRYPTEDCONTENT_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:357
   CMS_F_CMS_ENCRYPTEDCONTENT_INIT_BIO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:358
   CMS_F_CMS_ENCRYPTEDDATA_DECRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:359
   CMS_F_CMS_ENCRYPTEDDATA_ENCRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:360
   CMS_F_CMS_ENCRYPTEDDATA_SET1_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:361
   CMS_F_CMS_ENVELOPEDDATA_CREATE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:362
   CMS_F_CMS_ENVELOPEDDATA_INIT_BIO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:363
   CMS_F_CMS_ENVELOPED_DATA_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:364
   CMS_F_CMS_ENV_ASN1_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:365
   CMS_F_CMS_FINAL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:366
   CMS_F_CMS_GET0_CERTIFICATE_CHOICES : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:367
   CMS_F_CMS_GET0_CONTENT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:368
   CMS_F_CMS_GET0_ECONTENT_TYPE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:369
   CMS_F_CMS_GET0_ENVELOPED : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:370
   CMS_F_CMS_GET0_REVOCATION_CHOICES : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:371
   CMS_F_CMS_GET0_SIGNED : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:372
   CMS_F_CMS_MSGSIGDIGEST_ADD1 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:373
   CMS_F_CMS_RECEIPTREQUEST_CREATE0 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:374
   CMS_F_CMS_RECEIPT_VERIFY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:375
   CMS_F_CMS_RECIPIENTINFO_DECRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:376
   CMS_F_CMS_RECIPIENTINFO_ENCRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:377
   CMS_F_CMS_RECIPIENTINFO_KARI_ENCRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:378
   CMS_F_CMS_RECIPIENTINFO_KARI_GET0_ALG : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:379
   CMS_F_CMS_RECIPIENTINFO_KARI_GET0_ORIG_ID : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:380
   CMS_F_CMS_RECIPIENTINFO_KARI_GET0_REKS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:381
   CMS_F_CMS_RECIPIENTINFO_KARI_ORIG_ID_CMP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:382
   CMS_F_CMS_RECIPIENTINFO_KEKRI_DECRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:383
   CMS_F_CMS_RECIPIENTINFO_KEKRI_ENCRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:384
   CMS_F_CMS_RECIPIENTINFO_KEKRI_GET0_ID : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:385
   CMS_F_CMS_RECIPIENTINFO_KEKRI_ID_CMP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:386
   CMS_F_CMS_RECIPIENTINFO_KTRI_CERT_CMP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:387
   CMS_F_CMS_RECIPIENTINFO_KTRI_DECRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:388
   CMS_F_CMS_RECIPIENTINFO_KTRI_ENCRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:389
   CMS_F_CMS_RECIPIENTINFO_KTRI_GET0_ALGS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:390
   CMS_F_CMS_RECIPIENTINFO_KTRI_GET0_SIGNER_ID : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:391
   CMS_F_CMS_RECIPIENTINFO_PWRI_CRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:392
   CMS_F_CMS_RECIPIENTINFO_SET0_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:393
   CMS_F_CMS_RECIPIENTINFO_SET0_PASSWORD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:394
   CMS_F_CMS_RECIPIENTINFO_SET0_PKEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:395
   CMS_F_CMS_SD_ASN1_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:396
   CMS_F_CMS_SET1_IAS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:397
   CMS_F_CMS_SET1_KEYID : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:398
   CMS_F_CMS_SET1_SIGNERIDENTIFIER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:399
   CMS_F_CMS_SET_DETACHED : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:400
   CMS_F_CMS_SIGN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:401
   CMS_F_CMS_SIGNED_DATA_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:402
   CMS_F_CMS_SIGNERINFO_CONTENT_SIGN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:403
   CMS_F_CMS_SIGNERINFO_SIGN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:404
   CMS_F_CMS_SIGNERINFO_VERIFY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:405
   CMS_F_CMS_SIGNERINFO_VERIFY_CERT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:406
   CMS_F_CMS_SIGNERINFO_VERIFY_CONTENT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:407
   CMS_F_CMS_SIGN_RECEIPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:408
   CMS_F_CMS_SI_CHECK_ATTRIBUTES : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:409
   CMS_F_CMS_STREAM : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:410
   CMS_F_CMS_UNCOMPRESS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:411
   CMS_F_CMS_VERIFY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:412
   CMS_F_KEK_UNWRAP_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:413

   COMP_F_BIO_ZLIB_FLUSH : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:420
   COMP_F_BIO_ZLIB_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:421
   COMP_F_BIO_ZLIB_READ : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:422
   COMP_F_BIO_ZLIB_WRITE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:423
   COMP_F_COMP_CTX_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:424

   CONF_F_CONF_DUMP_FP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:430
   CONF_F_CONF_LOAD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:431
   CONF_F_CONF_LOAD_FP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:432
   CONF_F_CONF_PARSE_LIST : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:433
   CONF_F_DEF_LOAD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:434
   CONF_F_DEF_LOAD_BIO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:435
   CONF_F_GET_NEXT_FILE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:436
   CONF_F_MODULE_ADD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:437
   CONF_F_MODULE_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:438
   CONF_F_MODULE_LOAD_DSO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:439
   CONF_F_MODULE_RUN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:440
   CONF_F_NCONF_DUMP_BIO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:441
   CONF_F_NCONF_DUMP_FP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:442
   CONF_F_NCONF_GET_NUMBER_E : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:443
   CONF_F_NCONF_GET_SECTION : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:444
   CONF_F_NCONF_GET_STRING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:445
   CONF_F_NCONF_LOAD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:446
   CONF_F_NCONF_LOAD_BIO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:447
   CONF_F_NCONF_LOAD_FP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:448
   CONF_F_NCONF_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:449
   CONF_F_PROCESS_INCLUDE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:450
   CONF_F_SSL_MODULE_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:451
   CONF_F_STR_COPY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:452

   CRYPTO_F_CMAC_CTX_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:457
   CRYPTO_F_CRYPTO_DUP_EX_DATA : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:458
   CRYPTO_F_CRYPTO_FREE_EX_DATA : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:459
   CRYPTO_F_CRYPTO_GET_EX_NEW_INDEX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:460
   CRYPTO_F_CRYPTO_MEMDUP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:461
   CRYPTO_F_CRYPTO_NEW_EX_DATA : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:462
   CRYPTO_F_CRYPTO_OCB128_COPY_CTX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:463
   CRYPTO_F_CRYPTO_OCB128_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:464
   CRYPTO_F_CRYPTO_SET_EX_DATA : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:465
   CRYPTO_F_GET_AND_LOCK : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:466
   CRYPTO_F_OPENSSL_ATEXIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:467
   CRYPTO_F_OPENSSL_BUF2HEXSTR : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:468
   CRYPTO_F_OPENSSL_FOPEN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:469
   CRYPTO_F_OPENSSL_HEXSTR2BUF : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:470
   CRYPTO_F_OPENSSL_INIT_CRYPTO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:471
   CRYPTO_F_OPENSSL_LH_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:472
   CRYPTO_F_OPENSSL_SK_DEEP_COPY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:473
   CRYPTO_F_OPENSSL_SK_DUP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:474
   CRYPTO_F_PKEY_HMAC_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:475
   CRYPTO_F_PKEY_POLY1305_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:476
   CRYPTO_F_PKEY_SIPHASH_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:477
   CRYPTO_F_SK_RESERVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:478

   CT_F_CTLOG_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:484
   CT_F_CTLOG_NEW_FROM_BASE64 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:485
   CT_F_CTLOG_NEW_FROM_CONF : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:486
   CT_F_CTLOG_STORE_LOAD_CTX_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:487
   CT_F_CTLOG_STORE_LOAD_FILE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:488
   CT_F_CTLOG_STORE_LOAD_LOG : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:489
   CT_F_CTLOG_STORE_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:490
   CT_F_CT_BASE64_DECODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:491
   CT_F_CT_POLICY_EVAL_CTX_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:492
   CT_F_CT_V1_LOG_ID_FROM_PKEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:493
   CT_F_I2O_SCT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:494
   CT_F_I2O_SCT_LIST : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:495
   CT_F_I2O_SCT_SIGNATURE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:496
   CT_F_O2I_SCT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:497
   CT_F_O2I_SCT_LIST : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:498
   CT_F_O2I_SCT_SIGNATURE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:499
   CT_F_SCT_CTX_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:500
   CT_F_SCT_CTX_VERIFY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:501
   CT_F_SCT_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:502
   CT_F_SCT_NEW_FROM_BASE64 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:503
   CT_F_SCT_SET0_LOG_ID : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:504
   CT_F_SCT_SET1_EXTENSIONS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:505
   CT_F_SCT_SET1_LOG_ID : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:506
   CT_F_SCT_SET1_SIGNATURE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:507
   CT_F_SCT_SET_LOG_ENTRY_TYPE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:508
   CT_F_SCT_SET_SIGNATURE_NID : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:509
   CT_F_SCT_SET_VERSION : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:510

   DH_F_COMPUTE_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:517
   DH_F_DHPARAMS_PRINT_FP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:518
   DH_F_DH_BUILTIN_GENPARAMS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:519
   DH_F_DH_CHECK_EX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:520
   DH_F_DH_CHECK_PARAMS_EX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:521
   DH_F_DH_CHECK_PUB_KEY_EX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:522
   DH_F_DH_CMS_DECRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:523
   DH_F_DH_CMS_SET_PEERKEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:524
   DH_F_DH_CMS_SET_SHARED_INFO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:525
   DH_F_DH_METH_DUP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:526
   DH_F_DH_METH_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:527
   DH_F_DH_METH_SET1_NAME : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:528
   DH_F_DH_NEW_BY_NID : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:529
   DH_F_DH_NEW_METHOD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:530
   DH_F_DH_PARAM_DECODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:531
   DH_F_DH_PKEY_PUBLIC_CHECK : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:532
   DH_F_DH_PRIV_DECODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:533
   DH_F_DH_PRIV_ENCODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:534
   DH_F_DH_PUB_DECODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:535
   DH_F_DH_PUB_ENCODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:536
   DH_F_DO_DH_PRINT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:537
   DH_F_GENERATE_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:538
   DH_F_PKEY_DH_CTRL_STR : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:539
   DH_F_PKEY_DH_DERIVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:540
   DH_F_PKEY_DH_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:541
   DH_F_PKEY_DH_KEYGEN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:542

   DSA_F_DSAPARAMS_PRINT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:549
   DSA_F_DSAPARAMS_PRINT_FP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:550
   DSA_F_DSA_BUILTIN_PARAMGEN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:551
   DSA_F_DSA_BUILTIN_PARAMGEN2 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:552
   DSA_F_DSA_DO_SIGN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:553
   DSA_F_DSA_DO_VERIFY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:554
   DSA_F_DSA_METH_DUP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:555
   DSA_F_DSA_METH_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:556
   DSA_F_DSA_METH_SET1_NAME : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:557
   DSA_F_DSA_NEW_METHOD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:558
   DSA_F_DSA_PARAM_DECODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:559
   DSA_F_DSA_PRINT_FP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:560
   DSA_F_DSA_PRIV_DECODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:561
   DSA_F_DSA_PRIV_ENCODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:562
   DSA_F_DSA_PUB_DECODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:563
   DSA_F_DSA_PUB_ENCODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:564
   DSA_F_DSA_SIGN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:565
   DSA_F_DSA_SIGN_SETUP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:566
   DSA_F_DSA_SIG_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:567
   DSA_F_OLD_DSA_PRIV_DECODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:568
   DSA_F_PKEY_DSA_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:569
   DSA_F_PKEY_DSA_CTRL_STR : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:570
   DSA_F_PKEY_DSA_KEYGEN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:571

   EC_F_BN_TO_FELEM : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:578
   EC_F_D2I_ECPARAMETERS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:579
   EC_F_D2I_ECPKPARAMETERS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:580
   EC_F_D2I_ECPRIVATEKEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:581
   EC_F_DO_EC_KEY_PRINT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:582
   EC_F_ECDH_CMS_DECRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:583
   EC_F_ECDH_CMS_SET_SHARED_INFO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:584
   EC_F_ECDH_COMPUTE_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:585
   EC_F_ECDH_SIMPLE_COMPUTE_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:586
   EC_F_ECDSA_DO_SIGN_EX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:587
   EC_F_ECDSA_DO_VERIFY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:588
   EC_F_ECDSA_SIGN_EX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:589
   EC_F_ECDSA_SIGN_SETUP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:590
   EC_F_ECDSA_SIG_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:591
   EC_F_ECDSA_VERIFY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:592
   EC_F_ECD_ITEM_VERIFY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:593
   EC_F_ECKEY_PARAM2TYPE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:594
   EC_F_ECKEY_PARAM_DECODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:595
   EC_F_ECKEY_PRIV_DECODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:596
   EC_F_ECKEY_PRIV_ENCODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:597
   EC_F_ECKEY_PUB_DECODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:598
   EC_F_ECKEY_PUB_ENCODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:599
   EC_F_ECKEY_TYPE2PARAM : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:600
   EC_F_ECPARAMETERS_PRINT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:601
   EC_F_ECPARAMETERS_PRINT_FP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:602
   EC_F_ECPKPARAMETERS_PRINT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:603
   EC_F_ECPKPARAMETERS_PRINT_FP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:604
   EC_F_ECP_NISTZ256_GET_AFFINE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:605
   EC_F_ECP_NISTZ256_INV_MOD_ORD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:606
   EC_F_ECP_NISTZ256_MULT_PRECOMPUTE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:607
   EC_F_ECP_NISTZ256_POINTS_MUL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:608
   EC_F_ECP_NISTZ256_PRE_COMP_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:609
   EC_F_ECP_NISTZ256_WINDOWED_MUL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:610
   EC_F_ECX_KEY_OP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:611
   EC_F_ECX_PRIV_ENCODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:612
   EC_F_ECX_PUB_ENCODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:613
   EC_F_EC_ASN1_GROUP2CURVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:614
   EC_F_EC_ASN1_GROUP2FIELDID : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:615
   EC_F_EC_GF2M_MONTGOMERY_POINT_MULTIPLY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:616
   EC_F_EC_GF2M_SIMPLE_FIELD_INV : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:617
   EC_F_EC_GF2M_SIMPLE_GROUP_CHECK_DISCRIMINANT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:618
   EC_F_EC_GF2M_SIMPLE_GROUP_SET_CURVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:619
   EC_F_EC_GF2M_SIMPLE_LADDER_POST : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:620
   EC_F_EC_GF2M_SIMPLE_LADDER_PRE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:621
   EC_F_EC_GF2M_SIMPLE_OCT2POINT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:622
   EC_F_EC_GF2M_SIMPLE_POINT2OCT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:623
   EC_F_EC_GF2M_SIMPLE_POINTS_MUL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:624
   EC_F_EC_GF2M_SIMPLE_POINT_GET_AFFINE_COORDINATES : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:625
   EC_F_EC_GF2M_SIMPLE_POINT_SET_AFFINE_COORDINATES : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:626
   EC_F_EC_GF2M_SIMPLE_SET_COMPRESSED_COORDINATES : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:627
   EC_F_EC_GFP_MONT_FIELD_DECODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:628
   EC_F_EC_GFP_MONT_FIELD_ENCODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:629
   EC_F_EC_GFP_MONT_FIELD_INV : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:630
   EC_F_EC_GFP_MONT_FIELD_MUL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:631
   EC_F_EC_GFP_MONT_FIELD_SET_TO_ONE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:632
   EC_F_EC_GFP_MONT_FIELD_SQR : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:633
   EC_F_EC_GFP_MONT_GROUP_SET_CURVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:634
   EC_F_EC_GFP_NISTP224_GROUP_SET_CURVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:635
   EC_F_EC_GFP_NISTP224_POINTS_MUL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:636
   EC_F_EC_GFP_NISTP224_POINT_GET_AFFINE_COORDINATES : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:637
   EC_F_EC_GFP_NISTP256_GROUP_SET_CURVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:638
   EC_F_EC_GFP_NISTP256_POINTS_MUL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:639
   EC_F_EC_GFP_NISTP256_POINT_GET_AFFINE_COORDINATES : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:640
   EC_F_EC_GFP_NISTP521_GROUP_SET_CURVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:641
   EC_F_EC_GFP_NISTP521_POINTS_MUL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:642
   EC_F_EC_GFP_NISTP521_POINT_GET_AFFINE_COORDINATES : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:643
   EC_F_EC_GFP_NIST_FIELD_MUL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:644
   EC_F_EC_GFP_NIST_FIELD_SQR : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:645
   EC_F_EC_GFP_NIST_GROUP_SET_CURVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:646
   EC_F_EC_GFP_SIMPLE_BLIND_COORDINATES : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:647
   EC_F_EC_GFP_SIMPLE_FIELD_INV : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:648
   EC_F_EC_GFP_SIMPLE_GROUP_CHECK_DISCRIMINANT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:649
   EC_F_EC_GFP_SIMPLE_GROUP_SET_CURVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:650
   EC_F_EC_GFP_SIMPLE_MAKE_AFFINE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:651
   EC_F_EC_GFP_SIMPLE_OCT2POINT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:652
   EC_F_EC_GFP_SIMPLE_POINT2OCT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:653
   EC_F_EC_GFP_SIMPLE_POINTS_MAKE_AFFINE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:654
   EC_F_EC_GFP_SIMPLE_POINT_GET_AFFINE_COORDINATES : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:655
   EC_F_EC_GFP_SIMPLE_POINT_SET_AFFINE_COORDINATES : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:656
   EC_F_EC_GFP_SIMPLE_SET_COMPRESSED_COORDINATES : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:657
   EC_F_EC_GROUP_CHECK : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:658
   EC_F_EC_GROUP_CHECK_DISCRIMINANT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:659
   EC_F_EC_GROUP_COPY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:660
   EC_F_EC_GROUP_GET_CURVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:661
   EC_F_EC_GROUP_GET_CURVE_GF2M : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:662
   EC_F_EC_GROUP_GET_CURVE_GFP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:663
   EC_F_EC_GROUP_GET_DEGREE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:664
   EC_F_EC_GROUP_GET_ECPARAMETERS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:665
   EC_F_EC_GROUP_GET_ECPKPARAMETERS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:666
   EC_F_EC_GROUP_GET_PENTANOMIAL_BASIS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:667
   EC_F_EC_GROUP_GET_TRINOMIAL_BASIS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:668
   EC_F_EC_GROUP_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:669
   EC_F_EC_GROUP_NEW_BY_CURVE_NAME : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:670
   EC_F_EC_GROUP_NEW_FROM_DATA : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:671
   EC_F_EC_GROUP_NEW_FROM_ECPARAMETERS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:672
   EC_F_EC_GROUP_NEW_FROM_ECPKPARAMETERS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:673
   EC_F_EC_GROUP_SET_CURVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:674
   EC_F_EC_GROUP_SET_CURVE_GF2M : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:675
   EC_F_EC_GROUP_SET_CURVE_GFP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:676
   EC_F_EC_GROUP_SET_GENERATOR : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:677
   EC_F_EC_GROUP_SET_SEED : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:678
   EC_F_EC_KEY_CHECK_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:679
   EC_F_EC_KEY_COPY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:680
   EC_F_EC_KEY_GENERATE_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:681
   EC_F_EC_KEY_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:682
   EC_F_EC_KEY_NEW_METHOD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:683
   EC_F_EC_KEY_OCT2PRIV : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:684
   EC_F_EC_KEY_PRINT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:685
   EC_F_EC_KEY_PRINT_FP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:686
   EC_F_EC_KEY_PRIV2BUF : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:687
   EC_F_EC_KEY_PRIV2OCT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:688
   EC_F_EC_KEY_SET_PUBLIC_KEY_AFFINE_COORDINATES : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:689
   EC_F_EC_KEY_SIMPLE_CHECK_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:690
   EC_F_EC_KEY_SIMPLE_OCT2PRIV : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:691
   EC_F_EC_KEY_SIMPLE_PRIV2OCT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:692
   EC_F_EC_PKEY_CHECK : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:693
   EC_F_EC_PKEY_PARAM_CHECK : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:694
   EC_F_EC_POINTS_MAKE_AFFINE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:695
   EC_F_EC_POINTS_MUL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:696
   EC_F_EC_POINT_ADD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:697
   EC_F_EC_POINT_BN2POINT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:698
   EC_F_EC_POINT_CMP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:699
   EC_F_EC_POINT_COPY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:700
   EC_F_EC_POINT_DBL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:701
   EC_F_EC_POINT_GET_AFFINE_COORDINATES : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:702
   EC_F_EC_POINT_GET_AFFINE_COORDINATES_GF2M : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:703
   EC_F_EC_POINT_GET_AFFINE_COORDINATES_GFP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:704
   EC_F_EC_POINT_GET_JPROJECTIVE_COORDINATES_GFP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:705
   EC_F_EC_POINT_INVERT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:706
   EC_F_EC_POINT_IS_AT_INFINITY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:707
   EC_F_EC_POINT_IS_ON_CURVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:708
   EC_F_EC_POINT_MAKE_AFFINE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:709
   EC_F_EC_POINT_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:710
   EC_F_EC_POINT_OCT2POINT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:711
   EC_F_EC_POINT_POINT2BUF : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:712
   EC_F_EC_POINT_POINT2OCT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:713
   EC_F_EC_POINT_SET_AFFINE_COORDINATES : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:714
   EC_F_EC_POINT_SET_AFFINE_COORDINATES_GF2M : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:715
   EC_F_EC_POINT_SET_AFFINE_COORDINATES_GFP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:716
   EC_F_EC_POINT_SET_COMPRESSED_COORDINATES : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:717
   EC_F_EC_POINT_SET_COMPRESSED_COORDINATES_GF2M : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:718
   EC_F_EC_POINT_SET_COMPRESSED_COORDINATES_GFP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:719
   EC_F_EC_POINT_SET_JPROJECTIVE_COORDINATES_GFP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:720
   EC_F_EC_POINT_SET_TO_INFINITY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:721
   EC_F_EC_PRE_COMP_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:722
   EC_F_EC_SCALAR_MUL_LADDER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:723
   EC_F_EC_WNAF_MUL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:724
   EC_F_EC_WNAF_PRECOMPUTE_MULT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:725
   EC_F_I2D_ECPARAMETERS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:726
   EC_F_I2D_ECPKPARAMETERS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:727
   EC_F_I2D_ECPRIVATEKEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:728
   EC_F_I2O_ECPUBLICKEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:729
   EC_F_NISTP224_PRE_COMP_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:730
   EC_F_NISTP256_PRE_COMP_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:731
   EC_F_NISTP521_PRE_COMP_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:732
   EC_F_O2I_ECPUBLICKEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:733
   EC_F_OLD_EC_PRIV_DECODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:734
   EC_F_OSSL_ECDH_COMPUTE_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:735
   EC_F_OSSL_ECDSA_SIGN_SIG : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:736
   EC_F_OSSL_ECDSA_VERIFY_SIG : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:737
   EC_F_PKEY_ECD_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:738
   EC_F_PKEY_ECD_DIGESTSIGN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:739
   EC_F_PKEY_ECD_DIGESTSIGN25519 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:740
   EC_F_PKEY_ECD_DIGESTSIGN448 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:741
   EC_F_PKEY_ECX_DERIVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:742
   EC_F_PKEY_EC_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:743
   EC_F_PKEY_EC_CTRL_STR : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:744
   EC_F_PKEY_EC_DERIVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:745
   EC_F_PKEY_EC_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:746
   EC_F_PKEY_EC_KDF_DERIVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:747
   EC_F_PKEY_EC_KEYGEN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:748
   EC_F_PKEY_EC_PARAMGEN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:749
   EC_F_PKEY_EC_SIGN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:750
   EC_F_VALIDATE_ECX_DERIVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:751

   ENGINE_F_DIGEST_UPDATE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:758
   ENGINE_F_DYNAMIC_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:759
   ENGINE_F_DYNAMIC_GET_DATA_CTX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:760
   ENGINE_F_DYNAMIC_LOAD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:761
   ENGINE_F_DYNAMIC_SET_DATA_CTX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:762
   ENGINE_F_ENGINE_ADD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:763
   ENGINE_F_ENGINE_BY_ID : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:764
   ENGINE_F_ENGINE_CMD_IS_EXECUTABLE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:765
   ENGINE_F_ENGINE_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:766
   ENGINE_F_ENGINE_CTRL_CMD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:767
   ENGINE_F_ENGINE_CTRL_CMD_STRING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:768
   ENGINE_F_ENGINE_FINISH : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:769
   ENGINE_F_ENGINE_GET_CIPHER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:770
   ENGINE_F_ENGINE_GET_DIGEST : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:771
   ENGINE_F_ENGINE_GET_FIRST : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:772
   ENGINE_F_ENGINE_GET_LAST : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:773
   ENGINE_F_ENGINE_GET_NEXT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:774
   ENGINE_F_ENGINE_GET_PKEY_ASN1_METH : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:775
   ENGINE_F_ENGINE_GET_PKEY_METH : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:776
   ENGINE_F_ENGINE_GET_PREV : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:777
   ENGINE_F_ENGINE_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:778
   ENGINE_F_ENGINE_LIST_ADD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:779
   ENGINE_F_ENGINE_LIST_REMOVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:780
   ENGINE_F_ENGINE_LOAD_PRIVATE_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:781
   ENGINE_F_ENGINE_LOAD_PUBLIC_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:782
   ENGINE_F_ENGINE_LOAD_SSL_CLIENT_CERT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:783
   ENGINE_F_ENGINE_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:784
   ENGINE_F_ENGINE_PKEY_ASN1_FIND_STR : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:785
   ENGINE_F_ENGINE_REMOVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:786
   ENGINE_F_ENGINE_SET_DEFAULT_STRING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:787
   ENGINE_F_ENGINE_SET_ID : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:788
   ENGINE_F_ENGINE_SET_NAME : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:789
   ENGINE_F_ENGINE_TABLE_REGISTER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:790
   ENGINE_F_ENGINE_UNLOCKED_FINISH : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:791
   ENGINE_F_ENGINE_UP_REF : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:792
   ENGINE_F_INT_CLEANUP_ITEM : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:793
   ENGINE_F_INT_CTRL_HELPER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:794
   ENGINE_F_INT_ENGINE_CONFIGURE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:795
   ENGINE_F_INT_ENGINE_MODULE_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:796
   ENGINE_F_OSSL_HMAC_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:797

   EVP_F_AESNI_INIT_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:803
   EVP_F_AESNI_XTS_INIT_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:804
   EVP_F_AES_GCM_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:805
   EVP_F_AES_INIT_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:806
   EVP_F_AES_OCB_CIPHER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:807
   EVP_F_AES_T4_INIT_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:808
   EVP_F_AES_T4_XTS_INIT_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:809
   EVP_F_AES_WRAP_CIPHER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:810
   EVP_F_AES_XTS_INIT_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:811
   EVP_F_ALG_MODULE_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:812
   EVP_F_ARIA_CCM_INIT_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:813
   EVP_F_ARIA_GCM_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:814
   EVP_F_ARIA_GCM_INIT_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:815
   EVP_F_ARIA_INIT_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:816
   EVP_F_B64_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:817
   EVP_F_CAMELLIA_INIT_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:818
   EVP_F_CHACHA20_POLY1305_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:819
   EVP_F_CMLL_T4_INIT_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:820
   EVP_F_DES_EDE3_WRAP_CIPHER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:821
   EVP_F_DO_SIGVER_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:822
   EVP_F_ENC_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:823
   EVP_F_EVP_CIPHERINIT_EX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:824
   EVP_F_EVP_CIPHER_ASN1_TO_PARAM : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:825
   EVP_F_EVP_CIPHER_CTX_COPY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:826
   EVP_F_EVP_CIPHER_CTX_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:827
   EVP_F_EVP_CIPHER_CTX_SET_KEY_LENGTH : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:828
   EVP_F_EVP_CIPHER_PARAM_TO_ASN1 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:829
   EVP_F_EVP_DECRYPTFINAL_EX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:830
   EVP_F_EVP_DECRYPTUPDATE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:831
   EVP_F_EVP_DIGESTFINALXOF : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:832
   EVP_F_EVP_DIGESTINIT_EX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:833
   EVP_F_EVP_ENCRYPTDECRYPTUPDATE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:834
   EVP_F_EVP_ENCRYPTFINAL_EX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:835
   EVP_F_EVP_ENCRYPTUPDATE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:836
   EVP_F_EVP_MD_CTX_COPY_EX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:837
   EVP_F_EVP_MD_SIZE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:838
   EVP_F_EVP_OPENINIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:839
   EVP_F_EVP_PBE_ALG_ADD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:840
   EVP_F_EVP_PBE_ALG_ADD_TYPE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:841
   EVP_F_EVP_PBE_CIPHERINIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:842
   EVP_F_EVP_PBE_SCRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:843
   EVP_F_EVP_PKCS82PKEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:844
   EVP_F_EVP_PKEY2PKCS8 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:845
   EVP_F_EVP_PKEY_ASN1_ADD0 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:846
   EVP_F_EVP_PKEY_CHECK : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:847
   EVP_F_EVP_PKEY_COPY_PARAMETERS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:848
   EVP_F_EVP_PKEY_CTX_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:849
   EVP_F_EVP_PKEY_CTX_CTRL_STR : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:850
   EVP_F_EVP_PKEY_CTX_DUP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:851
   EVP_F_EVP_PKEY_CTX_MD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:852
   EVP_F_EVP_PKEY_DECRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:853
   EVP_F_EVP_PKEY_DECRYPT_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:854
   EVP_F_EVP_PKEY_DECRYPT_OLD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:855
   EVP_F_EVP_PKEY_DERIVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:856
   EVP_F_EVP_PKEY_DERIVE_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:857
   EVP_F_EVP_PKEY_DERIVE_SET_PEER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:858
   EVP_F_EVP_PKEY_ENCRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:859
   EVP_F_EVP_PKEY_ENCRYPT_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:860
   EVP_F_EVP_PKEY_ENCRYPT_OLD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:861
   EVP_F_EVP_PKEY_GET0_DH : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:862
   EVP_F_EVP_PKEY_GET0_DSA : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:863
   EVP_F_EVP_PKEY_GET0_EC_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:864
   EVP_F_EVP_PKEY_GET0_HMAC : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:865
   EVP_F_EVP_PKEY_GET0_POLY1305 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:866
   EVP_F_EVP_PKEY_GET0_RSA : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:867
   EVP_F_EVP_PKEY_GET0_SIPHASH : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:868
   EVP_F_EVP_PKEY_GET_RAW_PRIVATE_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:869
   EVP_F_EVP_PKEY_GET_RAW_PUBLIC_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:870
   EVP_F_EVP_PKEY_KEYGEN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:871
   EVP_F_EVP_PKEY_KEYGEN_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:872
   EVP_F_EVP_PKEY_METH_ADD0 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:873
   EVP_F_EVP_PKEY_METH_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:874
   EVP_F_EVP_PKEY_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:875
   EVP_F_EVP_PKEY_NEW_CMAC_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:876
   EVP_F_EVP_PKEY_NEW_RAW_PRIVATE_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:877
   EVP_F_EVP_PKEY_NEW_RAW_PUBLIC_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:878
   EVP_F_EVP_PKEY_PARAMGEN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:879
   EVP_F_EVP_PKEY_PARAMGEN_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:880
   EVP_F_EVP_PKEY_PARAM_CHECK : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:881
   EVP_F_EVP_PKEY_PUBLIC_CHECK : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:882
   EVP_F_EVP_PKEY_SET1_ENGINE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:883
   EVP_F_EVP_PKEY_SET_ALIAS_TYPE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:884
   EVP_F_EVP_PKEY_SIGN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:885
   EVP_F_EVP_PKEY_SIGN_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:886
   EVP_F_EVP_PKEY_VERIFY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:887
   EVP_F_EVP_PKEY_VERIFY_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:888
   EVP_F_EVP_PKEY_VERIFY_RECOVER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:889
   EVP_F_EVP_PKEY_VERIFY_RECOVER_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:890
   EVP_F_EVP_SIGNFINAL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:891
   EVP_F_EVP_VERIFYFINAL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:892
   EVP_F_INT_CTX_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:893
   EVP_F_OK_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:894
   EVP_F_PKCS5_PBE_KEYIVGEN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:895
   EVP_F_PKCS5_V2_PBE_KEYIVGEN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:896
   EVP_F_PKCS5_V2_PBKDF2_KEYIVGEN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:897
   EVP_F_PKCS5_V2_SCRYPT_KEYIVGEN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:898
   EVP_F_PKEY_SET_TYPE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:899
   EVP_F_RC2_MAGIC_TO_METH : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:900
   EVP_F_RC5_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:901
   EVP_F_R_32_12_16_INIT_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:902
   EVP_F_S390X_AES_GCM_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:903
   EVP_F_UPDATE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:904

   KDF_F_PKEY_HKDF_CTRL_STR : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:909
   KDF_F_PKEY_HKDF_DERIVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:910
   KDF_F_PKEY_HKDF_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:911
   KDF_F_PKEY_SCRYPT_CTRL_STR : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:912
   KDF_F_PKEY_SCRYPT_CTRL_UINT64 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:913
   KDF_F_PKEY_SCRYPT_DERIVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:914
   KDF_F_PKEY_SCRYPT_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:915
   KDF_F_PKEY_SCRYPT_SET_MEMBUF : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:916
   KDF_F_PKEY_TLS1_PRF_CTRL_STR : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:917
   KDF_F_PKEY_TLS1_PRF_DERIVE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:918
   KDF_F_PKEY_TLS1_PRF_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:919
   KDF_F_TLS1_PRF_ALG : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:920

   KDF_R_INVALID_DIGEST : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:925
   KDF_R_MISSING_ITERATION_COUNT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:926
   KDF_R_MISSING_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:927
   KDF_R_MISSING_MESSAGE_DIGEST : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:928
   KDF_R_MISSING_PARAMETER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:929
   KDF_R_MISSING_PASS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:930
   KDF_R_MISSING_SALT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:931
   KDF_R_MISSING_SECRET : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:932
   KDF_R_MISSING_SEED : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:933
   KDF_R_UNKNOWN_PARAMETER_TYPE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:934
   KDF_R_VALUE_ERROR : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:935
   KDF_R_VALUE_MISSING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:936

   OBJ_F_OBJ_ADD_OBJECT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:941
   OBJ_F_OBJ_ADD_SIGID : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:942
   OBJ_F_OBJ_CREATE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:943
   OBJ_F_OBJ_DUP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:944
   OBJ_F_OBJ_NAME_NEW_INDEX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:945
   OBJ_F_OBJ_NID2LN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:946
   OBJ_F_OBJ_NID2OBJ : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:947
   OBJ_F_OBJ_NID2SN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:948
   OBJ_F_OBJ_TXT2OBJ : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:949

   OCSP_F_D2I_OCSP_NONCE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:955
   OCSP_F_OCSP_BASIC_ADD1_STATUS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:956
   OCSP_F_OCSP_BASIC_SIGN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:957
   OCSP_F_OCSP_BASIC_SIGN_CTX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:958
   OCSP_F_OCSP_BASIC_VERIFY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:959
   OCSP_F_OCSP_CERT_ID_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:960
   OCSP_F_OCSP_CHECK_DELEGATED : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:961
   OCSP_F_OCSP_CHECK_IDS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:962
   OCSP_F_OCSP_CHECK_ISSUER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:963
   OCSP_F_OCSP_CHECK_VALIDITY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:964
   OCSP_F_OCSP_MATCH_ISSUERID : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:965
   OCSP_F_OCSP_PARSE_URL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:966
   OCSP_F_OCSP_REQUEST_SIGN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:967
   OCSP_F_OCSP_REQUEST_VERIFY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:968
   OCSP_F_OCSP_RESPONSE_GET1_BASIC : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:969
   OCSP_F_PARSE_HTTP_LINE1 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:970

   PEM_F_B2I_DSS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:976
   PEM_F_B2I_PVK_BIO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:977
   PEM_F_B2I_RSA : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:978
   PEM_F_CHECK_BITLEN_DSA : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:979
   PEM_F_CHECK_BITLEN_RSA : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:980
   PEM_F_D2I_PKCS8PRIVATEKEY_BIO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:981
   PEM_F_D2I_PKCS8PRIVATEKEY_FP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:982
   PEM_F_DO_B2I : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:983
   PEM_F_DO_B2I_BIO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:984
   PEM_F_DO_BLOB_HEADER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:985
   PEM_F_DO_I2B : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:986
   PEM_F_DO_PK8PKEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:987
   PEM_F_DO_PK8PKEY_FP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:988
   PEM_F_DO_PVK_BODY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:989
   PEM_F_DO_PVK_HEADER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:990
   PEM_F_GET_HEADER_AND_DATA : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:991
   PEM_F_GET_NAME : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:992
   PEM_F_I2B_PVK : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:993
   PEM_F_I2B_PVK_BIO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:994
   PEM_F_LOAD_IV : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:995
   PEM_F_PEM_ASN1_READ : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:996
   PEM_F_PEM_ASN1_READ_BIO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:997
   PEM_F_PEM_ASN1_WRITE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:998
   PEM_F_PEM_ASN1_WRITE_BIO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:999
   PEM_F_PEM_DEF_CALLBACK : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1000
   PEM_F_PEM_DO_HEADER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1001
   PEM_F_PEM_GET_EVP_CIPHER_INFO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1002
   PEM_F_PEM_READ : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1003
   PEM_F_PEM_READ_BIO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1004
   PEM_F_PEM_READ_BIO_DHPARAMS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1005
   PEM_F_PEM_READ_BIO_EX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1006
   PEM_F_PEM_READ_BIO_PARAMETERS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1007
   PEM_F_PEM_READ_BIO_PRIVATEKEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1008
   PEM_F_PEM_READ_DHPARAMS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1009
   PEM_F_PEM_READ_PRIVATEKEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1010
   PEM_F_PEM_SIGNFINAL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1011
   PEM_F_PEM_WRITE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1012
   PEM_F_PEM_WRITE_BIO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1013
   PEM_F_PEM_WRITE_BIO_PRIVATEKEY_TRADITIONAL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1014
   PEM_F_PEM_WRITE_PRIVATEKEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1015
   PEM_F_PEM_X509_INFO_READ : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1016
   PEM_F_PEM_X509_INFO_READ_BIO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1017
   PEM_F_PEM_X509_INFO_WRITE_BIO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1018

   PKCS12_F_OPENSSL_ASC2UNI : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1023
   PKCS12_F_OPENSSL_UNI2ASC : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1024
   PKCS12_F_OPENSSL_UNI2UTF8 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1025
   PKCS12_F_OPENSSL_UTF82UNI : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1026
   PKCS12_F_PKCS12_CREATE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1027
   PKCS12_F_PKCS12_GEN_MAC : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1028
   PKCS12_F_PKCS12_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1029
   PKCS12_F_PKCS12_ITEM_DECRYPT_D2I : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1030
   PKCS12_F_PKCS12_ITEM_I2D_ENCRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1031
   PKCS12_F_PKCS12_ITEM_PACK_SAFEBAG : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1032
   PKCS12_F_PKCS12_KEY_GEN_ASC : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1033
   PKCS12_F_PKCS12_KEY_GEN_UNI : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1034
   PKCS12_F_PKCS12_KEY_GEN_UTF8 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1035
   PKCS12_F_PKCS12_NEWPASS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1036
   PKCS12_F_PKCS12_PACK_P7DATA : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1037
   PKCS12_F_PKCS12_PACK_P7ENCDATA : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1038
   PKCS12_F_PKCS12_PARSE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1039
   PKCS12_F_PKCS12_PBE_CRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1040
   PKCS12_F_PKCS12_PBE_KEYIVGEN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1041
   PKCS12_F_PKCS12_SAFEBAG_CREATE0_P8INF : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1042
   PKCS12_F_PKCS12_SAFEBAG_CREATE0_PKCS8 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1043
   PKCS12_F_PKCS12_SAFEBAG_CREATE_PKCS8_ENCRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1044
   PKCS12_F_PKCS12_SETUP_MAC : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1045
   PKCS12_F_PKCS12_SET_MAC : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1046
   PKCS12_F_PKCS12_UNPACK_AUTHSAFES : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1047
   PKCS12_F_PKCS12_UNPACK_P7DATA : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1048
   PKCS12_F_PKCS12_VERIFY_MAC : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1049
   PKCS12_F_PKCS8_ENCRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1050
   PKCS12_F_PKCS8_SET0_PBE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1051

   PKCS7_F_DO_PKCS7_SIGNED_ATTRIB : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1056
   PKCS7_F_PKCS7_ADD0_ATTRIB_SIGNING_TIME : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1057
   PKCS7_F_PKCS7_ADD_ATTRIB_SMIMECAP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1058
   PKCS7_F_PKCS7_ADD_CERTIFICATE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1059
   PKCS7_F_PKCS7_ADD_CRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1060
   PKCS7_F_PKCS7_ADD_RECIPIENT_INFO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1061
   PKCS7_F_PKCS7_ADD_SIGNATURE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1062
   PKCS7_F_PKCS7_ADD_SIGNER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1063
   PKCS7_F_PKCS7_BIO_ADD_DIGEST : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1064
   PKCS7_F_PKCS7_COPY_EXISTING_DIGEST : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1065
   PKCS7_F_PKCS7_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1066
   PKCS7_F_PKCS7_DATADECODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1067
   PKCS7_F_PKCS7_DATAFINAL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1068
   PKCS7_F_PKCS7_DATAINIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1069
   PKCS7_F_PKCS7_DATAVERIFY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1070
   PKCS7_F_PKCS7_DECRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1071
   PKCS7_F_PKCS7_DECRYPT_RINFO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1072
   PKCS7_F_PKCS7_ENCODE_RINFO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1073
   PKCS7_F_PKCS7_ENCRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1074
   PKCS7_F_PKCS7_FINAL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1075
   PKCS7_F_PKCS7_FIND_DIGEST : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1076
   PKCS7_F_PKCS7_GET0_SIGNERS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1077
   PKCS7_F_PKCS7_RECIP_INFO_SET : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1078
   PKCS7_F_PKCS7_SET_CIPHER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1079
   PKCS7_F_PKCS7_SET_CONTENT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1080
   PKCS7_F_PKCS7_SET_DIGEST : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1081
   PKCS7_F_PKCS7_SET_TYPE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1082
   PKCS7_F_PKCS7_SIGN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1083
   PKCS7_F_PKCS7_SIGNATUREVERIFY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1084
   PKCS7_F_PKCS7_SIGNER_INFO_SET : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1085
   PKCS7_F_PKCS7_SIGNER_INFO_SIGN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1086
   PKCS7_F_PKCS7_SIGN_ADD_SIGNER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1087
   PKCS7_F_PKCS7_SIMPLE_SMIMECAP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1088
   PKCS7_F_PKCS7_VERIFY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1089

   RAND_F_DATA_COLLECT_METHOD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1094
   RAND_F_DRBG_BYTES : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1095
   RAND_F_DRBG_GET_ENTROPY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1096
   RAND_F_DRBG_SETUP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1097
   RAND_F_GET_ENTROPY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1098
   RAND_F_RAND_BYTES : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1099
   RAND_F_RAND_DRBG_ENABLE_LOCKING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1100
   RAND_F_RAND_DRBG_GENERATE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1101
   RAND_F_RAND_DRBG_GET_ENTROPY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1102
   RAND_F_RAND_DRBG_GET_NONCE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1103
   RAND_F_RAND_DRBG_INSTANTIATE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1104
   RAND_F_RAND_DRBG_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1105
   RAND_F_RAND_DRBG_RESEED : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1106
   RAND_F_RAND_DRBG_RESTART : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1107
   RAND_F_RAND_DRBG_SET : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1108
   RAND_F_RAND_DRBG_SET_DEFAULTS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1109
   RAND_F_RAND_DRBG_UNINSTANTIATE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1110
   RAND_F_RAND_LOAD_FILE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1111
   RAND_F_RAND_POOL_ACQUIRE_ENTROPY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1112
   RAND_F_RAND_POOL_ADD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1113
   RAND_F_RAND_POOL_ADD_BEGIN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1114
   RAND_F_RAND_POOL_ADD_END : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1115
   RAND_F_RAND_POOL_ATTACH : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1116
   RAND_F_RAND_POOL_BYTES_NEEDED : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1117
   RAND_F_RAND_POOL_GROW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1118
   RAND_F_RAND_POOL_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1119
   RAND_F_RAND_PSEUDO_BYTES : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1120
   RAND_F_RAND_WRITE_FILE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1121

   RSA_F_CHECK_PADDING_MD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1126
   RSA_F_ENCODE_PKCS1 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1127
   RSA_F_INT_RSA_VERIFY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1128
   RSA_F_OLD_RSA_PRIV_DECODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1129
   RSA_F_PKEY_PSS_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1130
   RSA_F_PKEY_RSA_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1131
   RSA_F_PKEY_RSA_CTRL_STR : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1132
   RSA_F_PKEY_RSA_SIGN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1133
   RSA_F_PKEY_RSA_VERIFY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1134
   RSA_F_PKEY_RSA_VERIFYRECOVER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1135
   RSA_F_RSA_ALGOR_TO_MD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1136
   RSA_F_RSA_BUILTIN_KEYGEN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1137
   RSA_F_RSA_CHECK_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1138
   RSA_F_RSA_CHECK_KEY_EX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1139
   RSA_F_RSA_CMS_DECRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1140
   RSA_F_RSA_CMS_VERIFY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1141
   RSA_F_RSA_ITEM_VERIFY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1142
   RSA_F_RSA_METH_DUP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1143
   RSA_F_RSA_METH_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1144
   RSA_F_RSA_METH_SET1_NAME : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1145
   RSA_F_RSA_MGF1_TO_MD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1146
   RSA_F_RSA_MULTIP_INFO_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1147
   RSA_F_RSA_NEW_METHOD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1148
   RSA_F_RSA_NULL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1149
   RSA_F_RSA_NULL_PRIVATE_DECRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1150
   RSA_F_RSA_NULL_PRIVATE_ENCRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1151
   RSA_F_RSA_NULL_PUBLIC_DECRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1152
   RSA_F_RSA_NULL_PUBLIC_ENCRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1153
   RSA_F_RSA_OSSL_PRIVATE_DECRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1154
   RSA_F_RSA_OSSL_PRIVATE_ENCRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1155
   RSA_F_RSA_OSSL_PUBLIC_DECRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1156
   RSA_F_RSA_OSSL_PUBLIC_ENCRYPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1157
   RSA_F_RSA_PADDING_ADD_NONE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1158
   RSA_F_RSA_PADDING_ADD_PKCS1_OAEP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1159
   RSA_F_RSA_PADDING_ADD_PKCS1_OAEP_MGF1 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1160
   RSA_F_RSA_PADDING_ADD_PKCS1_PSS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1161
   RSA_F_RSA_PADDING_ADD_PKCS1_PSS_MGF1 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1162
   RSA_F_RSA_PADDING_ADD_PKCS1_TYPE_1 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1163
   RSA_F_RSA_PADDING_ADD_PKCS1_TYPE_2 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1164
   RSA_F_RSA_PADDING_ADD_SSLV23 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1165
   RSA_F_RSA_PADDING_ADD_X931 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1166
   RSA_F_RSA_PADDING_CHECK_NONE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1167
   RSA_F_RSA_PADDING_CHECK_PKCS1_OAEP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1168
   RSA_F_RSA_PADDING_CHECK_PKCS1_OAEP_MGF1 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1169
   RSA_F_RSA_PADDING_CHECK_PKCS1_TYPE_1 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1170
   RSA_F_RSA_PADDING_CHECK_PKCS1_TYPE_2 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1171
   RSA_F_RSA_PADDING_CHECK_SSLV23 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1172
   RSA_F_RSA_PADDING_CHECK_X931 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1173
   RSA_F_RSA_PARAM_DECODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1174
   RSA_F_RSA_PRINT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1175
   RSA_F_RSA_PRINT_FP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1176
   RSA_F_RSA_PRIV_DECODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1177
   RSA_F_RSA_PRIV_ENCODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1178
   RSA_F_RSA_PSS_GET_PARAM : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1179
   RSA_F_RSA_PSS_TO_CTX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1180
   RSA_F_RSA_PUB_DECODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1181
   RSA_F_RSA_SETUP_BLINDING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1182
   RSA_F_RSA_SIGN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1183
   RSA_F_RSA_SIGN_ASN1_OCTET_STRING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1184
   RSA_F_RSA_VERIFY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1185
   RSA_F_RSA_VERIFY_ASN1_OCTET_STRING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1186
   RSA_F_RSA_VERIFY_PKCS1_PSS_MGF1 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1187
   RSA_F_SETUP_TBUF : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1188

   OSSL_STORE_F_FILE_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1193
   OSSL_STORE_F_FILE_FIND : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1194
   OSSL_STORE_F_FILE_GET_PASS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1195
   OSSL_STORE_F_FILE_LOAD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1196
   OSSL_STORE_F_FILE_LOAD_TRY_DECODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1197
   OSSL_STORE_F_FILE_NAME_TO_URI : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1198
   OSSL_STORE_F_FILE_OPEN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1199
   OSSL_STORE_F_OSSL_STORE_ATTACH_PEM_BIO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1200
   OSSL_STORE_F_OSSL_STORE_EXPECT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1201
   OSSL_STORE_F_OSSL_STORE_FILE_ATTACH_PEM_BIO_INT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1202
   OSSL_STORE_F_OSSL_STORE_FIND : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1203
   OSSL_STORE_F_OSSL_STORE_GET0_LOADER_INT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1204
   OSSL_STORE_F_OSSL_STORE_INFO_GET1_CERT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1205
   OSSL_STORE_F_OSSL_STORE_INFO_GET1_CRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1206
   OSSL_STORE_F_OSSL_STORE_INFO_GET1_NAME : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1207
   OSSL_STORE_F_OSSL_STORE_INFO_GET1_NAME_DESCRIPTION : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1208
   OSSL_STORE_F_OSSL_STORE_INFO_GET1_PARAMS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1209
   OSSL_STORE_F_OSSL_STORE_INFO_GET1_PKEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1210
   OSSL_STORE_F_OSSL_STORE_INFO_NEW_CERT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1211
   OSSL_STORE_F_OSSL_STORE_INFO_NEW_CRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1212
   OSSL_STORE_F_OSSL_STORE_INFO_NEW_EMBEDDED : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1213
   OSSL_STORE_F_OSSL_STORE_INFO_NEW_NAME : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1214
   OSSL_STORE_F_OSSL_STORE_INFO_NEW_PARAMS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1215
   OSSL_STORE_F_OSSL_STORE_INFO_NEW_PKEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1216
   OSSL_STORE_F_OSSL_STORE_INFO_SET0_NAME_DESCRIPTION : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1217
   OSSL_STORE_F_OSSL_STORE_INIT_ONCE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1218
   OSSL_STORE_F_OSSL_STORE_LOADER_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1219
   OSSL_STORE_F_OSSL_STORE_OPEN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1220
   OSSL_STORE_F_OSSL_STORE_OPEN_INT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1221
   OSSL_STORE_F_OSSL_STORE_REGISTER_LOADER_INT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1222
   OSSL_STORE_F_OSSL_STORE_SEARCH_BY_ALIAS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1223
   OSSL_STORE_F_OSSL_STORE_SEARCH_BY_ISSUER_SERIAL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1224
   OSSL_STORE_F_OSSL_STORE_SEARCH_BY_KEY_FINGERPRINT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1225
   OSSL_STORE_F_OSSL_STORE_SEARCH_BY_NAME : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1226
   OSSL_STORE_F_OSSL_STORE_UNREGISTER_LOADER_INT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1227
   OSSL_STORE_F_TRY_DECODE_PARAMS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1228
   OSSL_STORE_F_TRY_DECODE_PKCS12 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1229
   OSSL_STORE_F_TRY_DECODE_PKCS8ENCRYPTED : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1230

   TS_F_DEF_SERIAL_CB : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1236
   TS_F_DEF_TIME_CB : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1237
   TS_F_ESS_ADD_SIGNING_CERT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1238
   TS_F_ESS_ADD_SIGNING_CERT_V2 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1239
   TS_F_ESS_CERT_ID_NEW_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1240
   TS_F_ESS_CERT_ID_V2_NEW_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1241
   TS_F_ESS_SIGNING_CERT_NEW_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1242
   TS_F_ESS_SIGNING_CERT_V2_NEW_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1243
   TS_F_INT_TS_RESP_VERIFY_TOKEN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1244
   TS_F_PKCS7_TO_TS_TST_INFO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1245
   TS_F_TS_ACCURACY_SET_MICROS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1246
   TS_F_TS_ACCURACY_SET_MILLIS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1247
   TS_F_TS_ACCURACY_SET_SECONDS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1248
   TS_F_TS_CHECK_IMPRINTS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1249
   TS_F_TS_CHECK_NONCES : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1250
   TS_F_TS_CHECK_POLICY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1251
   TS_F_TS_CHECK_SIGNING_CERTS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1252
   TS_F_TS_CHECK_STATUS_INFO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1253
   TS_F_TS_COMPUTE_IMPRINT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1254
   TS_F_TS_CONF_INVALID : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1255
   TS_F_TS_CONF_LOAD_CERT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1256
   TS_F_TS_CONF_LOAD_CERTS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1257
   TS_F_TS_CONF_LOAD_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1258
   TS_F_TS_CONF_LOOKUP_FAIL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1259
   TS_F_TS_CONF_SET_DEFAULT_ENGINE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1260
   TS_F_TS_GET_STATUS_TEXT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1261
   TS_F_TS_MSG_IMPRINT_SET_ALGO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1262
   TS_F_TS_REQ_SET_MSG_IMPRINT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1263
   TS_F_TS_REQ_SET_NONCE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1264
   TS_F_TS_REQ_SET_POLICY_ID : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1265
   TS_F_TS_RESP_CREATE_RESPONSE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1266
   TS_F_TS_RESP_CREATE_TST_INFO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1267
   TS_F_TS_RESP_CTX_ADD_FAILURE_INFO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1268
   TS_F_TS_RESP_CTX_ADD_MD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1269
   TS_F_TS_RESP_CTX_ADD_POLICY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1270
   TS_F_TS_RESP_CTX_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1271
   TS_F_TS_RESP_CTX_SET_ACCURACY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1272
   TS_F_TS_RESP_CTX_SET_CERTS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1273
   TS_F_TS_RESP_CTX_SET_DEF_POLICY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1274
   TS_F_TS_RESP_CTX_SET_SIGNER_CERT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1275
   TS_F_TS_RESP_CTX_SET_STATUS_INFO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1276
   TS_F_TS_RESP_GET_POLICY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1277
   TS_F_TS_RESP_SET_GENTIME_WITH_PRECISION : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1278
   TS_F_TS_RESP_SET_STATUS_INFO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1279
   TS_F_TS_RESP_SET_TST_INFO : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1280
   TS_F_TS_RESP_SIGN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1281
   TS_F_TS_RESP_VERIFY_SIGNATURE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1282
   TS_F_TS_TST_INFO_SET_ACCURACY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1283
   TS_F_TS_TST_INFO_SET_MSG_IMPRINT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1284
   TS_F_TS_TST_INFO_SET_NONCE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1285
   TS_F_TS_TST_INFO_SET_POLICY_ID : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1286
   TS_F_TS_TST_INFO_SET_SERIAL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1287
   TS_F_TS_TST_INFO_SET_TIME : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1288
   TS_F_TS_TST_INFO_SET_TSA : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1289
   TS_F_TS_VERIFY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1290
   TS_F_TS_VERIFY_CERT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1291
   TS_F_TS_VERIFY_CTX_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1292

   UI_F_CLOSE_CONSOLE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1298
   UI_F_ECHO_CONSOLE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1299
   UI_F_GENERAL_ALLOCATE_BOOLEAN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1300
   UI_F_GENERAL_ALLOCATE_PROMPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1301
   UI_F_NOECHO_CONSOLE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1302
   UI_F_OPEN_CONSOLE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1303
   UI_F_UI_CONSTRUCT_PROMPT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1304
   UI_F_UI_CREATE_METHOD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1305
   UI_F_UI_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1306
   UI_F_UI_DUP_ERROR_STRING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1307
   UI_F_UI_DUP_INFO_STRING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1308
   UI_F_UI_DUP_INPUT_BOOLEAN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1309
   UI_F_UI_DUP_INPUT_STRING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1310
   UI_F_UI_DUP_USER_DATA : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1311
   UI_F_UI_DUP_VERIFY_STRING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1312
   UI_F_UI_GET0_RESULT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1313
   UI_F_UI_GET_RESULT_LENGTH : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1314
   UI_F_UI_NEW_METHOD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1315
   UI_F_UI_PROCESS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1316
   UI_F_UI_SET_RESULT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1317
   UI_F_UI_SET_RESULT_EX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1318

   X509_F_ADD_CERT_DIR : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1323
   X509_F_BUILD_CHAIN : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1324
   X509_F_BY_FILE_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1325
   X509_F_CHECK_NAME_CONSTRAINTS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1326
   X509_F_CHECK_POLICY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1327
   X509_F_DANE_I2D : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1328
   X509_F_DIR_CTRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1329
   X509_F_GET_CERT_BY_SUBJECT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1330
   X509_F_I2D_X509_AUX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1331
   X509_F_LOOKUP_CERTS_SK : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1332
   X509_F_NETSCAPE_SPKI_B64_DECODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1333
   X509_F_NETSCAPE_SPKI_B64_ENCODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1334
   X509_F_NEW_DIR : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1335
   X509_F_X509AT_ADD1_ATTR : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1336
   X509_F_X509V3_ADD_EXT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1337
   X509_F_X509_ATTRIBUTE_CREATE_BY_NID : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1338
   X509_F_X509_ATTRIBUTE_CREATE_BY_OBJ : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1339
   X509_F_X509_ATTRIBUTE_CREATE_BY_TXT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1340
   X509_F_X509_ATTRIBUTE_GET0_DATA : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1341
   X509_F_X509_ATTRIBUTE_SET1_DATA : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1342
   X509_F_X509_CHECK_PRIVATE_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1343
   X509_F_X509_CRL_DIFF : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1344
   X509_F_X509_CRL_METHOD_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1345
   X509_F_X509_CRL_PRINT_FP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1346
   X509_F_X509_EXTENSION_CREATE_BY_NID : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1347
   X509_F_X509_EXTENSION_CREATE_BY_OBJ : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1348
   X509_F_X509_GET_PUBKEY_PARAMETERS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1349
   X509_F_X509_LOAD_CERT_CRL_FILE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1350
   X509_F_X509_LOAD_CERT_FILE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1351
   X509_F_X509_LOAD_CRL_FILE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1352
   X509_F_X509_LOOKUP_METH_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1353
   X509_F_X509_LOOKUP_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1354
   X509_F_X509_NAME_ADD_ENTRY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1355
   X509_F_X509_NAME_CANON : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1356
   X509_F_X509_NAME_ENTRY_CREATE_BY_NID : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1357
   X509_F_X509_NAME_ENTRY_CREATE_BY_TXT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1358
   X509_F_X509_NAME_ENTRY_SET_OBJECT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1359
   X509_F_X509_NAME_ONELINE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1360
   X509_F_X509_NAME_PRINT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1361
   X509_F_X509_OBJECT_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1362
   X509_F_X509_PRINT_EX_FP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1363
   X509_F_X509_PUBKEY_DECODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1364
   X509_F_X509_PUBKEY_GET : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1365
   X509_F_X509_PUBKEY_GET0 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1366
   X509_F_X509_PUBKEY_SET : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1367
   X509_F_X509_REQ_CHECK_PRIVATE_KEY : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1368
   X509_F_X509_REQ_PRINT_EX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1369
   X509_F_X509_REQ_PRINT_FP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1370
   X509_F_X509_REQ_TO_X509 : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1371
   X509_F_X509_STORE_ADD_CERT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1372
   X509_F_X509_STORE_ADD_CRL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1373
   X509_F_X509_STORE_ADD_LOOKUP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1374
   X509_F_X509_STORE_CTX_GET1_ISSUER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1375
   X509_F_X509_STORE_CTX_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1376
   X509_F_X509_STORE_CTX_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1377
   X509_F_X509_STORE_CTX_PURPOSE_INHERIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1378
   X509_F_X509_STORE_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1379
   X509_F_X509_TO_X509_REQ : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1380
   X509_F_X509_TRUST_ADD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1381
   X509_F_X509_TRUST_SET : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1382
   X509_F_X509_VERIFY_CERT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1383
   X509_F_X509_VERIFY_PARAM_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1384

   X509V3_F_A2I_GENERAL_NAME : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1389
   X509V3_F_ADDR_VALIDATE_PATH_INTERNAL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1390
   X509V3_F_ASIDENTIFIERCHOICE_CANONIZE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1391
   X509V3_F_ASIDENTIFIERCHOICE_IS_CANONICAL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1392
   X509V3_F_BIGNUM_TO_STRING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1393
   X509V3_F_COPY_EMAIL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1394
   X509V3_F_COPY_ISSUER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1395
   X509V3_F_DO_DIRNAME : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1396
   X509V3_F_DO_EXT_I2D : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1397
   X509V3_F_DO_EXT_NCONF : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1398
   X509V3_F_GNAMES_FROM_SECTNAME : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1399
   X509V3_F_I2S_ASN1_ENUMERATED : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1400
   X509V3_F_I2S_ASN1_IA5STRING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1401
   X509V3_F_I2S_ASN1_INTEGER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1402
   X509V3_F_I2V_AUTHORITY_INFO_ACCESS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1403
   X509V3_F_LEVEL_ADD_NODE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1404
   X509V3_F_NOTICE_SECTION : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1405
   X509V3_F_NREF_NOS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1406
   X509V3_F_POLICY_CACHE_CREATE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1407
   X509V3_F_POLICY_CACHE_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1408
   X509V3_F_POLICY_DATA_NEW : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1409
   X509V3_F_POLICY_SECTION : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1410
   X509V3_F_PROCESS_PCI_VALUE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1411
   X509V3_F_R2I_CERTPOL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1412
   X509V3_F_R2I_PCI : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1413
   X509V3_F_S2I_ASN1_IA5STRING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1414
   X509V3_F_S2I_ASN1_INTEGER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1415
   X509V3_F_S2I_ASN1_OCTET_STRING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1416
   X509V3_F_S2I_SKEY_ID : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1417
   X509V3_F_SET_DIST_POINT_NAME : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1418
   X509V3_F_SXNET_ADD_ID_ASC : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1419
   X509V3_F_SXNET_ADD_ID_INTEGER : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1420
   X509V3_F_SXNET_ADD_ID_ULONG : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1421
   X509V3_F_SXNET_GET_ID_ASC : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1422
   X509V3_F_SXNET_GET_ID_ULONG : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1423
   X509V3_F_TREE_INIT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1424
   X509V3_F_V2I_ASIDENTIFIERS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1425
   X509V3_F_V2I_ASN1_BIT_STRING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1426
   X509V3_F_V2I_AUTHORITY_INFO_ACCESS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1427
   X509V3_F_V2I_AUTHORITY_KEYID : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1428
   X509V3_F_V2I_BASIC_CONSTRAINTS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1429
   X509V3_F_V2I_CRLD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1430
   X509V3_F_V2I_EXTENDED_KEY_USAGE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1431
   X509V3_F_V2I_GENERAL_NAMES : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1432
   X509V3_F_V2I_GENERAL_NAME_EX : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1433
   X509V3_F_V2I_IDP : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1434
   X509V3_F_V2I_IPADDRBLOCKS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1435
   X509V3_F_V2I_ISSUER_ALT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1436
   X509V3_F_V2I_NAME_CONSTRAINTS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1437
   X509V3_F_V2I_POLICY_CONSTRAINTS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1438
   X509V3_F_V2I_POLICY_MAPPINGS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1439
   X509V3_F_V2I_SUBJECT_ALT : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1440
   X509V3_F_V2I_TLS_FEATURE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1441
   X509V3_F_V3_GENERIC_EXTENSION : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1442
   X509V3_F_X509V3_ADD1_I2D : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1443
   X509V3_F_X509V3_ADD_VALUE : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1444
   X509V3_F_X509V3_EXT_ADD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1445
   X509V3_F_X509V3_EXT_ADD_ALIAS : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1446
   X509V3_F_X509V3_EXT_I2D : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1447
   X509V3_F_X509V3_EXT_NCONF : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1448
   X509V3_F_X509V3_GET_SECTION : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1449
   X509V3_F_X509V3_GET_STRING : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1450
   X509V3_F_X509V3_GET_VALUE_BOOL : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1451
   X509V3_F_X509V3_PARSE_LIST : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1452
   X509V3_F_X509_PURPOSE_ADD : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1453
   X509V3_F_X509_PURPOSE_SET : constant := 0;  --  /usr/include/openssl/cryptoerr_legacy.h:1454
   --  unsupported macro: EVP_R_OPERATON_NOT_INITIALIZED EVP_R_OPERATION_NOT_INITIALIZED

  -- * Copyright 2020-2021 The OpenSSL Project Authors. All Rights Reserved.
  -- *
  -- * Licensed under the Apache License 2.0 (the "License").  You may not use
  -- * this file except in compliance with the License.  You can obtain a copy
  -- * in the file LICENSE in the source distribution or at
  -- * https://www.openssl.org/source/license.html
  --  

  -- * This header file preserves symbols from pre-3.0 OpenSSL.
  -- * It should never be included directly, as it's already included
  -- * by the public {lib}err.h headers, and since it will go away some
  -- * time in the future.
  --  

   function ERR_load_ASN1_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:29
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_ASN1_strings";

   function ERR_load_ASYNC_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:30
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_ASYNC_strings";

   function ERR_load_BIO_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:31
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_BIO_strings";

   function ERR_load_BN_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:32
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_BN_strings";

   function ERR_load_BUF_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:33
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_BUF_strings";

   function ERR_load_CMS_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:35
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_CMS_strings";

   function ERR_load_COMP_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:38
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_COMP_strings";

   function ERR_load_CONF_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:40
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_CONF_strings";

   function ERR_load_CRYPTO_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:41
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_CRYPTO_strings";

   function ERR_load_CT_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:43
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_CT_strings";

   function ERR_load_DH_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:46
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_DH_strings";

   function ERR_load_DSA_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:49
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_DSA_strings";

   function ERR_load_EC_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:52
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_EC_strings";

   function ERR_load_ENGINE_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:55
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_ENGINE_strings";

   function ERR_load_ERR_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:57
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_ERR_strings";

   function ERR_load_EVP_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:58
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_EVP_strings";

   function ERR_load_KDF_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:59
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_KDF_strings";

   function ERR_load_OBJ_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:60
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_OBJ_strings";

   function ERR_load_OCSP_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:62
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_OCSP_strings";

   function ERR_load_PEM_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:64
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_PEM_strings";

   function ERR_load_PKCS12_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:65
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_PKCS12_strings";

   function ERR_load_PKCS7_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:66
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_PKCS7_strings";

   function ERR_load_RAND_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:67
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_RAND_strings";

   function ERR_load_RSA_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:68
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_RSA_strings";

   function ERR_load_OSSL_STORE_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:69
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_OSSL_STORE_strings";

   function ERR_load_TS_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:71
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_TS_strings";

   function ERR_load_UI_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:73
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_UI_strings";

   function ERR_load_X509_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:74
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_X509_strings";

   function ERR_load_X509V3_strings return int  -- /usr/include/openssl/cryptoerr_legacy.h:75
   with Import => True, 
        Convention => C, 
        External_Name => "ERR_load_X509V3_strings";

  -- Collected _F_ macros from OpenSSL 1.1.1  
  -- * ASN1 function codes.
  --  

  -- * ASYNC function codes.
  --  

  -- * BIO function codes.
  --  

  -- * BN function codes.
  --  

  -- * BUF function codes.
  --  

  -- * CMS function codes.
  --  

  -- * COMP function codes.
  --  

  -- * CONF function codes.
  --  

  -- * CRYPTO function codes.
  --  

  -- * CT function codes.
  --  

  -- * DH function codes.
  --  

  -- * DSA function codes.
  --  

  -- * EC function codes.
  --  

  -- * ENGINE function codes.
  --  

  -- * EVP function codes.
  --  

  -- * KDF function codes.
  --  

  -- * KDF reason codes.
  --  

  -- * OBJ function codes.
  --  

  -- * OCSP function codes.
  --  

  -- * PEM function codes.
  --  

  -- * PKCS12 function codes.
  --  

  -- * PKCS7 function codes.
  --  

  -- * RAND function codes.
  --  

  -- * RSA function codes.
  --  

  -- * OSSL_STORE function codes.
  --  

  -- * TS function codes.
  --  

  -- * UI function codes.
  --  

  -- * X509 function codes.
  --  

  -- * X509V3 function codes.
  --  

  -- * Compatibility defines.
  --  

end openssl_cryptoerr_legacy_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
