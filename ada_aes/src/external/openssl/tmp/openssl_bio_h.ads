pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
limited with openssl_types_h;
with Interfaces.C.Strings;
with stddef_h;
with System;
with openssl_stack_h;
with bits_stdint_uintn_h;
with stdint_h;
limited with openssl_core_h;
limited with bits_types_struct_FILE_h;
with bits_types_time_t_h;

package openssl_bio_h is

   BIO_TYPE_DESCRIPTOR : constant := 16#0100#;  --  /usr/include/openssl/bio.h:39
   BIO_TYPE_FILTER : constant := 16#0200#;  --  /usr/include/openssl/bio.h:40
   BIO_TYPE_SOURCE_SINK : constant := 16#0400#;  --  /usr/include/openssl/bio.h:41

   BIO_TYPE_NONE : constant := 0;  --  /usr/include/openssl/bio.h:44
   --  unsupported macro: BIO_TYPE_MEM ( 1|BIO_TYPE_SOURCE_SINK)
   --  unsupported macro: BIO_TYPE_FILE ( 2|BIO_TYPE_SOURCE_SINK)
   --  unsupported macro: BIO_TYPE_FD ( 4|BIO_TYPE_SOURCE_SINK|BIO_TYPE_DESCRIPTOR)
   --  unsupported macro: BIO_TYPE_SOCKET ( 5|BIO_TYPE_SOURCE_SINK|BIO_TYPE_DESCRIPTOR)
   --  unsupported macro: BIO_TYPE_NULL ( 6|BIO_TYPE_SOURCE_SINK)
   --  unsupported macro: BIO_TYPE_SSL ( 7|BIO_TYPE_FILTER)
   --  unsupported macro: BIO_TYPE_MD ( 8|BIO_TYPE_FILTER)
   --  unsupported macro: BIO_TYPE_BUFFER ( 9|BIO_TYPE_FILTER)
   --  unsupported macro: BIO_TYPE_CIPHER (10|BIO_TYPE_FILTER)
   --  unsupported macro: BIO_TYPE_BASE64 (11|BIO_TYPE_FILTER)
   --  unsupported macro: BIO_TYPE_CONNECT (12|BIO_TYPE_SOURCE_SINK|BIO_TYPE_DESCRIPTOR)
   --  unsupported macro: BIO_TYPE_ACCEPT (13|BIO_TYPE_SOURCE_SINK|BIO_TYPE_DESCRIPTOR)
   --  unsupported macro: BIO_TYPE_NBIO_TEST (16|BIO_TYPE_FILTER)
   --  unsupported macro: BIO_TYPE_NULL_FILTER (17|BIO_TYPE_FILTER)
   --  unsupported macro: BIO_TYPE_BIO (19|BIO_TYPE_SOURCE_SINK)
   --  unsupported macro: BIO_TYPE_LINEBUFFER (20|BIO_TYPE_FILTER)
   --  unsupported macro: BIO_TYPE_DGRAM (21|BIO_TYPE_SOURCE_SINK|BIO_TYPE_DESCRIPTOR)
   --  unsupported macro: BIO_TYPE_ASN1 (22|BIO_TYPE_FILTER)
   --  unsupported macro: BIO_TYPE_COMP (23|BIO_TYPE_FILTER)
   --  unsupported macro: BIO_TYPE_CORE_TO_PROV (25|BIO_TYPE_SOURCE_SINK)
   --  unsupported macro: BIO_TYPE_DGRAM_PAIR (26|BIO_TYPE_SOURCE_SINK)
   --  unsupported macro: BIO_TYPE_DGRAM_MEM (27|BIO_TYPE_SOURCE_SINK)

   BIO_TYPE_START : constant := 128;  --  /usr/include/openssl/bio.h:73

   BIO_NOCLOSE : constant := 16#00#;  --  /usr/include/openssl/bio.h:79
   BIO_CLOSE : constant := 16#01#;  --  /usr/include/openssl/bio.h:80

   BIO_CTRL_RESET : constant := 1;  --  /usr/include/openssl/bio.h:85
   BIO_CTRL_EOF : constant := 2;  --  /usr/include/openssl/bio.h:86
   BIO_CTRL_INFO : constant := 3;  --  /usr/include/openssl/bio.h:87
   BIO_CTRL_SET : constant := 4;  --  /usr/include/openssl/bio.h:88
   BIO_CTRL_GET : constant := 5;  --  /usr/include/openssl/bio.h:89
   BIO_CTRL_PUSH : constant := 6;  --  /usr/include/openssl/bio.h:90
   BIO_CTRL_POP : constant := 7;  --  /usr/include/openssl/bio.h:91
   BIO_CTRL_GET_CLOSE : constant := 8;  --  /usr/include/openssl/bio.h:92
   BIO_CTRL_SET_CLOSE : constant := 9;  --  /usr/include/openssl/bio.h:93
   BIO_CTRL_PENDING : constant := 10;  --  /usr/include/openssl/bio.h:94
   BIO_CTRL_FLUSH : constant := 11;  --  /usr/include/openssl/bio.h:95
   BIO_CTRL_DUP : constant := 12;  --  /usr/include/openssl/bio.h:96
   BIO_CTRL_WPENDING : constant := 13;  --  /usr/include/openssl/bio.h:97
   BIO_CTRL_SET_CALLBACK : constant := 14;  --  /usr/include/openssl/bio.h:98
   BIO_CTRL_GET_CALLBACK : constant := 15;  --  /usr/include/openssl/bio.h:99

   BIO_CTRL_PEEK : constant := 29;  --  /usr/include/openssl/bio.h:101
   BIO_CTRL_SET_FILENAME : constant := 30;  --  /usr/include/openssl/bio.h:102

   BIO_CTRL_DGRAM_CONNECT : constant := 31;  --  /usr/include/openssl/bio.h:105
   BIO_CTRL_DGRAM_SET_CONNECTED : constant := 32;  --  /usr/include/openssl/bio.h:106

   BIO_CTRL_DGRAM_SET_RECV_TIMEOUT : constant := 33;  --  /usr/include/openssl/bio.h:108
   BIO_CTRL_DGRAM_GET_RECV_TIMEOUT : constant := 34;  --  /usr/include/openssl/bio.h:109
   BIO_CTRL_DGRAM_SET_SEND_TIMEOUT : constant := 35;  --  /usr/include/openssl/bio.h:110
   BIO_CTRL_DGRAM_GET_SEND_TIMEOUT : constant := 36;  --  /usr/include/openssl/bio.h:111

   BIO_CTRL_DGRAM_GET_RECV_TIMER_EXP : constant := 37;  --  /usr/include/openssl/bio.h:113
   BIO_CTRL_DGRAM_GET_SEND_TIMER_EXP : constant := 38;  --  /usr/include/openssl/bio.h:114

   BIO_CTRL_DGRAM_MTU_DISCOVER : constant := 39;  --  /usr/include/openssl/bio.h:117

   BIO_CTRL_DGRAM_QUERY_MTU : constant := 40;  --  /usr/include/openssl/bio.h:120
   BIO_CTRL_DGRAM_GET_FALLBACK_MTU : constant := 47;  --  /usr/include/openssl/bio.h:121
   BIO_CTRL_DGRAM_GET_MTU : constant := 41;  --  /usr/include/openssl/bio.h:122
   BIO_CTRL_DGRAM_SET_MTU : constant := 42;  --  /usr/include/openssl/bio.h:123

   BIO_CTRL_DGRAM_MTU_EXCEEDED : constant := 43;  --  /usr/include/openssl/bio.h:127

   BIO_CTRL_DGRAM_GET_PEER : constant := 46;  --  /usr/include/openssl/bio.h:131
   BIO_CTRL_DGRAM_SET_PEER : constant := 44;  --  /usr/include/openssl/bio.h:132

   BIO_CTRL_DGRAM_SET_NEXT_TIMEOUT : constant := 45;  --  /usr/include/openssl/bio.h:134

   BIO_CTRL_DGRAM_SET_DONT_FRAG : constant := 48;  --  /usr/include/openssl/bio.h:136

   BIO_CTRL_DGRAM_GET_MTU_OVERHEAD : constant := 49;  --  /usr/include/openssl/bio.h:138

   BIO_CTRL_DGRAM_SCTP_SET_IN_HANDSHAKE : constant := 50;  --  /usr/include/openssl/bio.h:141

   BIO_CTRL_DGRAM_SET_PEEK_MODE : constant := 71;  --  /usr/include/openssl/bio.h:156

   BIO_CTRL_GET_KTLS_SEND : constant := 73;  --  /usr/include/openssl/bio.h:165
   BIO_CTRL_GET_KTLS_RECV : constant := 76;  --  /usr/include/openssl/bio.h:166

   BIO_CTRL_DGRAM_SCTP_WAIT_FOR_DRY : constant := 77;  --  /usr/include/openssl/bio.h:168
   BIO_CTRL_DGRAM_SCTP_MSG_WAITING : constant := 78;  --  /usr/include/openssl/bio.h:169

   BIO_CTRL_SET_PREFIX : constant := 79;  --  /usr/include/openssl/bio.h:172
   BIO_CTRL_SET_INDENT : constant := 80;  --  /usr/include/openssl/bio.h:173
   BIO_CTRL_GET_INDENT : constant := 81;  --  /usr/include/openssl/bio.h:174

   BIO_CTRL_DGRAM_GET_LOCAL_ADDR_CAP : constant := 82;  --  /usr/include/openssl/bio.h:176
   BIO_CTRL_DGRAM_GET_LOCAL_ADDR_ENABLE : constant := 83;  --  /usr/include/openssl/bio.h:177
   BIO_CTRL_DGRAM_SET_LOCAL_ADDR_ENABLE : constant := 84;  --  /usr/include/openssl/bio.h:178
   BIO_CTRL_DGRAM_GET_EFFECTIVE_CAPS : constant := 85;  --  /usr/include/openssl/bio.h:179
   BIO_CTRL_DGRAM_GET_CAPS : constant := 86;  --  /usr/include/openssl/bio.h:180
   BIO_CTRL_DGRAM_SET_CAPS : constant := 87;  --  /usr/include/openssl/bio.h:181
   BIO_CTRL_DGRAM_GET_NO_TRUNC : constant := 88;  --  /usr/include/openssl/bio.h:182
   BIO_CTRL_DGRAM_SET_NO_TRUNC : constant := 89;  --  /usr/include/openssl/bio.h:183

   BIO_CTRL_GET_RPOLL_DESCRIPTOR : constant := 91;  --  /usr/include/openssl/bio.h:190
   BIO_CTRL_GET_WPOLL_DESCRIPTOR : constant := 92;  --  /usr/include/openssl/bio.h:191
   BIO_CTRL_DGRAM_DETECT_PEER_ADDR : constant := 93;  --  /usr/include/openssl/bio.h:192

   BIO_DGRAM_CAP_NONE : constant := 0;  --  /usr/include/openssl/bio.h:194
   BIO_DGRAM_CAP_HANDLES_SRC_ADDR : constant := (2 ** 0);  --  /usr/include/openssl/bio.h:195
   BIO_DGRAM_CAP_HANDLES_DST_ADDR : constant := (2 ** 1);  --  /usr/include/openssl/bio.h:196
   BIO_DGRAM_CAP_PROVIDES_SRC_ADDR : constant := (2 ** 2);  --  /usr/include/openssl/bio.h:197
   BIO_DGRAM_CAP_PROVIDES_DST_ADDR : constant := (2 ** 3);  --  /usr/include/openssl/bio.h:198
   --  arg-macro: function BIO_get_ktls_send (b)
   --    return BIO_ctrl(b, BIO_CTRL_GET_KTLS_SEND, 0, NULL) > 0;
   --  arg-macro: function BIO_get_ktls_recv (b)
   --    return BIO_ctrl(b, BIO_CTRL_GET_KTLS_RECV, 0, NULL) > 0;

   BIO_FP_READ : constant := 16#02#;  --  /usr/include/openssl/bio.h:211
   BIO_FP_WRITE : constant := 16#04#;  --  /usr/include/openssl/bio.h:212
   BIO_FP_APPEND : constant := 16#08#;  --  /usr/include/openssl/bio.h:213
   BIO_FP_TEXT : constant := 16#10#;  --  /usr/include/openssl/bio.h:214

   BIO_FLAGS_READ : constant := 16#01#;  --  /usr/include/openssl/bio.h:216
   BIO_FLAGS_WRITE : constant := 16#02#;  --  /usr/include/openssl/bio.h:217
   BIO_FLAGS_IO_SPECIAL : constant := 16#04#;  --  /usr/include/openssl/bio.h:218
   --  unsupported macro: BIO_FLAGS_RWS (BIO_FLAGS_READ|BIO_FLAGS_WRITE|BIO_FLAGS_IO_SPECIAL)

   BIO_FLAGS_SHOULD_RETRY : constant := 16#08#;  --  /usr/include/openssl/bio.h:220

   BIO_FLAGS_UPLINK : constant := 0;  --  /usr/include/openssl/bio.h:223

   BIO_FLAGS_BASE64_NO_NL : constant := 16#100#;  --  /usr/include/openssl/bio.h:226

   BIO_FLAGS_MEM_RDONLY : constant := 16#200#;  --  /usr/include/openssl/bio.h:233
   BIO_FLAGS_NONCLEAR_RST : constant := 16#400#;  --  /usr/include/openssl/bio.h:234
   BIO_FLAGS_IN_EOF : constant := 16#800#;  --  /usr/include/openssl/bio.h:235
   --  arg-macro: procedure BIO_get_flags (b)
   --    BIO_test_flags(b, ~(16#0#))
   --  arg-macro: procedure BIO_set_retry_special (b)
   --    BIO_set_flags(b, (BIO_FLAGS_IO_SPECIALorBIO_FLAGS_SHOULD_RETRY))
   --  arg-macro: procedure BIO_set_retry_read (b)
   --    BIO_set_flags(b, (BIO_FLAGS_READorBIO_FLAGS_SHOULD_RETRY))
   --  arg-macro: procedure BIO_set_retry_write (b)
   --    BIO_set_flags(b, (BIO_FLAGS_WRITEorBIO_FLAGS_SHOULD_RETRY))
   --  arg-macro: procedure BIO_clear_retry_flags (b)
   --    BIO_clear_flags(b, (BIO_FLAGS_RWSorBIO_FLAGS_SHOULD_RETRY))
   --  arg-macro: procedure BIO_get_retry_flags (b)
   --    BIO_test_flags(b, (BIO_FLAGS_RWSorBIO_FLAGS_SHOULD_RETRY))
   --  arg-macro: procedure BIO_should_read (a)
   --    BIO_test_flags(a, BIO_FLAGS_READ)
   --  arg-macro: procedure BIO_should_write (a)
   --    BIO_test_flags(a, BIO_FLAGS_WRITE)
   --  arg-macro: procedure BIO_should_io_special (a)
   --    BIO_test_flags(a, BIO_FLAGS_IO_SPECIAL)
   --  arg-macro: procedure BIO_retry_type (a)
   --    BIO_test_flags(a, BIO_FLAGS_RWS)
   --  arg-macro: procedure BIO_should_retry (a)
   --    BIO_test_flags(a, BIO_FLAGS_SHOULD_RETRY)

   BIO_RR_SSL_X509_LOOKUP : constant := 16#01#;  --  /usr/include/openssl/bio.h:278

   BIO_RR_CONNECT : constant := 16#02#;  --  /usr/include/openssl/bio.h:280

   BIO_RR_ACCEPT : constant := 16#03#;  --  /usr/include/openssl/bio.h:282

   BIO_CB_FREE : constant := 16#01#;  --  /usr/include/openssl/bio.h:285
   BIO_CB_READ : constant := 16#02#;  --  /usr/include/openssl/bio.h:286
   BIO_CB_WRITE : constant := 16#03#;  --  /usr/include/openssl/bio.h:287
   BIO_CB_PUTS : constant := 16#04#;  --  /usr/include/openssl/bio.h:288
   BIO_CB_GETS : constant := 16#05#;  --  /usr/include/openssl/bio.h:289
   BIO_CB_CTRL : constant := 16#06#;  --  /usr/include/openssl/bio.h:290
   BIO_CB_RECVMMSG : constant := 16#07#;  --  /usr/include/openssl/bio.h:291
   BIO_CB_SENDMMSG : constant := 16#08#;  --  /usr/include/openssl/bio.h:292

   BIO_CB_RETURN : constant := 16#80#;  --  /usr/include/openssl/bio.h:298
   --  arg-macro: function BIO_CB_return (a)
   --    return (a)orBIO_CB_RETURN;
   --  arg-macro: function BIO_cb_pre (a)
   --    return not((a)andBIO_CB_RETURN);
   --  arg-macro: function BIO_cb_post (a)
   --    return (a)andBIO_CB_RETURN;
   --  arg-macro: procedure sk_BIO_num (sk)
   --    OPENSSL_sk_num(ossl_check_const_BIO_sk_type(sk))
   --  arg-macro: function sk_BIO_value (sk, idx)
   --    return (BIO *)OPENSSL_sk_value(ossl_check_const_BIO_sk_type(sk), (idx));
   --  arg-macro: function sk_BIO_new (cmp)
   --    return (STACK_OF(BIO) *)OPENSSL_sk_new(ossl_check_BIO_compfunc_type(cmp));
   --  arg-macro: function sk_BIO_new_null ()
   --    return (STACK_OF(BIO) *)OPENSSL_sk_new_null();
   --  arg-macro: function sk_BIO_new_reserve (cmp, n)
   --    return (STACK_OF(BIO) *)OPENSSL_sk_new_reserve(ossl_check_BIO_compfunc_type(cmp), (n));
   --  arg-macro: procedure sk_BIO_reserve (sk, n)
   --    OPENSSL_sk_reserve(ossl_check_BIO_sk_type(sk), (n))
   --  arg-macro: procedure sk_BIO_free (sk)
   --    OPENSSL_sk_free(ossl_check_BIO_sk_type(sk))
   --  arg-macro: procedure sk_BIO_zero (sk)
   --    OPENSSL_sk_zero(ossl_check_BIO_sk_type(sk))
   --  arg-macro: function sk_BIO_delete (sk, i)
   --    return (BIO *)OPENSSL_sk_delete(ossl_check_BIO_sk_type(sk), (i));
   --  arg-macro: function sk_BIO_delete_ptr (sk, ptr)
   --    return (BIO *)OPENSSL_sk_delete_ptr(ossl_check_BIO_sk_type(sk), ossl_check_BIO_type(ptr));
   --  arg-macro: procedure sk_BIO_push (sk, ptr)
   --    OPENSSL_sk_push(ossl_check_BIO_sk_type(sk), ossl_check_BIO_type(ptr))
   --  arg-macro: procedure sk_BIO_unshift (sk, ptr)
   --    OPENSSL_sk_unshift(ossl_check_BIO_sk_type(sk), ossl_check_BIO_type(ptr))
   --  arg-macro: function sk_BIO_pop (sk)
   --    return (BIO *)OPENSSL_sk_pop(ossl_check_BIO_sk_type(sk));
   --  arg-macro: function sk_BIO_shift (sk)
   --    return (BIO *)OPENSSL_sk_shift(ossl_check_BIO_sk_type(sk));
   --  arg-macro: procedure sk_BIO_pop_free (sk, freefunc)
   --    OPENSSL_sk_pop_free(ossl_check_BIO_sk_type(sk),ossl_check_BIO_freefunc_type(freefunc))
   --  arg-macro: procedure sk_BIO_insert (sk, ptr, idx)
   --    OPENSSL_sk_insert(ossl_check_BIO_sk_type(sk), ossl_check_BIO_type(ptr), (idx))
   --  arg-macro: function sk_BIO_set (sk, idx, ptr)
   --    return (BIO *)OPENSSL_sk_set(ossl_check_BIO_sk_type(sk), (idx), ossl_check_BIO_type(ptr));
   --  arg-macro: procedure sk_BIO_find (sk, ptr)
   --    OPENSSL_sk_find(ossl_check_BIO_sk_type(sk), ossl_check_BIO_type(ptr))
   --  arg-macro: procedure sk_BIO_find_ex (sk, ptr)
   --    OPENSSL_sk_find_ex(ossl_check_BIO_sk_type(sk), ossl_check_BIO_type(ptr))
   --  arg-macro: procedure sk_BIO_find_all (sk, ptr, pnum)
   --    OPENSSL_sk_find_all(ossl_check_BIO_sk_type(sk), ossl_check_BIO_type(ptr), pnum)
   --  arg-macro: procedure sk_BIO_sort (sk)
   --    OPENSSL_sk_sort(ossl_check_BIO_sk_type(sk))
   --  arg-macro: procedure sk_BIO_is_sorted (sk)
   --    OPENSSL_sk_is_sorted(ossl_check_const_BIO_sk_type(sk))
   --  arg-macro: function sk_BIO_dup (sk)
   --    return (STACK_OF(BIO) *)OPENSSL_sk_dup(ossl_check_const_BIO_sk_type(sk));
   --  arg-macro: function sk_BIO_deep_copy (sk, copyfunc, freefunc)
   --    return (STACK_OF(BIO) *)OPENSSL_sk_deep_copy(ossl_check_const_BIO_sk_type(sk), ossl_check_BIO_copyfunc_type(copyfunc), ossl_check_BIO_freefunc_type(freefunc));
   --  arg-macro: function sk_BIO_set_cmp_func (sk, cmp)
   --    return (sk_BIO_compfunc)OPENSSL_sk_set_cmp_func(ossl_check_BIO_sk_type(sk), ossl_check_BIO_compfunc_type(cmp));

   BIO_POLL_DESCRIPTOR_TYPE_NONE : constant := 0;  --  /usr/include/openssl/bio.h:408
   BIO_POLL_DESCRIPTOR_TYPE_SOCK_FD : constant := 1;  --  /usr/include/openssl/bio.h:409
   BIO_POLL_DESCRIPTOR_CUSTOM_START : constant := 8192;  --  /usr/include/openssl/bio.h:410

   BIO_C_SET_CONNECT : constant := 100;  --  /usr/include/openssl/bio.h:425
   BIO_C_DO_STATE_MACHINE : constant := 101;  --  /usr/include/openssl/bio.h:426
   BIO_C_SET_NBIO : constant := 102;  --  /usr/include/openssl/bio.h:427

   BIO_C_SET_FD : constant := 104;  --  /usr/include/openssl/bio.h:429
   BIO_C_GET_FD : constant := 105;  --  /usr/include/openssl/bio.h:430
   BIO_C_SET_FILE_PTR : constant := 106;  --  /usr/include/openssl/bio.h:431
   BIO_C_GET_FILE_PTR : constant := 107;  --  /usr/include/openssl/bio.h:432
   BIO_C_SET_FILENAME : constant := 108;  --  /usr/include/openssl/bio.h:433
   BIO_C_SET_SSL : constant := 109;  --  /usr/include/openssl/bio.h:434
   BIO_C_GET_SSL : constant := 110;  --  /usr/include/openssl/bio.h:435
   BIO_C_SET_MD : constant := 111;  --  /usr/include/openssl/bio.h:436
   BIO_C_GET_MD : constant := 112;  --  /usr/include/openssl/bio.h:437
   BIO_C_GET_CIPHER_STATUS : constant := 113;  --  /usr/include/openssl/bio.h:438
   BIO_C_SET_BUF_MEM : constant := 114;  --  /usr/include/openssl/bio.h:439
   BIO_C_GET_BUF_MEM_PTR : constant := 115;  --  /usr/include/openssl/bio.h:440
   BIO_C_GET_BUFF_NUM_LINES : constant := 116;  --  /usr/include/openssl/bio.h:441
   BIO_C_SET_BUFF_SIZE : constant := 117;  --  /usr/include/openssl/bio.h:442
   BIO_C_SET_ACCEPT : constant := 118;  --  /usr/include/openssl/bio.h:443
   BIO_C_SSL_MODE : constant := 119;  --  /usr/include/openssl/bio.h:444
   BIO_C_GET_MD_CTX : constant := 120;  --  /usr/include/openssl/bio.h:445

   BIO_C_SET_BUFF_READ_DATA : constant := 122;  --  /usr/include/openssl/bio.h:447
   BIO_C_GET_CONNECT : constant := 123;  --  /usr/include/openssl/bio.h:448
   BIO_C_GET_ACCEPT : constant := 124;  --  /usr/include/openssl/bio.h:449
   BIO_C_SET_SSL_RENEGOTIATE_BYTES : constant := 125;  --  /usr/include/openssl/bio.h:450
   BIO_C_GET_SSL_NUM_RENEGOTIATES : constant := 126;  --  /usr/include/openssl/bio.h:451
   BIO_C_SET_SSL_RENEGOTIATE_TIMEOUT : constant := 127;  --  /usr/include/openssl/bio.h:452
   BIO_C_FILE_SEEK : constant := 128;  --  /usr/include/openssl/bio.h:453
   BIO_C_GET_CIPHER_CTX : constant := 129;  --  /usr/include/openssl/bio.h:454
   BIO_C_SET_BUF_MEM_EOF_RETURN : constant := 130;  --  /usr/include/openssl/bio.h:455

   BIO_C_SET_BIND_MODE : constant := 131;  --  /usr/include/openssl/bio.h:457
   BIO_C_GET_BIND_MODE : constant := 132;  --  /usr/include/openssl/bio.h:458
   BIO_C_FILE_TELL : constant := 133;  --  /usr/include/openssl/bio.h:459
   BIO_C_GET_SOCKS : constant := 134;  --  /usr/include/openssl/bio.h:460
   BIO_C_SET_SOCKS : constant := 135;  --  /usr/include/openssl/bio.h:461

   BIO_C_SET_WRITE_BUF_SIZE : constant := 136;  --  /usr/include/openssl/bio.h:463
   BIO_C_GET_WRITE_BUF_SIZE : constant := 137;  --  /usr/include/openssl/bio.h:464
   BIO_C_MAKE_BIO_PAIR : constant := 138;  --  /usr/include/openssl/bio.h:465
   BIO_C_DESTROY_BIO_PAIR : constant := 139;  --  /usr/include/openssl/bio.h:466
   BIO_C_GET_WRITE_GUARANTEE : constant := 140;  --  /usr/include/openssl/bio.h:467
   BIO_C_GET_READ_REQUEST : constant := 141;  --  /usr/include/openssl/bio.h:468
   BIO_C_SHUTDOWN_WR : constant := 142;  --  /usr/include/openssl/bio.h:469
   BIO_C_NREAD0 : constant := 143;  --  /usr/include/openssl/bio.h:470
   BIO_C_NREAD : constant := 144;  --  /usr/include/openssl/bio.h:471
   BIO_C_NWRITE0 : constant := 145;  --  /usr/include/openssl/bio.h:472
   BIO_C_NWRITE : constant := 146;  --  /usr/include/openssl/bio.h:473
   BIO_C_RESET_READ_REQUEST : constant := 147;  --  /usr/include/openssl/bio.h:474
   BIO_C_SET_MD_CTX : constant := 148;  --  /usr/include/openssl/bio.h:475

   BIO_C_SET_PREFIX : constant := 149;  --  /usr/include/openssl/bio.h:477
   BIO_C_GET_PREFIX : constant := 150;  --  /usr/include/openssl/bio.h:478
   BIO_C_SET_SUFFIX : constant := 151;  --  /usr/include/openssl/bio.h:479
   BIO_C_GET_SUFFIX : constant := 152;  --  /usr/include/openssl/bio.h:480

   BIO_C_SET_EX_ARG : constant := 153;  --  /usr/include/openssl/bio.h:482
   BIO_C_GET_EX_ARG : constant := 154;  --  /usr/include/openssl/bio.h:483

   BIO_C_SET_CONNECT_MODE : constant := 155;  --  /usr/include/openssl/bio.h:485

   BIO_C_SET_TFO : constant := 156;  --  /usr/include/openssl/bio.h:487

   BIO_C_SET_SOCK_TYPE : constant := 157;  --  /usr/include/openssl/bio.h:489
   BIO_C_GET_SOCK_TYPE : constant := 158;  --  /usr/include/openssl/bio.h:490
   BIO_C_GET_DGRAM_BIO : constant := 159;  --  /usr/include/openssl/bio.h:491
   --  arg-macro: procedure BIO_set_app_data (s, arg)
   --    BIO_set_ex_data(s,0,arg)
   --  arg-macro: procedure BIO_get_app_data (s)
   --    BIO_get_ex_data(s,0)
   --  arg-macro: procedure BIO_set_nbio (b, n)
   --    BIO_ctrl(b,BIO_C_SET_NBIO,(n),NULL)
   --  arg-macro: procedure BIO_set_tfo (b, n)
   --    BIO_ctrl(b,BIO_C_SET_TFO,(n),NULL)

   BIO_FAMILY_IPV4 : constant := 4;  --  /usr/include/openssl/bio.h:502
   BIO_FAMILY_IPV6 : constant := 6;  --  /usr/include/openssl/bio.h:503
   BIO_FAMILY_IPANY : constant := 256;  --  /usr/include/openssl/bio.h:504
   --  arg-macro: procedure BIO_set_conn_hostname (b, name)
   --    BIO_ctrl(b,BIO_C_SET_CONNECT,0, (char *)(name))
   --  arg-macro: procedure BIO_set_conn_port (b, port)
   --    BIO_ctrl(b,BIO_C_SET_CONNECT,1, (char *)(port))
   --  arg-macro: procedure BIO_set_conn_address (b, addr)
   --    BIO_ctrl(b,BIO_C_SET_CONNECT,2, (char *)(addr))
   --  arg-macro: procedure BIO_set_conn_ip_family (b, f)
   --    BIO_int_ctrl(b,BIO_C_SET_CONNECT,3,f)
   --  arg-macro: function BIO_get_conn_hostname (b)
   --    return (const char *)BIO_ptr_ctrl(b,BIO_C_GET_CONNECT,0);
   --  arg-macro: function BIO_get_conn_port (b)
   --    return (const char *)BIO_ptr_ctrl(b,BIO_C_GET_CONNECT,1);
   --  arg-macro: function BIO_get_conn_address (b)
   --    return (const BIO_ADDR *)BIO_ptr_ctrl(b,BIO_C_GET_CONNECT,2);
   --  arg-macro: procedure BIO_get_conn_ip_family (b)
   --    BIO_ctrl(b,BIO_C_GET_CONNECT,3,NULL)
   --  arg-macro: procedure BIO_get_conn_mode (b)
   --    BIO_ctrl(b,BIO_C_GET_CONNECT,4,NULL)
   --  arg-macro: procedure BIO_set_conn_mode (b, n)
   --    BIO_ctrl(b,BIO_C_SET_CONNECT_MODE,(n),NULL)
   --  arg-macro: procedure BIO_set_sock_type (b, t)
   --    BIO_ctrl(b,BIO_C_SET_SOCK_TYPE,(t),NULL)
   --  arg-macro: procedure BIO_get_sock_type (b)
   --    BIO_ctrl(b,BIO_C_GET_SOCK_TYPE,0,NULL)
   --  arg-macro: procedure BIO_get0_dgram_bio (b, p)
   --    BIO_ctrl(b,BIO_C_GET_DGRAM_BIO,0,(void *)(BIO **)(p))
   --  arg-macro: procedure BIO_set_accept_name (b, name)
   --    BIO_ctrl(b,BIO_C_SET_ACCEPT,0, (char *)(name))
   --  arg-macro: procedure BIO_set_accept_port (b, port)
   --    BIO_ctrl(b,BIO_C_SET_ACCEPT,1, (char *)(port))
   --  arg-macro: function BIO_get_accept_name (b)
   --    return (const char *)BIO_ptr_ctrl(b,BIO_C_GET_ACCEPT,0);
   --  arg-macro: function BIO_get_accept_port (b)
   --    return (const char *)BIO_ptr_ctrl(b,BIO_C_GET_ACCEPT,1);
   --  arg-macro: function BIO_get_peer_name (b)
   --    return (const char *)BIO_ptr_ctrl(b,BIO_C_GET_ACCEPT,2);
   --  arg-macro: function BIO_get_peer_port (b)
   --    return (const char *)BIO_ptr_ctrl(b,BIO_C_GET_ACCEPT,3);
   --  arg-macro: procedure BIO_set_nbio_accept (b, n)
   --    BIO_ctrl(b,BIO_C_SET_ACCEPT,2,(n)?(void *)"a":NULL)
   --  arg-macro: procedure BIO_set_accept_bios (b, bio)
   --    BIO_ctrl(b,BIO_C_SET_ACCEPT,3, (char *)(bio))
   --  arg-macro: procedure BIO_set_accept_ip_family (b, f)
   --    BIO_int_ctrl(b,BIO_C_SET_ACCEPT,4,f)
   --  arg-macro: procedure BIO_get_accept_ip_family (b)
   --    BIO_ctrl(b,BIO_C_GET_ACCEPT,4,NULL)
   --  arg-macro: procedure BIO_set_tfo_accept (b, n)
   --    BIO_ctrl(b,BIO_C_SET_ACCEPT,5,(n)?(void *)"a":NULL)

   BIO_BIND_NORMAL : constant := 0;  --  /usr/include/openssl/bio.h:542
   --  unsupported macro: BIO_BIND_REUSEADDR BIO_SOCK_REUSEADDR
   --  unsupported macro: BIO_BIND_REUSEADDR_IF_UNUSED BIO_SOCK_REUSEADDR
   --  arg-macro: procedure BIO_set_bind_mode (b, mode)
   --    BIO_ctrl(b,BIO_C_SET_BIND_MODE,mode,NULL)
   --  arg-macro: procedure BIO_get_bind_mode (b)
   --    BIO_ctrl(b,BIO_C_GET_BIND_MODE,0,NULL)
   --  arg-macro: procedure BIO_do_connect (b)
   --    BIO_do_handshake(b)
   --  arg-macro: procedure BIO_do_accept (b)
   --    BIO_do_handshake(b)
   --  arg-macro: procedure BIO_do_handshake (b)
   --    BIO_ctrl(b,BIO_C_DO_STATE_MACHINE,0,NULL)
   --  arg-macro: procedure BIO_set_fd (b, fd, c)
   --    BIO_int_ctrl(b,BIO_C_SET_FD,c,fd)
   --  arg-macro: procedure BIO_get_fd (b, c)
   --    BIO_ctrl(b,BIO_C_GET_FD,0,(char *)(c))
   --  arg-macro: procedure BIO_set_fp (b, fp, c)
   --    BIO_ctrl(b,BIO_C_SET_FILE_PTR,c,(char *)(fp))
   --  arg-macro: procedure BIO_get_fp (b, fpp)
   --    BIO_ctrl(b,BIO_C_GET_FILE_PTR,0,(char *)(fpp))
   --  arg-macro: function BIO_seek (b, ofs)
   --    return int)BIO_ctrl(b,BIO_C_FILE_SEEK,ofs,NULL;
   --  arg-macro: function BIO_tell (b)
   --    return int)BIO_ctrl(b,BIO_C_FILE_TELL,0,NULL;
   --  arg-macro: function BIO_read_filename (b, name)
   --    return int)BIO_ctrl(b,BIO_C_SET_FILENAME, BIO_CLOSEorBIO_FP_READ,(char *)(name);
   --  arg-macro: function BIO_write_filename (b, name)
   --    return int)BIO_ctrl(b,BIO_C_SET_FILENAME, BIO_CLOSEorBIO_FP_WRITE,name;
   --  arg-macro: function BIO_append_filename (b, name)
   --    return int)BIO_ctrl(b,BIO_C_SET_FILENAME, BIO_CLOSEorBIO_FP_APPEND,name;
   --  arg-macro: function BIO_rw_filename (b, name)
   --    return int)BIO_ctrl(b,BIO_C_SET_FILENAME, BIO_CLOSEorBIO_FP_READorBIO_FP_WRITE,name;
   --  arg-macro: procedure BIO_set_ssl (b, ssl, c)
   --    BIO_ctrl(b,BIO_C_SET_SSL,c,(char *)(ssl))
   --  arg-macro: procedure BIO_get_ssl (b, sslp)
   --    BIO_ctrl(b,BIO_C_GET_SSL,0,(char *)(sslp))
   --  arg-macro: procedure BIO_set_ssl_mode (b, client)
   --    BIO_ctrl(b,BIO_C_SSL_MODE,client,NULL)
   --  arg-macro: procedure BIO_set_ssl_renegotiate_bytes (b, num)
   --    BIO_ctrl(b,BIO_C_SET_SSL_RENEGOTIATE_BYTES,num,NULL)
   --  arg-macro: procedure BIO_get_num_renegotiates (b)
   --    BIO_ctrl(b,BIO_C_GET_SSL_NUM_RENEGOTIATES,0,NULL)
   --  arg-macro: procedure BIO_set_ssl_renegotiate_timeout (b, seconds)
   --    BIO_ctrl(b,BIO_C_SET_SSL_RENEGOTIATE_TIMEOUT,seconds,NULL)
   --  arg-macro: procedure BIO_get_mem_data (b, pp)
   --    BIO_ctrl(b,BIO_CTRL_INFO,0,(char *)(pp))
   --  arg-macro: procedure BIO_set_mem_buf (b, bm, c)
   --    BIO_ctrl(b,BIO_C_SET_BUF_MEM,c,(char *)(bm))
   --  arg-macro: procedure BIO_get_mem_ptr (b, pp)
   --    BIO_ctrl(b,BIO_C_GET_BUF_MEM_PTR,0, (char *)(pp))
   --  arg-macro: procedure BIO_set_mem_eof_return (b, v)
   --    BIO_ctrl(b,BIO_C_SET_BUF_MEM_EOF_RETURN,v,NULL)
   --  arg-macro: procedure BIO_get_buffer_num_lines (b)
   --    BIO_ctrl(b,BIO_C_GET_BUFF_NUM_LINES,0,NULL)
   --  arg-macro: procedure BIO_set_buffer_size (b, size)
   --    BIO_ctrl(b,BIO_C_SET_BUFF_SIZE,size,NULL)
   --  arg-macro: procedure BIO_set_read_buffer_size (b, size)
   --    BIO_int_ctrl(b,BIO_C_SET_BUFF_SIZE,size,0)
   --  arg-macro: procedure BIO_set_write_buffer_size (b, size)
   --    BIO_int_ctrl(b,BIO_C_SET_BUFF_SIZE,size,1)
   --  arg-macro: procedure BIO_set_buffer_read_data (b, buf, num)
   --    BIO_ctrl(b,BIO_C_SET_BUFF_READ_DATA,num,buf)
   --  arg-macro: procedure BIO_dup_state (b, ret)
   --    BIO_ctrl(b,BIO_CTRL_DUP,0,(char *)(ret))
   --  arg-macro: function BIO_reset (b)
   --    return int)BIO_ctrl(b,BIO_CTRL_RESET,0,NULL;
   --  arg-macro: function BIO_eof (b)
   --    return int)BIO_ctrl(b,BIO_CTRL_EOF,0,NULL;
   --  arg-macro: function BIO_set_close (b, c)
   --    return int)BIO_ctrl(b,BIO_CTRL_SET_CLOSE,(c),NULL;
   --  arg-macro: function BIO_get_close (b)
   --    return int)BIO_ctrl(b,BIO_CTRL_GET_CLOSE,0,NULL;
   --  arg-macro: function BIO_pending (b)
   --    return int)BIO_ctrl(b,BIO_CTRL_PENDING,0,NULL;
   --  arg-macro: function BIO_wpending (b)
   --    return int)BIO_ctrl(b,BIO_CTRL_WPENDING,0,NULL;
   --  arg-macro: function BIO_flush (b)
   --    return int)BIO_ctrl(b,BIO_CTRL_FLUSH,0,NULL;
   --  arg-macro: function BIO_get_info_callback (b, cbp)
   --    return int)BIO_ctrl(b,BIO_CTRL_GET_CALLBACK,0, cbp;
   --  arg-macro: function BIO_set_info_callback (b, cb)
   --    return int)BIO_callback_ctrl(b,BIO_CTRL_SET_CALLBACK,cb;
   --  arg-macro: procedure BIO_buffer_get_num_lines (b)
   --    BIO_ctrl(b,BIO_CTRL_GET,0,NULL)
   --  arg-macro: procedure BIO_buffer_peek (b, s, l)
   --    BIO_ctrl(b,BIO_CTRL_PEEK,(l),(s))
   --  arg-macro: function BIO_set_write_buf_size (b, size)
   --    return int)BIO_ctrl(b,BIO_C_SET_WRITE_BUF_SIZE,size,NULL;
   --  arg-macro: function BIO_get_write_buf_size (b, size)
   --    return size_t)BIO_ctrl(b,BIO_C_GET_WRITE_BUF_SIZE,size,NULL;
   --  arg-macro: function BIO_make_bio_pair (b1, b2)
   --    return int)BIO_ctrl(b1,BIO_C_MAKE_BIO_PAIR,0,b2;
   --  arg-macro: function BIO_destroy_bio_pair (b)
   --    return int)BIO_ctrl(b,BIO_C_DESTROY_BIO_PAIR,0,NULL;
   --  arg-macro: function BIO_shutdown_wr (b)
   --    return int)BIO_ctrl(b, BIO_C_SHUTDOWN_WR, 0, NULL;
   --  arg-macro: function BIO_get_write_guarantee (b)
   --    return int)BIO_ctrl(b,BIO_C_GET_WRITE_GUARANTEE,0,NULL;
   --  arg-macro: function BIO_get_read_request (b)
   --    return int)BIO_ctrl(b,BIO_C_GET_READ_REQUEST,0,NULL;
   --  arg-macro: function BIO_ctrl_dgram_connect (b, peer)
   --    return int)BIO_ctrl(b,BIO_CTRL_DGRAM_CONNECT,0, (char *)(peer);
   --  arg-macro: function BIO_ctrl_set_connected (b, peer)
   --    return int)BIO_ctrl(b, BIO_CTRL_DGRAM_SET_CONNECTED, 0, (char *)(peer);
   --  arg-macro: function BIO_dgram_recv_timedout (b)
   --    return int)BIO_ctrl(b, BIO_CTRL_DGRAM_GET_RECV_TIMER_EXP, 0, NULL;
   --  arg-macro: function BIO_dgram_send_timedout (b)
   --    return int)BIO_ctrl(b, BIO_CTRL_DGRAM_GET_SEND_TIMER_EXP, 0, NULL;
   --  arg-macro: function BIO_dgram_get_peer (b, peer)
   --    return int)BIO_ctrl(b, BIO_CTRL_DGRAM_GET_PEER, 0, (char *)(peer);
   --  arg-macro: function BIO_dgram_set_peer (b, peer)
   --    return int)BIO_ctrl(b, BIO_CTRL_DGRAM_SET_PEER, 0, (char *)(peer);
   --  arg-macro: function BIO_dgram_detect_peer_addr (b, peer)
   --    return int)BIO_ctrl(b, BIO_CTRL_DGRAM_DETECT_PEER_ADDR, 0, (char *)(peer);
   --  arg-macro: function BIO_dgram_get_mtu_overhead (b)
   --    return unsigned int)BIO_ctrl((b), BIO_CTRL_DGRAM_GET_MTU_OVERHEAD, 0, NULL;
   --  arg-macro: function BIO_dgram_get_local_addr_cap (b)
   --    return int)BIO_ctrl((b), BIO_CTRL_DGRAM_GET_LOCAL_ADDR_CAP, 0, NULL;
   --  arg-macro: function BIO_dgram_get_local_addr_enable (b, penable)
   --    return int)BIO_ctrl((b), BIO_CTRL_DGRAM_GET_LOCAL_ADDR_ENABLE, 0, (char *)(penable);
   --  arg-macro: function BIO_dgram_set_local_addr_enable (b, enable)
   --    return int)BIO_ctrl((b), BIO_CTRL_DGRAM_SET_LOCAL_ADDR_ENABLE, (enable), NULL;
   --  arg-macro: function BIO_dgram_get_effective_caps (b)
   --    return uint32_t)BIO_ctrl((b), BIO_CTRL_DGRAM_GET_EFFECTIVE_CAPS, 0, NULL;
   --  arg-macro: function BIO_dgram_get_caps (b)
   --    return uint32_t)BIO_ctrl((b), BIO_CTRL_DGRAM_GET_CAPS, 0, NULL;
   --  arg-macro: function BIO_dgram_set_caps (b, caps)
   --    return int)BIO_ctrl((b), BIO_CTRL_DGRAM_SET_CAPS, (long)(caps), NULL;
   --  arg-macro: function BIO_dgram_get_no_trunc (b)
   --    return unsigned int)BIO_ctrl((b), BIO_CTRL_DGRAM_GET_NO_TRUNC, 0, NULL;
   --  arg-macro: function BIO_dgram_set_no_trunc (b, enable)
   --    return int)BIO_ctrl((b), BIO_CTRL_DGRAM_SET_NO_TRUNC, (enable), NULL;
   --  arg-macro: function BIO_dgram_get_mtu (b)
   --    return unsigned int)BIO_ctrl((b), BIO_CTRL_DGRAM_GET_MTU, 0, NULL;
   --  arg-macro: function BIO_dgram_set_mtu (b, mtu)
   --    return int)BIO_ctrl((b), BIO_CTRL_DGRAM_SET_MTU, (mtu), NULL;
   --  arg-macro: procedure BIO_set_prefix (b, p)
   --    BIO_ctrl((b), BIO_CTRL_SET_PREFIX, 0, (void *)(p))
   --  arg-macro: procedure BIO_set_indent (b, i)
   --    BIO_ctrl((b), BIO_CTRL_SET_INDENT, (i), NULL)
   --  arg-macro: procedure BIO_get_indent (b)
   --    BIO_ctrl((b), BIO_CTRL_GET_INDENT, 0, NULL)
   --  arg-macro: procedure BIO_get_ex_new_index (l, p, newf, dupf, freef)
   --    CRYPTO_get_ex_new_index(CRYPTO_EX_INDEX_BIO, l, p, newf, dupf, freef)
   --  arg-macro: procedure BIO_sock_cleanup ()
   --    while(0) continue

   BIO_SOCK_REUSEADDR : constant := 16#01#;  --  /usr/include/openssl/bio.h:891
   BIO_SOCK_V6_ONLY : constant := 16#02#;  --  /usr/include/openssl/bio.h:892
   BIO_SOCK_KEEPALIVE : constant := 16#04#;  --  /usr/include/openssl/bio.h:893
   BIO_SOCK_NONBLOCK : constant := 16#08#;  --  /usr/include/openssl/bio.h:894
   BIO_SOCK_NODELAY : constant := 16#10#;  --  /usr/include/openssl/bio.h:895
   BIO_SOCK_TFO : constant := 16#20#;  --  /usr/include/openssl/bio.h:896

  -- * WARNING: do not edit!
  -- * Generated by Makefile from include/openssl/bio.h.in
  -- *
  -- * Copyright 1995-2023 The OpenSSL Project Authors. All Rights Reserved.
  -- *
  -- * Licensed under the Apache License 2.0 (the "License").  You may not use
  -- * this file except in compliance with the License.  You can obtain a copy
  -- * in the file LICENSE in the source distribution or at
  -- * https://www.openssl.org/source/license.html
  --  

  -- There are the classes of BIOs  
  -- These are the 'types' of BIOs  
  -- * BIO_FILENAME_READ|BIO_CLOSE to open or close on free.
  -- * BIO_set_fp(in,stdin,BIO_NOCLOSE);
  --  

  -- * These are used in the following macros and are passed to BIO_ctrl()
  --  

  -- dgram BIO stuff  
  -- #ifdef IP_MTU_DISCOVER  
  -- #endif  
  -- Deliberately outside of OPENSSL_NO_SCTP - used in bss_dgram.c  
  -- SCTP stuff  
  -- * internal BIO:
  -- * # define BIO_CTRL_SET_KTLS_SEND                 72
  -- * # define BIO_CTRL_SET_KTLS_SEND_CTRL_MSG        74
  -- * # define BIO_CTRL_CLEAR_KTLS_CTRL_MSG           75
  --  

  -- BIO_f_prefix controls  
  -- * internal BIO:
  -- * # define BIO_CTRL_SET_KTLS_TX_ZEROCOPY_SENDFILE 90
  --  

  -- modifiers  
  -- This #define was replaced by an internal constant and should not be used.  
  -- * This is used with memory BIOs:
  -- * BIO_FLAGS_MEM_RDONLY means we shouldn't free up or change the data in any way;
  -- * BIO_FLAGS_NONCLEAR_RST means we shouldn't clear data on reset.
  --  

  -- the BIO FLAGS values 0x1000 to 0x8000 are reserved for internal KTLS flags  
   type bio_addr_st is null record;   -- incomplete struct

   subtype BIO_ADDR is bio_addr_st;  -- /usr/include/openssl/bio.h:239

   type bio_addrinfo_st is null record;   -- incomplete struct

   subtype BIO_ADDRINFO is bio_addrinfo_st;  -- /usr/include/openssl/bio.h:240

   function BIO_get_new_index return int  -- /usr/include/openssl/bio.h:242
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_get_new_index";

   procedure BIO_set_flags (b : access openssl_types_h.bio_st; flags : int)  -- /usr/include/openssl/bio.h:243
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_set_flags";

   function BIO_test_flags (b : access constant openssl_types_h.bio_st; flags : int) return int  -- /usr/include/openssl/bio.h:244
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_test_flags";

   procedure BIO_clear_flags (b : access openssl_types_h.bio_st; flags : int)  -- /usr/include/openssl/bio.h:245
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_clear_flags";

  -- These are normally used internally in BIOs  
  -- These should be used by the application to tell why we should retry  
  -- * The next three are used in conjunction with the BIO_should_io_special()
  -- * condition.  After this returns true, BIO *BIO_get_retry_BIO(BIO *bio, int
  -- * *reason); will walk the BIO stack and return the 'reason' for the special
  -- * and the offending BIO. Given a BIO, BIO_get_retry_reason(bio) will return
  -- * the code.
  --  

  -- * Returned from the SSL bio when the certificate retrieval code had an error
  --  

  -- Returned from the connect BIO when a connect would have blocked  
  -- Returned from the accept BIO when an accept would have blocked  
  -- These are passed by the BIO callback  
  -- * The callback is called before and after the underling operation, The
  -- * BIO_CB_RETURN flag indicates if it is after the call
  --  

   type BIO_callback_fn is access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : int;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : int;
         arg5 : long;
         arg6 : long) return long
   with Convention => C;  -- /usr/include/openssl/bio.h:304

   function BIO_get_callback (b : access constant openssl_types_h.bio_st) return BIO_callback_fn  -- /usr/include/openssl/bio.h:306
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_get_callback";

   procedure BIO_set_callback (b : access openssl_types_h.bio_st; callback : BIO_callback_fn)  -- /usr/include/openssl/bio.h:307
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_set_callback";

   function BIO_debug_callback
     (the_bio : access openssl_types_h.bio_st;
      cmd : int;
      argp : Interfaces.C.Strings.chars_ptr;
      argi : int;
      argl : long;
      ret : long) return long  -- /usr/include/openssl/bio.h:308
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_debug_callback";

   type BIO_callback_fn_ex is access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : int;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : stddef_h.size_t;
         arg5 : int;
         arg6 : long;
         arg7 : int;
         arg8 : access stddef_h.size_t) return long
   with Convention => C;  -- /usr/include/openssl/bio.h:313

   function BIO_get_callback_ex (b : access constant openssl_types_h.bio_st) return BIO_callback_fn_ex  -- /usr/include/openssl/bio.h:316
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_get_callback_ex";

   procedure BIO_set_callback_ex (b : access openssl_types_h.bio_st; callback : BIO_callback_fn_ex)  -- /usr/include/openssl/bio.h:317
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_set_callback_ex";

   function BIO_debug_callback_ex
     (the_bio : access openssl_types_h.bio_st;
      oper : int;
      argp : Interfaces.C.Strings.chars_ptr;
      len : stddef_h.size_t;
      argi : int;
      argl : long;
      ret : int;
      processed : access stddef_h.size_t) return long  -- /usr/include/openssl/bio.h:318
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_debug_callback_ex";

   function BIO_get_callback_arg (b : access constant openssl_types_h.bio_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/bio.h:321
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_get_callback_arg";

   procedure BIO_set_callback_arg (b : access openssl_types_h.bio_st; arg : Interfaces.C.Strings.chars_ptr)  -- /usr/include/openssl/bio.h:322
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_set_callback_arg";

   type bio_method_st is null record;   -- incomplete struct

   subtype BIO_METHOD is bio_method_st;  -- /usr/include/openssl/bio.h:324

   function BIO_method_name (b : access constant openssl_types_h.bio_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/bio.h:326
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_method_name";

   function BIO_method_type (b : access constant openssl_types_h.bio_st) return int  -- /usr/include/openssl/bio.h:327
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_method_type";

   --  skipped function type BIO_info_cb

  -- backward compatibility  
   --  skipped function type bio_info_cb

   type stack_st_BIO is null record;   -- incomplete struct

   type sk_BIO_compfunc is access function (arg1 : System.Address; arg2 : System.Address) return int
   with Convention => C;  -- /usr/include/openssl/bio.h:332

   type sk_BIO_freefunc is access procedure (arg1 : access openssl_types_h.bio_st)
   with Convention => C;  -- /usr/include/openssl/bio.h:332

   type sk_BIO_copyfunc is access function (arg1 : access constant openssl_types_h.bio_st) return access openssl_types_h.bio_st
   with Convention => C;  -- /usr/include/openssl/bio.h:332

   function ossl_check_BIO_type (ptr : access openssl_types_h.bio_st) return access openssl_types_h.bio_st  -- /usr/include/openssl/bio.h:332
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_BIO_type";

   function ossl_check_const_BIO_sk_type (sk : access constant stack_st_BIO) return access constant openssl_stack_h.stack_st  -- /usr/include/openssl/bio.h:332
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_const_BIO_sk_type";

   function ossl_check_BIO_sk_type (sk : access stack_st_BIO) return access openssl_stack_h.stack_st  -- /usr/include/openssl/bio.h:332
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_BIO_sk_type";

   function ossl_check_BIO_compfunc_type (cmp : sk_BIO_compfunc) return openssl_stack_h.OPENSSL_sk_compfunc  -- /usr/include/openssl/bio.h:332
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_BIO_compfunc_type";

   function ossl_check_BIO_copyfunc_type (cpy : sk_BIO_copyfunc) return openssl_stack_h.OPENSSL_sk_copyfunc  -- /usr/include/openssl/bio.h:332
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_BIO_copyfunc_type";

   function ossl_check_BIO_freefunc_type (fr : sk_BIO_freefunc) return openssl_stack_h.OPENSSL_sk_freefunc  -- /usr/include/openssl/bio.h:332
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_BIO_freefunc_type";

  -- Prefix and suffix callback in ASN1 BIO  
   --  skipped function type asn1_ps_func

   type BIO_dgram_sctp_notification_handler_fn is access procedure
        (arg1 : access openssl_types_h.bio_st;
         arg2 : System.Address;
         arg3 : System.Address)
   with Convention => C;  -- /usr/include/openssl/bio.h:365

  -- SCTP parameter structs  
  -- BIO_sendmmsg/BIO_recvmmsg-related definitions  
   type bio_msg_st is record
      data : System.Address;  -- /usr/include/openssl/bio.h:395
      data_len : aliased stddef_h.size_t;  -- /usr/include/openssl/bio.h:396
      peer : access BIO_ADDR;  -- /usr/include/openssl/bio.h:397
      local : access BIO_ADDR;  -- /usr/include/openssl/bio.h:397
      flags : aliased bits_stdint_uintn_h.uint64_t;  -- /usr/include/openssl/bio.h:398
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/openssl/bio.h:394

   subtype BIO_MSG is bio_msg_st;  -- /usr/include/openssl/bio.h:399

   type bio_mmsg_cb_args_st is record
      msg : access BIO_MSG;  -- /usr/include/openssl/bio.h:402
      stride : aliased stddef_h.size_t;  -- /usr/include/openssl/bio.h:403
      num_msg : aliased stddef_h.size_t;  -- /usr/include/openssl/bio.h:403
      flags : aliased bits_stdint_uintn_h.uint64_t;  -- /usr/include/openssl/bio.h:404
      msgs_processed : access stddef_h.size_t;  -- /usr/include/openssl/bio.h:405
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/openssl/bio.h:401

   subtype BIO_MMSG_CB_ARGS is bio_mmsg_cb_args_st;  -- /usr/include/openssl/bio.h:406

   type anon_union3713 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            fd : aliased int;  -- /usr/include/openssl/bio.h:415
         when 1 =>
            custom : System.Address;  -- /usr/include/openssl/bio.h:416
         when others =>
            custom_ui : aliased stdint_h.uintptr_t;  -- /usr/include/openssl/bio.h:417
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type bio_poll_descriptor_st is record
      c_type : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/openssl/bio.h:413
      value : aliased anon_union3713;  -- /usr/include/openssl/bio.h:418
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/openssl/bio.h:412

   subtype BIO_POLL_DESCRIPTOR is bio_poll_descriptor_st;  -- /usr/include/openssl/bio.h:419

  -- * #define BIO_CONN_get_param_hostname BIO_ctrl
  --  

  -- # define BIO_C_SET_PROXY_PARAM                   103  
  -- # define BIO_C_GET_PROXY_PARAM                   121  
  -- IP families we support, for BIO_s_connect() and BIO_s_accept()  
  -- Note: the underlying operating system may not support some of them  
  -- BIO_s_connect()  
  -- BIO_s_accept()  
  -- #define BIO_set_nbio(b,n)    BIO_ctrl(b,BIO_C_SET_NBIO,(n),NULL)  
  -- Aliases kept for backward compatibility  
  -- BIO_s_datagram(), BIO_s_fd(), BIO_s_socket(), BIO_s_accept() and BIO_s_connect()  
  -- BIO_s_file()  
  -- BIO_s_fd() and BIO_s_file()  
  -- * name is cast to lose const, but might be better to route through a
  -- * function so we can do it safely
  --  

  -- * If you are wondering why this isn't defined, its because CONST_STRICT is
  -- * purely a compile-time kludge to allow const to be checked.
  --  

  -- * WARNING WARNING, this ups the reference count on the read bio of the SSL
  -- * structure.  This is because the ssl read BIO is now pointed to by the
  -- * next_bio field in the bio.  So when you free the BIO, make sure you are
  -- * doing a BIO_free_all() to catch the underlying BIO.
  --  

  -- defined in evp.h  
  -- #define BIO_set_md(b,md)     BIO_ctrl(b,BIO_C_SET_MD,1,(char *)(md))  
  -- For the BIO_f_buffer() type  
  -- Don't use the next one unless you know what you are doing :-)  
  -- ...pending macros have inappropriate return type  
   function BIO_ctrl_pending (b : access openssl_types_h.bio_st) return stddef_h.size_t  -- /usr/include/openssl/bio.h:630
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ctrl_pending";

   function BIO_ctrl_wpending (b : access openssl_types_h.bio_st) return stddef_h.size_t  -- /usr/include/openssl/bio.h:631
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ctrl_wpending";

  -- For the BIO_f_buffer() type  
  -- For BIO_s_bio()  
  -- macros with inappropriate type -- but ...pending macros use int too:  
   function BIO_ctrl_get_write_guarantee (b : access openssl_types_h.bio_st) return stddef_h.size_t  -- /usr/include/openssl/bio.h:650
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ctrl_get_write_guarantee";

   function BIO_ctrl_get_read_request (b : access openssl_types_h.bio_st) return stddef_h.size_t  -- /usr/include/openssl/bio.h:651
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ctrl_get_read_request";

   function BIO_ctrl_reset_read_request (b : access openssl_types_h.bio_st) return int  -- /usr/include/openssl/bio.h:652
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ctrl_reset_read_request";

  -- ctrl macros for dgram  
  -- ctrl macros for BIO_f_prefix  
   function BIO_set_ex_data
     (the_bio : access openssl_types_h.bio_st;
      idx : int;
      data : System.Address) return int  -- /usr/include/openssl/bio.h:699
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_set_ex_data";

   function BIO_get_ex_data (the_bio : access constant openssl_types_h.bio_st; idx : int) return System.Address  -- /usr/include/openssl/bio.h:700
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_get_ex_data";

   function BIO_number_read (the_bio : access openssl_types_h.bio_st) return bits_stdint_uintn_h.uint64_t  -- /usr/include/openssl/bio.h:701
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_number_read";

   function BIO_number_written (the_bio : access openssl_types_h.bio_st) return bits_stdint_uintn_h.uint64_t  -- /usr/include/openssl/bio.h:702
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_number_written";

  -- For BIO_f_asn1()  
   function BIO_asn1_set_prefix
     (b : access openssl_types_h.bio_st;
      prefix : access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : System.Address;
         arg3 : access int;
         arg4 : System.Address) return int;
      prefix_free : access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : System.Address;
         arg3 : access int;
         arg4 : System.Address) return int) return int  -- /usr/include/openssl/bio.h:705
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_asn1_set_prefix";

   function BIO_asn1_get_prefix
     (b : access openssl_types_h.bio_st;
      pprefix : System.Address;
      pprefix_free : System.Address) return int  -- /usr/include/openssl/bio.h:707
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_asn1_get_prefix";

   function BIO_asn1_set_suffix
     (b : access openssl_types_h.bio_st;
      suffix : access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : System.Address;
         arg3 : access int;
         arg4 : System.Address) return int;
      suffix_free : access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : System.Address;
         arg3 : access int;
         arg4 : System.Address) return int) return int  -- /usr/include/openssl/bio.h:709
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_asn1_set_suffix";

   function BIO_asn1_get_suffix
     (b : access openssl_types_h.bio_st;
      psuffix : System.Address;
      psuffix_free : System.Address) return int  -- /usr/include/openssl/bio.h:711
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_asn1_get_suffix";

   function BIO_s_file return access constant BIO_METHOD  -- /usr/include/openssl/bio.h:714
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_s_file";

   function BIO_new_file (filename : Interfaces.C.Strings.chars_ptr; mode : Interfaces.C.Strings.chars_ptr) return access openssl_types_h.bio_st  -- /usr/include/openssl/bio.h:715
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_new_file";

   function BIO_new_from_core_bio (libctx : access openssl_types_h.ossl_lib_ctx_st; corebio : access openssl_core_h.ossl_core_bio_st) return access openssl_types_h.bio_st  -- /usr/include/openssl/bio.h:716
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_new_from_core_bio";

   function BIO_new_fp (stream : access bits_types_struct_FILE_h.u_IO_FILE; close_flag : int) return access openssl_types_h.bio_st  -- /usr/include/openssl/bio.h:718
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_new_fp";

   function BIO_new_ex (libctx : access openssl_types_h.ossl_lib_ctx_st; method : access constant BIO_METHOD) return access openssl_types_h.bio_st  -- /usr/include/openssl/bio.h:720
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_new_ex";

   function BIO_new (c_type : access constant BIO_METHOD) return access openssl_types_h.bio_st  -- /usr/include/openssl/bio.h:721
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_new";

   function BIO_free (a : access openssl_types_h.bio_st) return int  -- /usr/include/openssl/bio.h:722
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_free";

   procedure BIO_set_data (a : access openssl_types_h.bio_st; ptr : System.Address)  -- /usr/include/openssl/bio.h:723
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_set_data";

   function BIO_get_data (a : access openssl_types_h.bio_st) return System.Address  -- /usr/include/openssl/bio.h:724
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_get_data";

   procedure BIO_set_init (a : access openssl_types_h.bio_st; init : int)  -- /usr/include/openssl/bio.h:725
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_set_init";

   function BIO_get_init (a : access openssl_types_h.bio_st) return int  -- /usr/include/openssl/bio.h:726
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_get_init";

   procedure BIO_set_shutdown (a : access openssl_types_h.bio_st; shut : int)  -- /usr/include/openssl/bio.h:727
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_set_shutdown";

   function BIO_get_shutdown (a : access openssl_types_h.bio_st) return int  -- /usr/include/openssl/bio.h:728
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_get_shutdown";

   procedure BIO_vfree (a : access openssl_types_h.bio_st)  -- /usr/include/openssl/bio.h:729
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_vfree";

   function BIO_up_ref (a : access openssl_types_h.bio_st) return int  -- /usr/include/openssl/bio.h:730
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_up_ref";

   function BIO_read
     (b : access openssl_types_h.bio_st;
      data : System.Address;
      dlen : int) return int  -- /usr/include/openssl/bio.h:731
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_read";

   function BIO_read_ex
     (b : access openssl_types_h.bio_st;
      data : System.Address;
      dlen : stddef_h.size_t;
      readbytes : access stddef_h.size_t) return int  -- /usr/include/openssl/bio.h:732
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_read_ex";

   function BIO_recvmmsg
     (b : access openssl_types_h.bio_st;
      msg : access BIO_MSG;
      stride : stddef_h.size_t;
      num_msg : stddef_h.size_t;
      flags : bits_stdint_uintn_h.uint64_t;
      msgs_processed : access stddef_h.size_t) return int  -- /usr/include/openssl/bio.h:733
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_recvmmsg";

   function BIO_gets
     (bp : access openssl_types_h.bio_st;
      buf : Interfaces.C.Strings.chars_ptr;
      size : int) return int  -- /usr/include/openssl/bio.h:736
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_gets";

   function BIO_get_line
     (the_bio : access openssl_types_h.bio_st;
      buf : Interfaces.C.Strings.chars_ptr;
      size : int) return int  -- /usr/include/openssl/bio.h:737
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_get_line";

   function BIO_write
     (b : access openssl_types_h.bio_st;
      data : System.Address;
      dlen : int) return int  -- /usr/include/openssl/bio.h:738
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_write";

   function BIO_write_ex
     (b : access openssl_types_h.bio_st;
      data : System.Address;
      dlen : stddef_h.size_t;
      written : access stddef_h.size_t) return int  -- /usr/include/openssl/bio.h:739
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_write_ex";

   function BIO_sendmmsg
     (b : access openssl_types_h.bio_st;
      msg : access BIO_MSG;
      stride : stddef_h.size_t;
      num_msg : stddef_h.size_t;
      flags : bits_stdint_uintn_h.uint64_t;
      msgs_processed : access stddef_h.size_t) return int  -- /usr/include/openssl/bio.h:740
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_sendmmsg";

   function BIO_get_rpoll_descriptor (b : access openssl_types_h.bio_st; desc : access BIO_POLL_DESCRIPTOR) return int  -- /usr/include/openssl/bio.h:743
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_get_rpoll_descriptor";

   function BIO_get_wpoll_descriptor (b : access openssl_types_h.bio_st; desc : access BIO_POLL_DESCRIPTOR) return int  -- /usr/include/openssl/bio.h:744
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_get_wpoll_descriptor";

   function BIO_puts (bp : access openssl_types_h.bio_st; buf : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/bio.h:745
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_puts";

   function BIO_indent
     (b : access openssl_types_h.bio_st;
      indent : int;
      max : int) return int  -- /usr/include/openssl/bio.h:746
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_indent";

   function BIO_ctrl
     (bp : access openssl_types_h.bio_st;
      cmd : int;
      larg : long;
      parg : System.Address) return long  -- /usr/include/openssl/bio.h:747
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ctrl";

   function BIO_callback_ctrl
     (b : access openssl_types_h.bio_st;
      cmd : int;
      fp : access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : int;
         arg3 : int) return int) return long  -- /usr/include/openssl/bio.h:748
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_callback_ctrl";

   function BIO_ptr_ctrl
     (bp : access openssl_types_h.bio_st;
      cmd : int;
      larg : long) return System.Address  -- /usr/include/openssl/bio.h:749
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ptr_ctrl";

   function BIO_int_ctrl
     (bp : access openssl_types_h.bio_st;
      cmd : int;
      larg : long;
      iarg : int) return long  -- /usr/include/openssl/bio.h:750
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_int_ctrl";

   function BIO_push (b : access openssl_types_h.bio_st; append : access openssl_types_h.bio_st) return access openssl_types_h.bio_st  -- /usr/include/openssl/bio.h:751
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_push";

   function BIO_pop (b : access openssl_types_h.bio_st) return access openssl_types_h.bio_st  -- /usr/include/openssl/bio.h:752
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_pop";

   procedure BIO_free_all (a : access openssl_types_h.bio_st)  -- /usr/include/openssl/bio.h:753
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_free_all";

   function BIO_find_type (b : access openssl_types_h.bio_st; bio_type : int) return access openssl_types_h.bio_st  -- /usr/include/openssl/bio.h:754
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_find_type";

   function BIO_next (b : access openssl_types_h.bio_st) return access openssl_types_h.bio_st  -- /usr/include/openssl/bio.h:755
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_next";

   procedure BIO_set_next (b : access openssl_types_h.bio_st; next : access openssl_types_h.bio_st)  -- /usr/include/openssl/bio.h:756
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_set_next";

   function BIO_get_retry_BIO (the_bio : access openssl_types_h.bio_st; reason : access int) return access openssl_types_h.bio_st  -- /usr/include/openssl/bio.h:757
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_get_retry_BIO";

   function BIO_get_retry_reason (the_bio : access openssl_types_h.bio_st) return int  -- /usr/include/openssl/bio.h:758
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_get_retry_reason";

   procedure BIO_set_retry_reason (the_bio : access openssl_types_h.bio_st; reason : int)  -- /usr/include/openssl/bio.h:759
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_set_retry_reason";

   function BIO_dup_chain (c_in : access openssl_types_h.bio_st) return access openssl_types_h.bio_st  -- /usr/include/openssl/bio.h:760
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_dup_chain";

   function BIO_nread0 (the_bio : access openssl_types_h.bio_st; buf : System.Address) return int  -- /usr/include/openssl/bio.h:762
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_nread0";

   function BIO_nread
     (the_bio : access openssl_types_h.bio_st;
      buf : System.Address;
      num : int) return int  -- /usr/include/openssl/bio.h:763
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_nread";

   function BIO_nwrite0 (the_bio : access openssl_types_h.bio_st; buf : System.Address) return int  -- /usr/include/openssl/bio.h:764
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_nwrite0";

   function BIO_nwrite
     (the_bio : access openssl_types_h.bio_st;
      buf : System.Address;
      num : int) return int  -- /usr/include/openssl/bio.h:765
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_nwrite";

   function BIO_s_mem return access constant BIO_METHOD  -- /usr/include/openssl/bio.h:767
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_s_mem";

   function BIO_s_dgram_mem return access constant BIO_METHOD  -- /usr/include/openssl/bio.h:769
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_s_dgram_mem";

   function BIO_s_secmem return access constant BIO_METHOD  -- /usr/include/openssl/bio.h:771
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_s_secmem";

   function BIO_new_mem_buf (buf : System.Address; len : int) return access openssl_types_h.bio_st  -- /usr/include/openssl/bio.h:772
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_new_mem_buf";

   function BIO_s_socket return access constant BIO_METHOD  -- /usr/include/openssl/bio.h:774
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_s_socket";

   function BIO_s_connect return access constant BIO_METHOD  -- /usr/include/openssl/bio.h:775
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_s_connect";

   function BIO_s_accept return access constant BIO_METHOD  -- /usr/include/openssl/bio.h:776
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_s_accept";

   function BIO_s_fd return access constant BIO_METHOD  -- /usr/include/openssl/bio.h:778
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_s_fd";

   function BIO_s_log return access constant BIO_METHOD  -- /usr/include/openssl/bio.h:779
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_s_log";

   function BIO_s_bio return access constant BIO_METHOD  -- /usr/include/openssl/bio.h:780
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_s_bio";

   function BIO_s_null return access constant BIO_METHOD  -- /usr/include/openssl/bio.h:781
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_s_null";

   function BIO_f_null return access constant BIO_METHOD  -- /usr/include/openssl/bio.h:782
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_f_null";

   function BIO_f_buffer return access constant BIO_METHOD  -- /usr/include/openssl/bio.h:783
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_f_buffer";

   function BIO_f_readbuffer return access constant BIO_METHOD  -- /usr/include/openssl/bio.h:784
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_f_readbuffer";

   function BIO_f_linebuffer return access constant BIO_METHOD  -- /usr/include/openssl/bio.h:785
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_f_linebuffer";

   function BIO_f_nbio_test return access constant BIO_METHOD  -- /usr/include/openssl/bio.h:786
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_f_nbio_test";

   function BIO_f_prefix return access constant BIO_METHOD  -- /usr/include/openssl/bio.h:787
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_f_prefix";

   function BIO_s_core return access constant BIO_METHOD  -- /usr/include/openssl/bio.h:788
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_s_core";

   function BIO_s_dgram_pair return access constant BIO_METHOD  -- /usr/include/openssl/bio.h:790
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_s_dgram_pair";

   function BIO_s_datagram return access constant BIO_METHOD  -- /usr/include/openssl/bio.h:791
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_s_datagram";

   function BIO_dgram_non_fatal_error (error : int) return int  -- /usr/include/openssl/bio.h:792
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_dgram_non_fatal_error";

   function BIO_new_dgram (fd : int; close_flag : int) return access openssl_types_h.bio_st  -- /usr/include/openssl/bio.h:793
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_new_dgram";

   function BIO_sock_should_retry (i : int) return int  -- /usr/include/openssl/bio.h:807
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_sock_should_retry";

   function BIO_sock_non_fatal_error (error : int) return int  -- /usr/include/openssl/bio.h:808
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_sock_non_fatal_error";

   function BIO_err_is_non_fatal (errcode : unsigned) return int  -- /usr/include/openssl/bio.h:809
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_err_is_non_fatal";

   function BIO_socket_wait
     (fd : int;
      for_read : int;
      max_time : bits_types_time_t_h.time_t) return int  -- /usr/include/openssl/bio.h:810
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_socket_wait";

   function BIO_wait
     (the_bio : access openssl_types_h.bio_st;
      max_time : bits_types_time_t_h.time_t;
      nap_milliseconds : unsigned) return int  -- /usr/include/openssl/bio.h:812
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_wait";

   function BIO_do_connect_retry
     (the_bio : access openssl_types_h.bio_st;
      timeout : int;
      nap_milliseconds : int) return int  -- /usr/include/openssl/bio.h:813
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_do_connect_retry";

   function BIO_fd_should_retry (i : int) return int  -- /usr/include/openssl/bio.h:815
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_fd_should_retry";

   function BIO_fd_non_fatal_error (error : int) return int  -- /usr/include/openssl/bio.h:816
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_fd_non_fatal_error";

   function BIO_dump_cb
     (cb : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      u : System.Address;
      s : System.Address;
      len : int) return int  -- /usr/include/openssl/bio.h:817
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_dump_cb";

   function BIO_dump_indent_cb
     (cb : access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : System.Address) return int;
      u : System.Address;
      s : System.Address;
      len : int;
      indent : int) return int  -- /usr/include/openssl/bio.h:819
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_dump_indent_cb";

   function BIO_dump
     (b : access openssl_types_h.bio_st;
      bytes : System.Address;
      len : int) return int  -- /usr/include/openssl/bio.h:821
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_dump";

   function BIO_dump_indent
     (b : access openssl_types_h.bio_st;
      bytes : System.Address;
      len : int;
      indent : int) return int  -- /usr/include/openssl/bio.h:822
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_dump_indent";

   function BIO_dump_fp
     (fp : access bits_types_struct_FILE_h.u_IO_FILE;
      s : System.Address;
      len : int) return int  -- /usr/include/openssl/bio.h:824
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_dump_fp";

   function BIO_dump_indent_fp
     (fp : access bits_types_struct_FILE_h.u_IO_FILE;
      s : System.Address;
      len : int;
      indent : int) return int  -- /usr/include/openssl/bio.h:825
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_dump_indent_fp";

   function BIO_hex_string
     (c_out : access openssl_types_h.bio_st;
      indent : int;
      width : int;
      data : System.Address;
      datalen : int) return int  -- /usr/include/openssl/bio.h:827
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_hex_string";

   function BIO_ADDR_new return access BIO_ADDR  -- /usr/include/openssl/bio.h:831
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ADDR_new";

   function BIO_ADDR_copy (dst : access BIO_ADDR; src : access constant BIO_ADDR) return int  -- /usr/include/openssl/bio.h:832
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ADDR_copy";

   function BIO_ADDR_dup (ap : access constant BIO_ADDR) return access BIO_ADDR  -- /usr/include/openssl/bio.h:833
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ADDR_dup";

   function BIO_ADDR_rawmake
     (ap : access BIO_ADDR;
      family : int;
      where : System.Address;
      wherelen : stddef_h.size_t;
      port : unsigned_short) return int  -- /usr/include/openssl/bio.h:834
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ADDR_rawmake";

   procedure BIO_ADDR_free (arg1 : access BIO_ADDR)  -- /usr/include/openssl/bio.h:836
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ADDR_free";

   procedure BIO_ADDR_clear (ap : access BIO_ADDR)  -- /usr/include/openssl/bio.h:837
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ADDR_clear";

   function BIO_ADDR_family (ap : access constant BIO_ADDR) return int  -- /usr/include/openssl/bio.h:838
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ADDR_family";

   function BIO_ADDR_rawaddress
     (ap : access constant BIO_ADDR;
      p : System.Address;
      l : access stddef_h.size_t) return int  -- /usr/include/openssl/bio.h:839
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ADDR_rawaddress";

   function BIO_ADDR_rawport (ap : access constant BIO_ADDR) return unsigned_short  -- /usr/include/openssl/bio.h:840
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ADDR_rawport";

   function BIO_ADDR_hostname_string (ap : access constant BIO_ADDR; numeric : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/bio.h:841
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ADDR_hostname_string";

   function BIO_ADDR_service_string (ap : access constant BIO_ADDR; numeric : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/bio.h:842
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ADDR_service_string";

   function BIO_ADDR_path_string (ap : access constant BIO_ADDR) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/bio.h:843
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ADDR_path_string";

   function BIO_ADDRINFO_next (bai : access constant BIO_ADDRINFO) return access constant BIO_ADDRINFO  -- /usr/include/openssl/bio.h:845
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ADDRINFO_next";

   function BIO_ADDRINFO_family (bai : access constant BIO_ADDRINFO) return int  -- /usr/include/openssl/bio.h:846
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ADDRINFO_family";

   function BIO_ADDRINFO_socktype (bai : access constant BIO_ADDRINFO) return int  -- /usr/include/openssl/bio.h:847
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ADDRINFO_socktype";

   function BIO_ADDRINFO_protocol (bai : access constant BIO_ADDRINFO) return int  -- /usr/include/openssl/bio.h:848
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ADDRINFO_protocol";

   function BIO_ADDRINFO_address (bai : access constant BIO_ADDRINFO) return access constant BIO_ADDR  -- /usr/include/openssl/bio.h:849
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ADDRINFO_address";

   procedure BIO_ADDRINFO_free (bai : access BIO_ADDRINFO)  -- /usr/include/openssl/bio.h:850
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_ADDRINFO_free";

   type BIO_hostserv_priorities is 
     (BIO_PARSE_PRIO_HOST,
      BIO_PARSE_PRIO_SERV)
   with Convention => C;  -- /usr/include/openssl/bio.h:852

   function BIO_parse_hostserv
     (hostserv : Interfaces.C.Strings.chars_ptr;
      host : System.Address;
      service : System.Address;
      hostserv_prio : BIO_hostserv_priorities) return int  -- /usr/include/openssl/bio.h:855
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_parse_hostserv";

   type BIO_lookup_type is 
     (BIO_LOOKUP_CLIENT,
      BIO_LOOKUP_SERVER)
   with Convention => C;  -- /usr/include/openssl/bio.h:857

   function BIO_lookup
     (host : Interfaces.C.Strings.chars_ptr;
      service : Interfaces.C.Strings.chars_ptr;
      lookup_type : BIO_lookup_type;
      family : int;
      socktype : int;
      res : System.Address) return int  -- /usr/include/openssl/bio.h:860
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_lookup";

   function BIO_lookup_ex
     (host : Interfaces.C.Strings.chars_ptr;
      service : Interfaces.C.Strings.chars_ptr;
      lookup_type : int;
      family : int;
      socktype : int;
      protocol : int;
      res : System.Address) return int  -- /usr/include/openssl/bio.h:863
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_lookup_ex";

   function BIO_sock_error (sock : int) return int  -- /usr/include/openssl/bio.h:866
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_sock_error";

   function BIO_socket_ioctl
     (fd : int;
      c_type : long;
      arg : System.Address) return int  -- /usr/include/openssl/bio.h:867
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_socket_ioctl";

   function BIO_socket_nbio (fd : int; mode : int) return int  -- /usr/include/openssl/bio.h:868
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_socket_nbio";

   function BIO_sock_init return int  -- /usr/include/openssl/bio.h:869
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_sock_init";

   function BIO_set_tcp_ndelay (sock : int; turn_on : int) return int  -- /usr/include/openssl/bio.h:873
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_set_tcp_ndelay";

   type hostent is null record;   -- incomplete struct

   function BIO_gethostbyname (name : Interfaces.C.Strings.chars_ptr) return access hostent  -- /usr/include/openssl/bio.h:875
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_gethostbyname";

   function BIO_get_port (str : Interfaces.C.Strings.chars_ptr; port_ptr : access unsigned_short) return int  -- /usr/include/openssl/bio.h:876
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_get_port";

   function BIO_get_host_ip (str : Interfaces.C.Strings.chars_ptr; ip : access unsigned_char) return int  -- /usr/include/openssl/bio.h:877
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_get_host_ip";

   function BIO_get_accept_socket (host_port : Interfaces.C.Strings.chars_ptr; mode : int) return int  -- /usr/include/openssl/bio.h:878
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_get_accept_socket";

   function BIO_accept (sock : int; ip_port : System.Address) return int  -- /usr/include/openssl/bio.h:879
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_accept";

   type BIO_sock_info_u (discr : unsigned := 0) is record
      case discr is
         when others =>
            addr : access BIO_ADDR;  -- /usr/include/openssl/bio.h:883
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- /usr/include/openssl/bio.h:882

   type BIO_sock_info_type is 
     (BIO_SOCK_INFO_ADDRESS)
   with Convention => C;  -- /usr/include/openssl/bio.h:885

   function BIO_sock_info
     (sock : int;
      c_type : BIO_sock_info_type;
      info : access BIO_sock_info_u) return int  -- /usr/include/openssl/bio.h:888
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_sock_info";

   function BIO_socket
     (domain : int;
      socktype : int;
      protocol : int;
      options : int) return int  -- /usr/include/openssl/bio.h:898
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_socket";

   function BIO_connect
     (sock : int;
      addr : access constant BIO_ADDR;
      options : int) return int  -- /usr/include/openssl/bio.h:899
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_connect";

   function BIO_bind
     (sock : int;
      addr : access constant BIO_ADDR;
      options : int) return int  -- /usr/include/openssl/bio.h:900
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_bind";

   function BIO_listen
     (sock : int;
      addr : access constant BIO_ADDR;
      options : int) return int  -- /usr/include/openssl/bio.h:901
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_listen";

   function BIO_accept_ex
     (accept_sock : int;
      addr : access BIO_ADDR;
      options : int) return int  -- /usr/include/openssl/bio.h:902
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_accept_ex";

   function BIO_closesocket (sock : int) return int  -- /usr/include/openssl/bio.h:903
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_closesocket";

   function BIO_new_socket (sock : int; close_flag : int) return access openssl_types_h.bio_st  -- /usr/include/openssl/bio.h:905
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_new_socket";

   function BIO_new_connect (host_port : Interfaces.C.Strings.chars_ptr) return access openssl_types_h.bio_st  -- /usr/include/openssl/bio.h:906
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_new_connect";

   function BIO_new_accept (host_port : Interfaces.C.Strings.chars_ptr) return access openssl_types_h.bio_st  -- /usr/include/openssl/bio.h:907
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_new_accept";

   function BIO_new_fd (fd : int; close_flag : int) return access openssl_types_h.bio_st  -- /usr/include/openssl/bio.h:910
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_new_fd";

   function BIO_new_bio_pair
     (bio1 : System.Address;
      writebuf1 : stddef_h.size_t;
      bio2 : System.Address;
      writebuf2 : stddef_h.size_t) return int  -- /usr/include/openssl/bio.h:912
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_new_bio_pair";

   function BIO_new_bio_dgram_pair
     (bio1 : System.Address;
      writebuf1 : stddef_h.size_t;
      bio2 : System.Address;
      writebuf2 : stddef_h.size_t) return int  -- /usr/include/openssl/bio.h:915
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_new_bio_dgram_pair";

  -- * If successful, returns 1 and in *bio1, *bio2 two BIO pair endpoints.
  -- * Otherwise returns 0 and sets *bio1 and *bio2 to NULL. Size 0 uses default
  -- * value.
  --  

   procedure BIO_copy_next_retry (b : access openssl_types_h.bio_st)  -- /usr/include/openssl/bio.h:925
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_copy_next_retry";

  -- * long BIO_ghbn_ctrl(int cmd,int iarg,char *parg);
  --  

  --     * Because we support the 'z' modifier, which made its appearance in C99,
  --     * we can't use __attribute__ with pre C99 dialects.
  --      

   function BIO_printf (the_bio : access openssl_types_h.bio_st; format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- /usr/include/openssl/bio.h:949
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_printf";

   function BIO_vprintf
     (the_bio : access openssl_types_h.bio_st;
      format : Interfaces.C.Strings.chars_ptr;
      args : access System.Address) return int  -- /usr/include/openssl/bio.h:951
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_vprintf";

   function BIO_snprintf
     (buf : Interfaces.C.Strings.chars_ptr;
      n : stddef_h.size_t;
      format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- /usr/include/openssl/bio.h:953
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_snprintf";

   function BIO_vsnprintf
     (buf : Interfaces.C.Strings.chars_ptr;
      n : stddef_h.size_t;
      format : Interfaces.C.Strings.chars_ptr;
      args : access System.Address) return int  -- /usr/include/openssl/bio.h:955
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_vsnprintf";

   function BIO_meth_new (c_type : int; name : Interfaces.C.Strings.chars_ptr) return access BIO_METHOD  -- /usr/include/openssl/bio.h:961
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_new";

   procedure BIO_meth_free (biom : access BIO_METHOD)  -- /usr/include/openssl/bio.h:962
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_free";

   function BIO_meth_get_write (biom : access constant BIO_METHOD) return access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int) return int  -- /usr/include/openssl/bio.h:963
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_get_write";

   function BIO_meth_get_write_ex (biom : access constant BIO_METHOD) return access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : stddef_h.size_t;
         arg4 : access stddef_h.size_t) return int  -- /usr/include/openssl/bio.h:964
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_get_write_ex";

   function BIO_meth_set_write (biom : access BIO_METHOD; write : access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int) return int) return int  -- /usr/include/openssl/bio.h:966
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_set_write";

   function BIO_meth_set_write_ex (biom : access BIO_METHOD; bwrite : access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : stddef_h.size_t;
         arg4 : access stddef_h.size_t) return int) return int  -- /usr/include/openssl/bio.h:968
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_set_write_ex";

   function BIO_meth_set_sendmmsg (biom : access BIO_METHOD; f : access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : access BIO_MSG;
         arg3 : stddef_h.size_t;
         arg4 : stddef_h.size_t;
         arg5 : bits_stdint_uintn_h.uint64_t;
         arg6 : access stddef_h.size_t) return int) return int  -- /usr/include/openssl/bio.h:970
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_set_sendmmsg";

   function BIO_meth_get_sendmmsg (biom : access constant BIO_METHOD) return access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : access BIO_MSG;
         arg3 : stddef_h.size_t;
         arg4 : stddef_h.size_t;
         arg5 : bits_stdint_uintn_h.uint64_t;
         arg6 : access stddef_h.size_t) return int  -- /usr/include/openssl/bio.h:973
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_get_sendmmsg";

   function BIO_meth_get_read (biom : access constant BIO_METHOD) return access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int) return int  -- /usr/include/openssl/bio.h:976
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_get_read";

   function BIO_meth_get_read_ex (biom : access constant BIO_METHOD) return access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : stddef_h.size_t;
         arg4 : access stddef_h.size_t) return int  -- /usr/include/openssl/bio.h:977
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_get_read_ex";

   function BIO_meth_set_read (biom : access BIO_METHOD; read : access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int) return int) return int  -- /usr/include/openssl/bio.h:978
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_set_read";

   function BIO_meth_set_read_ex (biom : access BIO_METHOD; bread : access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : stddef_h.size_t;
         arg4 : access stddef_h.size_t) return int) return int  -- /usr/include/openssl/bio.h:980
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_set_read_ex";

   function BIO_meth_set_recvmmsg (biom : access BIO_METHOD; f : access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : access BIO_MSG;
         arg3 : stddef_h.size_t;
         arg4 : stddef_h.size_t;
         arg5 : bits_stdint_uintn_h.uint64_t;
         arg6 : access stddef_h.size_t) return int) return int  -- /usr/include/openssl/bio.h:982
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_set_recvmmsg";

   function BIO_meth_get_recvmmsg (biom : access constant BIO_METHOD) return access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : access BIO_MSG;
         arg3 : stddef_h.size_t;
         arg4 : stddef_h.size_t;
         arg5 : bits_stdint_uintn_h.uint64_t;
         arg6 : access stddef_h.size_t) return int  -- /usr/include/openssl/bio.h:985
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_get_recvmmsg";

   function BIO_meth_get_puts (biom : access constant BIO_METHOD) return access function (arg1 : access openssl_types_h.bio_st; arg2 : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/bio.h:988
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_get_puts";

   function BIO_meth_set_puts (biom : access BIO_METHOD; puts : access function (arg1 : access openssl_types_h.bio_st; arg2 : Interfaces.C.Strings.chars_ptr) return int) return int  -- /usr/include/openssl/bio.h:989
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_set_puts";

   function BIO_meth_get_gets (biom : access constant BIO_METHOD) return access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int) return int  -- /usr/include/openssl/bio.h:991
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_get_gets";

   function BIO_meth_set_gets (biom : access BIO_METHOD; ossl_gets : access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int) return int) return int  -- /usr/include/openssl/bio.h:992
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_set_gets";

   function BIO_meth_get_ctrl (biom : access constant BIO_METHOD) return access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : int;
         arg3 : long;
         arg4 : System.Address) return long  -- /usr/include/openssl/bio.h:994
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_get_ctrl";

   function BIO_meth_set_ctrl (biom : access BIO_METHOD; ctrl : access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : int;
         arg3 : long;
         arg4 : System.Address) return long) return int  -- /usr/include/openssl/bio.h:995
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_set_ctrl";

   function BIO_meth_get_create (bion : access constant BIO_METHOD) return access function (arg1 : access openssl_types_h.bio_st) return int  -- /usr/include/openssl/bio.h:997
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_get_create";

   function BIO_meth_set_create (biom : access BIO_METHOD; create : access function (arg1 : access openssl_types_h.bio_st) return int) return int  -- /usr/include/openssl/bio.h:998
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_set_create";

   function BIO_meth_get_destroy (biom : access constant BIO_METHOD) return access function (arg1 : access openssl_types_h.bio_st) return int  -- /usr/include/openssl/bio.h:999
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_get_destroy";

   function BIO_meth_set_destroy (biom : access BIO_METHOD; destroy : access function (arg1 : access openssl_types_h.bio_st) return int) return int  -- /usr/include/openssl/bio.h:1000
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_set_destroy";

   function BIO_meth_get_callback_ctrl (biom : access constant BIO_METHOD) return access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : int;
         arg3 : access function
           (arg1 : access openssl_types_h.bio_st;
            arg2 : int;
            arg3 : int) return int) return long  -- /usr/include/openssl/bio.h:1001
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_get_callback_ctrl";

   function BIO_meth_set_callback_ctrl (biom : access BIO_METHOD; callback_ctrl : access function
        (arg1 : access openssl_types_h.bio_st;
         arg2 : int;
         arg3 : access function
           (arg1 : access openssl_types_h.bio_st;
            arg2 : int;
            arg3 : int) return int) return long) return int  -- /usr/include/openssl/bio.h:1003
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_meth_set_callback_ctrl";

end openssl_bio_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
