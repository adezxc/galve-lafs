pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with System;
with openssl_types_h;
with openssl_stack_h;
with Interfaces.C.Strings;
with bits_types_time_t_h;
limited with bits_types_struct_tm_h;
with bits_stdint_intn_h;
with bits_stdint_uintn_h;
limited with bits_types_struct_FILE_h;
with stddef_h;
limited with openssl_bio_h;

package openssl_asn1_h is

   V_ASN1_UNIVERSAL : constant := 16#00#;  --  /usr/include/openssl/asn1.h:47
   V_ASN1_APPLICATION : constant := 16#40#;  --  /usr/include/openssl/asn1.h:48
   V_ASN1_CONTEXT_SPECIFIC : constant := 16#80#;  --  /usr/include/openssl/asn1.h:49
   V_ASN1_PRIVATE : constant := 16#c0#;  --  /usr/include/openssl/asn1.h:50

   V_ASN1_CONSTRUCTED : constant := 16#20#;  --  /usr/include/openssl/asn1.h:52
   V_ASN1_PRIMITIVE_TAG : constant := 16#1f#;  --  /usr/include/openssl/asn1.h:53
   --  unsupported macro: V_ASN1_PRIMATIVE_TAG V_ASN1_PRIMITIVE_TAG

   V_ASN1_APP_CHOOSE : constant := -2;  --  /usr/include/openssl/asn1.h:56
   V_ASN1_OTHER : constant := -3;  --  /usr/include/openssl/asn1.h:57
   V_ASN1_ANY : constant := -4;  --  /usr/include/openssl/asn1.h:58

   V_ASN1_UNDEF : constant := -1;  --  /usr/include/openssl/asn1.h:60

   V_ASN1_EOC : constant := 0;  --  /usr/include/openssl/asn1.h:62
   V_ASN1_BOOLEAN : constant := 1;  --  /usr/include/openssl/asn1.h:63
   V_ASN1_INTEGER : constant := 2;  --  /usr/include/openssl/asn1.h:64
   V_ASN1_BIT_STRING : constant := 3;  --  /usr/include/openssl/asn1.h:65
   V_ASN1_OCTET_STRING : constant := 4;  --  /usr/include/openssl/asn1.h:66
   V_ASN1_NULL : constant := 5;  --  /usr/include/openssl/asn1.h:67
   V_ASN1_OBJECT : constant := 6;  --  /usr/include/openssl/asn1.h:68
   V_ASN1_OBJECT_DESCRIPTOR : constant := 7;  --  /usr/include/openssl/asn1.h:69
   V_ASN1_EXTERNAL : constant := 8;  --  /usr/include/openssl/asn1.h:70
   V_ASN1_REAL : constant := 9;  --  /usr/include/openssl/asn1.h:71
   V_ASN1_ENUMERATED : constant := 10;  --  /usr/include/openssl/asn1.h:72
   V_ASN1_UTF8STRING : constant := 12;  --  /usr/include/openssl/asn1.h:73
   V_ASN1_SEQUENCE : constant := 16;  --  /usr/include/openssl/asn1.h:74
   V_ASN1_SET : constant := 17;  --  /usr/include/openssl/asn1.h:75
   V_ASN1_NUMERICSTRING : constant := 18;  --  /usr/include/openssl/asn1.h:76
   V_ASN1_PRINTABLESTRING : constant := 19;  --  /usr/include/openssl/asn1.h:77
   V_ASN1_T61STRING : constant := 20;  --  /usr/include/openssl/asn1.h:78
   V_ASN1_TELETEXSTRING : constant := 20;  --  /usr/include/openssl/asn1.h:79
   V_ASN1_VIDEOTEXSTRING : constant := 21;  --  /usr/include/openssl/asn1.h:80
   V_ASN1_IA5STRING : constant := 22;  --  /usr/include/openssl/asn1.h:81
   V_ASN1_UTCTIME : constant := 23;  --  /usr/include/openssl/asn1.h:82
   V_ASN1_GENERALIZEDTIME : constant := 24;  --  /usr/include/openssl/asn1.h:83
   V_ASN1_GRAPHICSTRING : constant := 25;  --  /usr/include/openssl/asn1.h:84
   V_ASN1_ISO64STRING : constant := 26;  --  /usr/include/openssl/asn1.h:85
   V_ASN1_VISIBLESTRING : constant := 26;  --  /usr/include/openssl/asn1.h:86
   V_ASN1_GENERALSTRING : constant := 27;  --  /usr/include/openssl/asn1.h:87
   V_ASN1_UNIVERSALSTRING : constant := 28;  --  /usr/include/openssl/asn1.h:88
   V_ASN1_BMPSTRING : constant := 30;  --  /usr/include/openssl/asn1.h:89

   V_ASN1_NEG : constant := 16#100#;  --  /usr/include/openssl/asn1.h:97
   --  unsupported macro: V_ASN1_NEG_INTEGER (2 | V_ASN1_NEG)
   --  unsupported macro: V_ASN1_NEG_ENUMERATED (10 | V_ASN1_NEG)

   B_ASN1_NUMERICSTRING : constant := 16#0001#;  --  /usr/include/openssl/asn1.h:102
   B_ASN1_PRINTABLESTRING : constant := 16#0002#;  --  /usr/include/openssl/asn1.h:103
   B_ASN1_T61STRING : constant := 16#0004#;  --  /usr/include/openssl/asn1.h:104
   B_ASN1_TELETEXSTRING : constant := 16#0004#;  --  /usr/include/openssl/asn1.h:105
   B_ASN1_VIDEOTEXSTRING : constant := 16#0008#;  --  /usr/include/openssl/asn1.h:106
   B_ASN1_IA5STRING : constant := 16#0010#;  --  /usr/include/openssl/asn1.h:107
   B_ASN1_GRAPHICSTRING : constant := 16#0020#;  --  /usr/include/openssl/asn1.h:108
   B_ASN1_ISO64STRING : constant := 16#0040#;  --  /usr/include/openssl/asn1.h:109
   B_ASN1_VISIBLESTRING : constant := 16#0040#;  --  /usr/include/openssl/asn1.h:110
   B_ASN1_GENERALSTRING : constant := 16#0080#;  --  /usr/include/openssl/asn1.h:111
   B_ASN1_UNIVERSALSTRING : constant := 16#0100#;  --  /usr/include/openssl/asn1.h:112
   B_ASN1_OCTET_STRING : constant := 16#0200#;  --  /usr/include/openssl/asn1.h:113
   B_ASN1_BIT_STRING : constant := 16#0400#;  --  /usr/include/openssl/asn1.h:114
   B_ASN1_BMPSTRING : constant := 16#0800#;  --  /usr/include/openssl/asn1.h:115
   B_ASN1_UNKNOWN : constant := 16#1000#;  --  /usr/include/openssl/asn1.h:116
   B_ASN1_UTF8STRING : constant := 16#2000#;  --  /usr/include/openssl/asn1.h:117
   B_ASN1_UTCTIME : constant := 16#4000#;  --  /usr/include/openssl/asn1.h:118
   B_ASN1_GENERALIZEDTIME : constant := 16#8000#;  --  /usr/include/openssl/asn1.h:119
   B_ASN1_SEQUENCE : constant := 16#10000#;  --  /usr/include/openssl/asn1.h:120

   MBSTRING_FLAG : constant := 16#1000#;  --  /usr/include/openssl/asn1.h:122
   --  unsupported macro: MBSTRING_UTF8 (MBSTRING_FLAG)
   --  unsupported macro: MBSTRING_ASC (MBSTRING_FLAG|1)
   --  unsupported macro: MBSTRING_BMP (MBSTRING_FLAG|2)
   --  unsupported macro: MBSTRING_UNIV (MBSTRING_FLAG|4)

   SMIME_OLDMIME : constant := 16#400#;  --  /usr/include/openssl/asn1.h:127
   SMIME_CRLFEOL : constant := 16#800#;  --  /usr/include/openssl/asn1.h:128
   SMIME_STREAM : constant := 16#1000#;  --  /usr/include/openssl/asn1.h:129
   --  arg-macro: procedure sk_X509_ALGOR_num (sk)
   --    OPENSSL_sk_num(ossl_check_const_X509_ALGOR_sk_type(sk))
   --  arg-macro: function sk_X509_ALGOR_value (sk, idx)
   --    return (X509_ALGOR *)OPENSSL_sk_value(ossl_check_const_X509_ALGOR_sk_type(sk), (idx));
   --  arg-macro: function sk_X509_ALGOR_new (cmp)
   --    return (STACK_OF(X509_ALGOR) *)OPENSSL_sk_new(ossl_check_X509_ALGOR_compfunc_type(cmp));
   --  arg-macro: function sk_X509_ALGOR_new_null ()
   --    return (STACK_OF(X509_ALGOR) *)OPENSSL_sk_new_null();
   --  arg-macro: function sk_X509_ALGOR_new_reserve (cmp, n)
   --    return (STACK_OF(X509_ALGOR) *)OPENSSL_sk_new_reserve(ossl_check_X509_ALGOR_compfunc_type(cmp), (n));
   --  arg-macro: procedure sk_X509_ALGOR_reserve (sk, n)
   --    OPENSSL_sk_reserve(ossl_check_X509_ALGOR_sk_type(sk), (n))
   --  arg-macro: procedure sk_X509_ALGOR_free (sk)
   --    OPENSSL_sk_free(ossl_check_X509_ALGOR_sk_type(sk))
   --  arg-macro: procedure sk_X509_ALGOR_zero (sk)
   --    OPENSSL_sk_zero(ossl_check_X509_ALGOR_sk_type(sk))
   --  arg-macro: function sk_X509_ALGOR_delete (sk, i)
   --    return (X509_ALGOR *)OPENSSL_sk_delete(ossl_check_X509_ALGOR_sk_type(sk), (i));
   --  arg-macro: function sk_X509_ALGOR_delete_ptr (sk, ptr)
   --    return (X509_ALGOR *)OPENSSL_sk_delete_ptr(ossl_check_X509_ALGOR_sk_type(sk), ossl_check_X509_ALGOR_type(ptr));
   --  arg-macro: procedure sk_X509_ALGOR_push (sk, ptr)
   --    OPENSSL_sk_push(ossl_check_X509_ALGOR_sk_type(sk), ossl_check_X509_ALGOR_type(ptr))
   --  arg-macro: procedure sk_X509_ALGOR_unshift (sk, ptr)
   --    OPENSSL_sk_unshift(ossl_check_X509_ALGOR_sk_type(sk), ossl_check_X509_ALGOR_type(ptr))
   --  arg-macro: function sk_X509_ALGOR_pop (sk)
   --    return (X509_ALGOR *)OPENSSL_sk_pop(ossl_check_X509_ALGOR_sk_type(sk));
   --  arg-macro: function sk_X509_ALGOR_shift (sk)
   --    return (X509_ALGOR *)OPENSSL_sk_shift(ossl_check_X509_ALGOR_sk_type(sk));
   --  arg-macro: procedure sk_X509_ALGOR_pop_free (sk, freefunc)
   --    OPENSSL_sk_pop_free(ossl_check_X509_ALGOR_sk_type(sk),ossl_check_X509_ALGOR_freefunc_type(freefunc))
   --  arg-macro: procedure sk_X509_ALGOR_insert (sk, ptr, idx)
   --    OPENSSL_sk_insert(ossl_check_X509_ALGOR_sk_type(sk), ossl_check_X509_ALGOR_type(ptr), (idx))
   --  arg-macro: function sk_X509_ALGOR_set (sk, idx, ptr)
   --    return (X509_ALGOR *)OPENSSL_sk_set(ossl_check_X509_ALGOR_sk_type(sk), (idx), ossl_check_X509_ALGOR_type(ptr));
   --  arg-macro: procedure sk_X509_ALGOR_find (sk, ptr)
   --    OPENSSL_sk_find(ossl_check_X509_ALGOR_sk_type(sk), ossl_check_X509_ALGOR_type(ptr))
   --  arg-macro: procedure sk_X509_ALGOR_find_ex (sk, ptr)
   --    OPENSSL_sk_find_ex(ossl_check_X509_ALGOR_sk_type(sk), ossl_check_X509_ALGOR_type(ptr))
   --  arg-macro: procedure sk_X509_ALGOR_find_all (sk, ptr, pnum)
   --    OPENSSL_sk_find_all(ossl_check_X509_ALGOR_sk_type(sk), ossl_check_X509_ALGOR_type(ptr), pnum)
   --  arg-macro: procedure sk_X509_ALGOR_sort (sk)
   --    OPENSSL_sk_sort(ossl_check_X509_ALGOR_sk_type(sk))
   --  arg-macro: procedure sk_X509_ALGOR_is_sorted (sk)
   --    OPENSSL_sk_is_sorted(ossl_check_const_X509_ALGOR_sk_type(sk))
   --  arg-macro: function sk_X509_ALGOR_dup (sk)
   --    return (STACK_OF(X509_ALGOR) *)OPENSSL_sk_dup(ossl_check_const_X509_ALGOR_sk_type(sk));
   --  arg-macro: function sk_X509_ALGOR_deep_copy (sk, copyfunc, freefunc)
   --    return (STACK_OF(X509_ALGOR) *)OPENSSL_sk_deep_copy(ossl_check_const_X509_ALGOR_sk_type(sk), ossl_check_X509_ALGOR_copyfunc_type(copyfunc), ossl_check_X509_ALGOR_freefunc_type(freefunc));
   --  arg-macro: function sk_X509_ALGOR_set_cmp_func (sk, cmp)
   --    return (sk_X509_ALGOR_compfunc)OPENSSL_sk_set_cmp_func(ossl_check_X509_ALGOR_sk_type(sk), ossl_check_X509_ALGOR_compfunc_type(cmp));

   ASN1_STRING_FLAG_BITS_LEFT : constant := 16#08#;  --  /usr/include/openssl/asn1.h:161

   ASN1_STRING_FLAG_NDEF : constant := 16#010#;  --  /usr/include/openssl/asn1.h:167

   ASN1_STRING_FLAG_CONT : constant := 16#020#;  --  /usr/include/openssl/asn1.h:175

   ASN1_STRING_FLAG_MSTRING : constant := 16#040#;  --  /usr/include/openssl/asn1.h:180

   ASN1_STRING_FLAG_EMBED : constant := 16#080#;  --  /usr/include/openssl/asn1.h:182

   ASN1_STRING_FLAG_X509_TIME : constant := 16#100#;  --  /usr/include/openssl/asn1.h:184

   ASN1_LONG_UNDEF : constant := 16#7fffffff#;  --  /usr/include/openssl/asn1.h:211

   STABLE_FLAGS_MALLOC : constant := 16#01#;  --  /usr/include/openssl/asn1.h:213
   --  unsupported macro: STABLE_FLAGS_CLEAR STABLE_FLAGS_MALLOC

   STABLE_NO_MASK : constant := 16#02#;  --  /usr/include/openssl/asn1.h:221
   --  unsupported macro: DIRSTRING_TYPE (B_ASN1_PRINTABLESTRING|B_ASN1_T61STRING|B_ASN1_BMPSTRING|B_ASN1_UTF8STRING)
   --  unsupported macro: PKCS9STRING_TYPE (DIRSTRING_TYPE|B_ASN1_IA5STRING)
   --  arg-macro: procedure sk_ASN1_STRING_TABLE_num (sk)
   --    OPENSSL_sk_num(ossl_check_const_ASN1_STRING_TABLE_sk_type(sk))
   --  arg-macro: function sk_ASN1_STRING_TABLE_value (sk, idx)
   --    return (ASN1_STRING_TABLE *)OPENSSL_sk_value(ossl_check_const_ASN1_STRING_TABLE_sk_type(sk), (idx));
   --  arg-macro: function sk_ASN1_STRING_TABLE_new (cmp)
   --    return (STACK_OF(ASN1_STRING_TABLE) *)OPENSSL_sk_new(ossl_check_ASN1_STRING_TABLE_compfunc_type(cmp));
   --  arg-macro: function sk_ASN1_STRING_TABLE_new_null ()
   --    return (STACK_OF(ASN1_STRING_TABLE) *)OPENSSL_sk_new_null();
   --  arg-macro: function sk_ASN1_STRING_TABLE_new_reserve (cmp, n)
   --    return (STACK_OF(ASN1_STRING_TABLE) *)OPENSSL_sk_new_reserve(ossl_check_ASN1_STRING_TABLE_compfunc_type(cmp), (n));
   --  arg-macro: procedure sk_ASN1_STRING_TABLE_reserve (sk, n)
   --    OPENSSL_sk_reserve(ossl_check_ASN1_STRING_TABLE_sk_type(sk), (n))
   --  arg-macro: procedure sk_ASN1_STRING_TABLE_free (sk)
   --    OPENSSL_sk_free(ossl_check_ASN1_STRING_TABLE_sk_type(sk))
   --  arg-macro: procedure sk_ASN1_STRING_TABLE_zero (sk)
   --    OPENSSL_sk_zero(ossl_check_ASN1_STRING_TABLE_sk_type(sk))
   --  arg-macro: function sk_ASN1_STRING_TABLE_delete (sk, i)
   --    return (ASN1_STRING_TABLE *)OPENSSL_sk_delete(ossl_check_ASN1_STRING_TABLE_sk_type(sk), (i));
   --  arg-macro: function sk_ASN1_STRING_TABLE_delete_ptr (sk, ptr)
   --    return (ASN1_STRING_TABLE *)OPENSSL_sk_delete_ptr(ossl_check_ASN1_STRING_TABLE_sk_type(sk), ossl_check_ASN1_STRING_TABLE_type(ptr));
   --  arg-macro: procedure sk_ASN1_STRING_TABLE_push (sk, ptr)
   --    OPENSSL_sk_push(ossl_check_ASN1_STRING_TABLE_sk_type(sk), ossl_check_ASN1_STRING_TABLE_type(ptr))
   --  arg-macro: procedure sk_ASN1_STRING_TABLE_unshift (sk, ptr)
   --    OPENSSL_sk_unshift(ossl_check_ASN1_STRING_TABLE_sk_type(sk), ossl_check_ASN1_STRING_TABLE_type(ptr))
   --  arg-macro: function sk_ASN1_STRING_TABLE_pop (sk)
   --    return (ASN1_STRING_TABLE *)OPENSSL_sk_pop(ossl_check_ASN1_STRING_TABLE_sk_type(sk));
   --  arg-macro: function sk_ASN1_STRING_TABLE_shift (sk)
   --    return (ASN1_STRING_TABLE *)OPENSSL_sk_shift(ossl_check_ASN1_STRING_TABLE_sk_type(sk));
   --  arg-macro: procedure sk_ASN1_STRING_TABLE_pop_free (sk, freefunc)
   --    OPENSSL_sk_pop_free(ossl_check_ASN1_STRING_TABLE_sk_type(sk),ossl_check_ASN1_STRING_TABLE_freefunc_type(freefunc))
   --  arg-macro: procedure sk_ASN1_STRING_TABLE_insert (sk, ptr, idx)
   --    OPENSSL_sk_insert(ossl_check_ASN1_STRING_TABLE_sk_type(sk), ossl_check_ASN1_STRING_TABLE_type(ptr), (idx))
   --  arg-macro: function sk_ASN1_STRING_TABLE_set (sk, idx, ptr)
   --    return (ASN1_STRING_TABLE *)OPENSSL_sk_set(ossl_check_ASN1_STRING_TABLE_sk_type(sk), (idx), ossl_check_ASN1_STRING_TABLE_type(ptr));
   --  arg-macro: procedure sk_ASN1_STRING_TABLE_find (sk, ptr)
   --    OPENSSL_sk_find(ossl_check_ASN1_STRING_TABLE_sk_type(sk), ossl_check_ASN1_STRING_TABLE_type(ptr))
   --  arg-macro: procedure sk_ASN1_STRING_TABLE_find_ex (sk, ptr)
   --    OPENSSL_sk_find_ex(ossl_check_ASN1_STRING_TABLE_sk_type(sk), ossl_check_ASN1_STRING_TABLE_type(ptr))
   --  arg-macro: procedure sk_ASN1_STRING_TABLE_find_all (sk, ptr, pnum)
   --    OPENSSL_sk_find_all(ossl_check_ASN1_STRING_TABLE_sk_type(sk), ossl_check_ASN1_STRING_TABLE_type(ptr), pnum)
   --  arg-macro: procedure sk_ASN1_STRING_TABLE_sort (sk)
   --    OPENSSL_sk_sort(ossl_check_ASN1_STRING_TABLE_sk_type(sk))
   --  arg-macro: procedure sk_ASN1_STRING_TABLE_is_sorted (sk)
   --    OPENSSL_sk_is_sorted(ossl_check_const_ASN1_STRING_TABLE_sk_type(sk))
   --  arg-macro: function sk_ASN1_STRING_TABLE_dup (sk)
   --    return (STACK_OF(ASN1_STRING_TABLE) *)OPENSSL_sk_dup(ossl_check_const_ASN1_STRING_TABLE_sk_type(sk));
   --  arg-macro: function sk_ASN1_STRING_TABLE_deep_copy (sk, copyfunc, freefunc)
   --    return (STACK_OF(ASN1_STRING_TABLE) *)OPENSSL_sk_deep_copy(ossl_check_const_ASN1_STRING_TABLE_sk_type(sk), ossl_check_ASN1_STRING_TABLE_copyfunc_type(copyfunc), ossl_check_ASN1_STRING_TABLE_freefunc_type(freefunc));
   --  arg-macro: function sk_ASN1_STRING_TABLE_set_cmp_func (sk, cmp)
   --    return (sk_ASN1_STRING_TABLE_compfunc)OPENSSL_sk_set_cmp_func(ossl_check_ASN1_STRING_TABLE_sk_type(sk), ossl_check_ASN1_STRING_TABLE_compfunc_type(cmp));

   ub_name : constant := 32768;  --  /usr/include/openssl/asn1.h:264
   ub_common_name : constant := 64;  --  /usr/include/openssl/asn1.h:265
   ub_locality_name : constant := 128;  --  /usr/include/openssl/asn1.h:266
   ub_state_name : constant := 128;  --  /usr/include/openssl/asn1.h:267
   ub_organization_name : constant := 64;  --  /usr/include/openssl/asn1.h:268
   ub_organization_unit_name : constant := 64;  --  /usr/include/openssl/asn1.h:269
   ub_title : constant := 64;  --  /usr/include/openssl/asn1.h:270
   ub_email_address : constant := 128;  --  /usr/include/openssl/asn1.h:271
   --  arg-macro: procedure DECLARE_ASN1_FUNCTIONS_attr (attr, type)
   --    DECLARE_ASN1_FUNCTIONS_name_attr(attr, type, type)
   --  arg-macro: procedure DECLARE_ASN1_FUNCTIONS (type)
   --    DECLARE_ASN1_FUNCTIONS_attr(extern, type)
   --  arg-macro: procedure DECLARE_ASN1_ALLOC_FUNCTIONS_attr (attr, type)
   --    DECLARE_ASN1_ALLOC_FUNCTIONS_name_attr(attr, type, type)
   --  arg-macro: procedure DECLARE_ASN1_ALLOC_FUNCTIONS (type)
   --    DECLARE_ASN1_ALLOC_FUNCTIONS_attr(extern, type)
   --  arg-macro: procedure DECLARE_ASN1_FUNCTIONS_name_attr (attr, type, name)
   --    DECLARE_ASN1_ALLOC_FUNCTIONS_name_attr(attr, type, name) DECLARE_ASN1_ENCODE_FUNCTIONS_name_attr(attr, type, name)
   --  arg-macro: procedure DECLARE_ASN1_FUNCTIONS_name (type, name)
   --    DECLARE_ASN1_FUNCTIONS_name_attr(extern, type, name)
   --  arg-macro: procedure DECLARE_ASN1_ENCODE_FUNCTIONS_attr (attr, type, itname, name)
   --    DECLARE_ASN1_ENCODE_FUNCTIONS_only_attr(attr, type, name) DECLARE_ASN1_ITEM_attr(attr, itname)
   --  arg-macro: procedure DECLARE_ASN1_ENCODE_FUNCTIONS (type, itname, name)
   --    DECLARE_ASN1_ENCODE_FUNCTIONS_attr(extern, type, itname, name)
   --  arg-macro: procedure DECLARE_ASN1_ENCODE_FUNCTIONS_name_attr (attr, type, name)
   --    DECLARE_ASN1_ENCODE_FUNCTIONS_attr(attr, type, name, name)
   --  arg-macro: procedure DECLARE_ASN1_ENCODE_FUNCTIONS_name (type, name)
   --    DECLARE_ASN1_ENCODE_FUNCTIONS_name_attr(extern, type, name)
   --  unsupported macro: DECLARE_ASN1_ENCODE_FUNCTIONS_only_attr(attr,type,name) attr type *d2i_ ##name(type **a, const unsigned char **in, long len); attr int i2d_ ##name(const type *a, unsigned char **out);
   --  arg-macro: procedure DECLARE_ASN1_ENCODE_FUNCTIONS_only (type, name)
   --    DECLARE_ASN1_ENCODE_FUNCTIONS_only_attr(extern, type, name)
   --  unsupported macro: DECLARE_ASN1_NDEF_FUNCTION_attr(attr,name) attr int i2d_ ##name ##_NDEF(const name *a, unsigned char **out);
   --  arg-macro: procedure DECLARE_ASN1_NDEF_FUNCTION (name)
   --    DECLARE_ASN1_NDEF_FUNCTION_attr(extern, name)
   --  unsupported macro: DECLARE_ASN1_ALLOC_FUNCTIONS_name_attr(attr,type,name) attr type *name ##_new(void); attr void name ##_free(type *a);
   --  arg-macro: procedure DECLARE_ASN1_ALLOC_FUNCTIONS_name (type, name)
   --    DECLARE_ASN1_ALLOC_FUNCTIONS_name_attr(extern, type, name)
   --  arg-macro: procedure DECLARE_ASN1_DUP_FUNCTION_attr (attr, type)
   --    DECLARE_ASN1_DUP_FUNCTION_name_attr(attr, type, type)
   --  arg-macro: procedure DECLARE_ASN1_DUP_FUNCTION (type)
   --    DECLARE_ASN1_DUP_FUNCTION_attr(extern, type)
   --  unsupported macro: DECLARE_ASN1_DUP_FUNCTION_name_attr(attr,type,name) attr type *name ##_dup(const type *a);
   --  arg-macro: procedure DECLARE_ASN1_DUP_FUNCTION_name (type, name)
   --    DECLARE_ASN1_DUP_FUNCTION_name_attr(extern, type, name)
   --  arg-macro: procedure DECLARE_ASN1_PRINT_FUNCTION_attr (attr, stname)
   --    DECLARE_ASN1_PRINT_FUNCTION_fname_attr(attr, stname, stname)
   --  arg-macro: procedure DECLARE_ASN1_PRINT_FUNCTION (stname)
   --    DECLARE_ASN1_PRINT_FUNCTION_attr(extern, stname)
   --  unsupported macro: DECLARE_ASN1_PRINT_FUNCTION_fname_attr(attr,stname,fname) attr int fname ##_print_ctx(BIO *out, const stname *x, int indent, const ASN1_PCTX *pctx);
   --  arg-macro: procedure DECLARE_ASN1_PRINT_FUNCTION_fname (stname, fname)
   --    DECLARE_ASN1_PRINT_FUNCTION_fname_attr(extern, stname, fname)
   --  arg-macro: procedure D2I_OF (type)
   --    type *(*)(type **,const unsigned char **,long)
   --  arg-macro: procedure I2D_OF (type)
   --    int (*)(const type *,unsigned char **)
   --  arg-macro: function CHECKED_D2I_OF (type, d2i)
   --    return (d2i_of_void*) (1 ? d2i : ((D2I_OF(type))0));
   --  arg-macro: function CHECKED_I2D_OF (type, i2d)
   --    return (i2d_of_void*) (1 ? i2d : ((I2D_OF(type))0));
   --  arg-macro: function CHECKED_NEW_OF (type, xnew)
   --    return (void *(*)(void)) (1 ? xnew : ((type *(*)(void))0));
   --  arg-macro: function CHECKED_PTR_OF (type, p)
   --    return (void*) (1 ? p : (type*)0);
   --  arg-macro: function CHECKED_PPTR_OF (type, p)
   --    return (void**) (1 ? p : (type**)0);
   --  unsupported macro: TYPEDEF_D2I_OF(type) typedef type *d2i_of_ ##type(type **,const unsigned char **,long)
   --  unsupported macro: TYPEDEF_I2D_OF(type) typedef int i2d_of_ ##type(const type *,unsigned char **)
   --  arg-macro: procedure TYPEDEF_D2I2D_OF (type)
   --    TYPEDEF_D2I_OF(type); TYPEDEF_I2D_OF(type)
   --  arg-macro: function ASN1_ITEM_ptr (iptr)
   --    return iptr();
   --  unsupported macro: ASN1_ITEM_ref(iptr) (iptr ##_it)
   --  unsupported macro: ASN1_ITEM_rptr(ref) (ref ##_it())
   --  unsupported macro: DECLARE_ASN1_ITEM_attr(attr,name) attr const ASN1_ITEM * name ##_it(void);
   --  arg-macro: procedure DECLARE_ASN1_ITEM (name)
   --    DECLARE_ASN1_ITEM_attr(extern, name)

   ASN1_STRFLGS_ESC_2253 : constant := 1;  --  /usr/include/openssl/asn1.h:440
   ASN1_STRFLGS_ESC_CTRL : constant := 2;  --  /usr/include/openssl/asn1.h:441
   ASN1_STRFLGS_ESC_MSB : constant := 4;  --  /usr/include/openssl/asn1.h:442

   ASN1_DTFLGS_TYPE_MASK : constant := 16#0F#;  --  /usr/include/openssl/asn1.h:445
   ASN1_DTFLGS_RFC822 : constant := 16#00#;  --  /usr/include/openssl/asn1.h:446
   ASN1_DTFLGS_ISO8601 : constant := 16#01#;  --  /usr/include/openssl/asn1.h:447

   ASN1_STRFLGS_ESC_QUOTE : constant := 8;  --  /usr/include/openssl/asn1.h:454

   CHARTYPE_PRINTABLESTRING : constant := 16#10#;  --  /usr/include/openssl/asn1.h:459

   CHARTYPE_FIRST_ESC_2253 : constant := 16#20#;  --  /usr/include/openssl/asn1.h:461

   CHARTYPE_LAST_ESC_2253 : constant := 16#40#;  --  /usr/include/openssl/asn1.h:463

   ASN1_STRFLGS_UTF8_CONVERT : constant := 16#10#;  --  /usr/include/openssl/asn1.h:474

   ASN1_STRFLGS_IGNORE_TYPE : constant := 16#20#;  --  /usr/include/openssl/asn1.h:482

   ASN1_STRFLGS_SHOW_TYPE : constant := 16#40#;  --  /usr/include/openssl/asn1.h:485

   ASN1_STRFLGS_DUMP_ALL : constant := 16#80#;  --  /usr/include/openssl/asn1.h:495
   ASN1_STRFLGS_DUMP_UNKNOWN : constant := 16#100#;  --  /usr/include/openssl/asn1.h:496

   ASN1_STRFLGS_DUMP_DER : constant := 16#200#;  --  /usr/include/openssl/asn1.h:503

   ASN1_STRFLGS_ESC_2254 : constant := 16#400#;  --  /usr/include/openssl/asn1.h:508
   --  unsupported macro: ASN1_STRFLGS_RFC2253 (ASN1_STRFLGS_ESC_2253 | ASN1_STRFLGS_ESC_CTRL | ASN1_STRFLGS_ESC_MSB | ASN1_STRFLGS_UTF8_CONVERT | ASN1_STRFLGS_DUMP_UNKNOWN | ASN1_STRFLGS_DUMP_DER)
   --  arg-macro: procedure sk_ASN1_TYPE_num (sk)
   --    OPENSSL_sk_num(ossl_check_const_ASN1_TYPE_sk_type(sk))
   --  arg-macro: function sk_ASN1_TYPE_value (sk, idx)
   --    return (ASN1_TYPE *)OPENSSL_sk_value(ossl_check_const_ASN1_TYPE_sk_type(sk), (idx));
   --  arg-macro: function sk_ASN1_TYPE_new (cmp)
   --    return (STACK_OF(ASN1_TYPE) *)OPENSSL_sk_new(ossl_check_ASN1_TYPE_compfunc_type(cmp));
   --  arg-macro: function sk_ASN1_TYPE_new_null ()
   --    return (STACK_OF(ASN1_TYPE) *)OPENSSL_sk_new_null();
   --  arg-macro: function sk_ASN1_TYPE_new_reserve (cmp, n)
   --    return (STACK_OF(ASN1_TYPE) *)OPENSSL_sk_new_reserve(ossl_check_ASN1_TYPE_compfunc_type(cmp), (n));
   --  arg-macro: procedure sk_ASN1_TYPE_reserve (sk, n)
   --    OPENSSL_sk_reserve(ossl_check_ASN1_TYPE_sk_type(sk), (n))
   --  arg-macro: procedure sk_ASN1_TYPE_free (sk)
   --    OPENSSL_sk_free(ossl_check_ASN1_TYPE_sk_type(sk))
   --  arg-macro: procedure sk_ASN1_TYPE_zero (sk)
   --    OPENSSL_sk_zero(ossl_check_ASN1_TYPE_sk_type(sk))
   --  arg-macro: function sk_ASN1_TYPE_delete (sk, i)
   --    return (ASN1_TYPE *)OPENSSL_sk_delete(ossl_check_ASN1_TYPE_sk_type(sk), (i));
   --  arg-macro: function sk_ASN1_TYPE_delete_ptr (sk, ptr)
   --    return (ASN1_TYPE *)OPENSSL_sk_delete_ptr(ossl_check_ASN1_TYPE_sk_type(sk), ossl_check_ASN1_TYPE_type(ptr));
   --  arg-macro: procedure sk_ASN1_TYPE_push (sk, ptr)
   --    OPENSSL_sk_push(ossl_check_ASN1_TYPE_sk_type(sk), ossl_check_ASN1_TYPE_type(ptr))
   --  arg-macro: procedure sk_ASN1_TYPE_unshift (sk, ptr)
   --    OPENSSL_sk_unshift(ossl_check_ASN1_TYPE_sk_type(sk), ossl_check_ASN1_TYPE_type(ptr))
   --  arg-macro: function sk_ASN1_TYPE_pop (sk)
   --    return (ASN1_TYPE *)OPENSSL_sk_pop(ossl_check_ASN1_TYPE_sk_type(sk));
   --  arg-macro: function sk_ASN1_TYPE_shift (sk)
   --    return (ASN1_TYPE *)OPENSSL_sk_shift(ossl_check_ASN1_TYPE_sk_type(sk));
   --  arg-macro: procedure sk_ASN1_TYPE_pop_free (sk, freefunc)
   --    OPENSSL_sk_pop_free(ossl_check_ASN1_TYPE_sk_type(sk),ossl_check_ASN1_TYPE_freefunc_type(freefunc))
   --  arg-macro: procedure sk_ASN1_TYPE_insert (sk, ptr, idx)
   --    OPENSSL_sk_insert(ossl_check_ASN1_TYPE_sk_type(sk), ossl_check_ASN1_TYPE_type(ptr), (idx))
   --  arg-macro: function sk_ASN1_TYPE_set (sk, idx, ptr)
   --    return (ASN1_TYPE *)OPENSSL_sk_set(ossl_check_ASN1_TYPE_sk_type(sk), (idx), ossl_check_ASN1_TYPE_type(ptr));
   --  arg-macro: procedure sk_ASN1_TYPE_find (sk, ptr)
   --    OPENSSL_sk_find(ossl_check_ASN1_TYPE_sk_type(sk), ossl_check_ASN1_TYPE_type(ptr))
   --  arg-macro: procedure sk_ASN1_TYPE_find_ex (sk, ptr)
   --    OPENSSL_sk_find_ex(ossl_check_ASN1_TYPE_sk_type(sk), ossl_check_ASN1_TYPE_type(ptr))
   --  arg-macro: procedure sk_ASN1_TYPE_find_all (sk, ptr, pnum)
   --    OPENSSL_sk_find_all(ossl_check_ASN1_TYPE_sk_type(sk), ossl_check_ASN1_TYPE_type(ptr), pnum)
   --  arg-macro: procedure sk_ASN1_TYPE_sort (sk)
   --    OPENSSL_sk_sort(ossl_check_ASN1_TYPE_sk_type(sk))
   --  arg-macro: procedure sk_ASN1_TYPE_is_sorted (sk)
   --    OPENSSL_sk_is_sorted(ossl_check_const_ASN1_TYPE_sk_type(sk))
   --  arg-macro: function sk_ASN1_TYPE_dup (sk)
   --    return (STACK_OF(ASN1_TYPE) *)OPENSSL_sk_dup(ossl_check_const_ASN1_TYPE_sk_type(sk));
   --  arg-macro: function sk_ASN1_TYPE_deep_copy (sk, copyfunc, freefunc)
   --    return (STACK_OF(ASN1_TYPE) *)OPENSSL_sk_deep_copy(ossl_check_const_ASN1_TYPE_sk_type(sk), ossl_check_ASN1_TYPE_copyfunc_type(copyfunc), ossl_check_ASN1_TYPE_freefunc_type(freefunc));
   --  arg-macro: function sk_ASN1_TYPE_set_cmp_func (sk, cmp)
   --    return (sk_ASN1_TYPE_compfunc)OPENSSL_sk_set_cmp_func(ossl_check_ASN1_TYPE_sk_type(sk), ossl_check_ASN1_TYPE_compfunc_type(cmp));
   --  unsupported macro: B_ASN1_TIME B_ASN1_UTCTIME | B_ASN1_GENERALIZEDTIME
   --  unsupported macro: B_ASN1_PRINTABLE B_ASN1_NUMERICSTRING| B_ASN1_PRINTABLESTRING| B_ASN1_T61STRING| B_ASN1_IA5STRING| B_ASN1_BIT_STRING| B_ASN1_UNIVERSALSTRING| B_ASN1_BMPSTRING| B_ASN1_UTF8STRING| B_ASN1_SEQUENCE| B_ASN1_UNKNOWN
   --  unsupported macro: B_ASN1_DIRECTORYSTRING B_ASN1_PRINTABLESTRING| B_ASN1_TELETEXSTRING| B_ASN1_BMPSTRING| B_ASN1_UNIVERSALSTRING| B_ASN1_UTF8STRING
   --  unsupported macro: B_ASN1_DISPLAYTEXT B_ASN1_IA5STRING| B_ASN1_VISIBLESTRING| B_ASN1_BMPSTRING| B_ASN1_UTF8STRING
   --  arg-macro: procedure sk_ASN1_OBJECT_num (sk)
   --    OPENSSL_sk_num(ossl_check_const_ASN1_OBJECT_sk_type(sk))
   --  arg-macro: function sk_ASN1_OBJECT_value (sk, idx)
   --    return (ASN1_OBJECT *)OPENSSL_sk_value(ossl_check_const_ASN1_OBJECT_sk_type(sk), (idx));
   --  arg-macro: function sk_ASN1_OBJECT_new (cmp)
   --    return (STACK_OF(ASN1_OBJECT) *)OPENSSL_sk_new(ossl_check_ASN1_OBJECT_compfunc_type(cmp));
   --  arg-macro: function sk_ASN1_OBJECT_new_null ()
   --    return (STACK_OF(ASN1_OBJECT) *)OPENSSL_sk_new_null();
   --  arg-macro: function sk_ASN1_OBJECT_new_reserve (cmp, n)
   --    return (STACK_OF(ASN1_OBJECT) *)OPENSSL_sk_new_reserve(ossl_check_ASN1_OBJECT_compfunc_type(cmp), (n));
   --  arg-macro: procedure sk_ASN1_OBJECT_reserve (sk, n)
   --    OPENSSL_sk_reserve(ossl_check_ASN1_OBJECT_sk_type(sk), (n))
   --  arg-macro: procedure sk_ASN1_OBJECT_free (sk)
   --    OPENSSL_sk_free(ossl_check_ASN1_OBJECT_sk_type(sk))
   --  arg-macro: procedure sk_ASN1_OBJECT_zero (sk)
   --    OPENSSL_sk_zero(ossl_check_ASN1_OBJECT_sk_type(sk))
   --  arg-macro: function sk_ASN1_OBJECT_delete (sk, i)
   --    return (ASN1_OBJECT *)OPENSSL_sk_delete(ossl_check_ASN1_OBJECT_sk_type(sk), (i));
   --  arg-macro: function sk_ASN1_OBJECT_delete_ptr (sk, ptr)
   --    return (ASN1_OBJECT *)OPENSSL_sk_delete_ptr(ossl_check_ASN1_OBJECT_sk_type(sk), ossl_check_ASN1_OBJECT_type(ptr));
   --  arg-macro: procedure sk_ASN1_OBJECT_push (sk, ptr)
   --    OPENSSL_sk_push(ossl_check_ASN1_OBJECT_sk_type(sk), ossl_check_ASN1_OBJECT_type(ptr))
   --  arg-macro: procedure sk_ASN1_OBJECT_unshift (sk, ptr)
   --    OPENSSL_sk_unshift(ossl_check_ASN1_OBJECT_sk_type(sk), ossl_check_ASN1_OBJECT_type(ptr))
   --  arg-macro: function sk_ASN1_OBJECT_pop (sk)
   --    return (ASN1_OBJECT *)OPENSSL_sk_pop(ossl_check_ASN1_OBJECT_sk_type(sk));
   --  arg-macro: function sk_ASN1_OBJECT_shift (sk)
   --    return (ASN1_OBJECT *)OPENSSL_sk_shift(ossl_check_ASN1_OBJECT_sk_type(sk));
   --  arg-macro: procedure sk_ASN1_OBJECT_pop_free (sk, freefunc)
   --    OPENSSL_sk_pop_free(ossl_check_ASN1_OBJECT_sk_type(sk),ossl_check_ASN1_OBJECT_freefunc_type(freefunc))
   --  arg-macro: procedure sk_ASN1_OBJECT_insert (sk, ptr, idx)
   --    OPENSSL_sk_insert(ossl_check_ASN1_OBJECT_sk_type(sk), ossl_check_ASN1_OBJECT_type(ptr), (idx))
   --  arg-macro: function sk_ASN1_OBJECT_set (sk, idx, ptr)
   --    return (ASN1_OBJECT *)OPENSSL_sk_set(ossl_check_ASN1_OBJECT_sk_type(sk), (idx), ossl_check_ASN1_OBJECT_type(ptr));
   --  arg-macro: procedure sk_ASN1_OBJECT_find (sk, ptr)
   --    OPENSSL_sk_find(ossl_check_ASN1_OBJECT_sk_type(sk), ossl_check_ASN1_OBJECT_type(ptr))
   --  arg-macro: procedure sk_ASN1_OBJECT_find_ex (sk, ptr)
   --    OPENSSL_sk_find_ex(ossl_check_ASN1_OBJECT_sk_type(sk), ossl_check_ASN1_OBJECT_type(ptr))
   --  arg-macro: procedure sk_ASN1_OBJECT_find_all (sk, ptr, pnum)
   --    OPENSSL_sk_find_all(ossl_check_ASN1_OBJECT_sk_type(sk), ossl_check_ASN1_OBJECT_type(ptr), pnum)
   --  arg-macro: procedure sk_ASN1_OBJECT_sort (sk)
   --    OPENSSL_sk_sort(ossl_check_ASN1_OBJECT_sk_type(sk))
   --  arg-macro: procedure sk_ASN1_OBJECT_is_sorted (sk)
   --    OPENSSL_sk_is_sorted(ossl_check_const_ASN1_OBJECT_sk_type(sk))
   --  arg-macro: function sk_ASN1_OBJECT_dup (sk)
   --    return (STACK_OF(ASN1_OBJECT) *)OPENSSL_sk_dup(ossl_check_const_ASN1_OBJECT_sk_type(sk));
   --  arg-macro: function sk_ASN1_OBJECT_deep_copy (sk, copyfunc, freefunc)
   --    return (STACK_OF(ASN1_OBJECT) *)OPENSSL_sk_deep_copy(ossl_check_const_ASN1_OBJECT_sk_type(sk), ossl_check_ASN1_OBJECT_copyfunc_type(copyfunc), ossl_check_ASN1_OBJECT_freefunc_type(freefunc));
   --  arg-macro: function sk_ASN1_OBJECT_set_cmp_func (sk, cmp)
   --    return (sk_ASN1_OBJECT_compfunc)OPENSSL_sk_set_cmp_func(ossl_check_ASN1_OBJECT_sk_type(sk), ossl_check_ASN1_OBJECT_compfunc_type(cmp));
   --  arg-macro: procedure sk_ASN1_INTEGER_num (sk)
   --    OPENSSL_sk_num(ossl_check_const_ASN1_INTEGER_sk_type(sk))
   --  arg-macro: function sk_ASN1_INTEGER_value (sk, idx)
   --    return (ASN1_INTEGER *)OPENSSL_sk_value(ossl_check_const_ASN1_INTEGER_sk_type(sk), (idx));
   --  arg-macro: function sk_ASN1_INTEGER_new (cmp)
   --    return (STACK_OF(ASN1_INTEGER) *)OPENSSL_sk_new(ossl_check_ASN1_INTEGER_compfunc_type(cmp));
   --  arg-macro: function sk_ASN1_INTEGER_new_null ()
   --    return (STACK_OF(ASN1_INTEGER) *)OPENSSL_sk_new_null();
   --  arg-macro: function sk_ASN1_INTEGER_new_reserve (cmp, n)
   --    return (STACK_OF(ASN1_INTEGER) *)OPENSSL_sk_new_reserve(ossl_check_ASN1_INTEGER_compfunc_type(cmp), (n));
   --  arg-macro: procedure sk_ASN1_INTEGER_reserve (sk, n)
   --    OPENSSL_sk_reserve(ossl_check_ASN1_INTEGER_sk_type(sk), (n))
   --  arg-macro: procedure sk_ASN1_INTEGER_free (sk)
   --    OPENSSL_sk_free(ossl_check_ASN1_INTEGER_sk_type(sk))
   --  arg-macro: procedure sk_ASN1_INTEGER_zero (sk)
   --    OPENSSL_sk_zero(ossl_check_ASN1_INTEGER_sk_type(sk))
   --  arg-macro: function sk_ASN1_INTEGER_delete (sk, i)
   --    return (ASN1_INTEGER *)OPENSSL_sk_delete(ossl_check_ASN1_INTEGER_sk_type(sk), (i));
   --  arg-macro: function sk_ASN1_INTEGER_delete_ptr (sk, ptr)
   --    return (ASN1_INTEGER *)OPENSSL_sk_delete_ptr(ossl_check_ASN1_INTEGER_sk_type(sk), ossl_check_ASN1_INTEGER_type(ptr));
   --  arg-macro: procedure sk_ASN1_INTEGER_push (sk, ptr)
   --    OPENSSL_sk_push(ossl_check_ASN1_INTEGER_sk_type(sk), ossl_check_ASN1_INTEGER_type(ptr))
   --  arg-macro: procedure sk_ASN1_INTEGER_unshift (sk, ptr)
   --    OPENSSL_sk_unshift(ossl_check_ASN1_INTEGER_sk_type(sk), ossl_check_ASN1_INTEGER_type(ptr))
   --  arg-macro: function sk_ASN1_INTEGER_pop (sk)
   --    return (ASN1_INTEGER *)OPENSSL_sk_pop(ossl_check_ASN1_INTEGER_sk_type(sk));
   --  arg-macro: function sk_ASN1_INTEGER_shift (sk)
   --    return (ASN1_INTEGER *)OPENSSL_sk_shift(ossl_check_ASN1_INTEGER_sk_type(sk));
   --  arg-macro: procedure sk_ASN1_INTEGER_pop_free (sk, freefunc)
   --    OPENSSL_sk_pop_free(ossl_check_ASN1_INTEGER_sk_type(sk),ossl_check_ASN1_INTEGER_freefunc_type(freefunc))
   --  arg-macro: procedure sk_ASN1_INTEGER_insert (sk, ptr, idx)
   --    OPENSSL_sk_insert(ossl_check_ASN1_INTEGER_sk_type(sk), ossl_check_ASN1_INTEGER_type(ptr), (idx))
   --  arg-macro: function sk_ASN1_INTEGER_set (sk, idx, ptr)
   --    return (ASN1_INTEGER *)OPENSSL_sk_set(ossl_check_ASN1_INTEGER_sk_type(sk), (idx), ossl_check_ASN1_INTEGER_type(ptr));
   --  arg-macro: procedure sk_ASN1_INTEGER_find (sk, ptr)
   --    OPENSSL_sk_find(ossl_check_ASN1_INTEGER_sk_type(sk), ossl_check_ASN1_INTEGER_type(ptr))
   --  arg-macro: procedure sk_ASN1_INTEGER_find_ex (sk, ptr)
   --    OPENSSL_sk_find_ex(ossl_check_ASN1_INTEGER_sk_type(sk), ossl_check_ASN1_INTEGER_type(ptr))
   --  arg-macro: procedure sk_ASN1_INTEGER_find_all (sk, ptr, pnum)
   --    OPENSSL_sk_find_all(ossl_check_ASN1_INTEGER_sk_type(sk), ossl_check_ASN1_INTEGER_type(ptr), pnum)
   --  arg-macro: procedure sk_ASN1_INTEGER_sort (sk)
   --    OPENSSL_sk_sort(ossl_check_ASN1_INTEGER_sk_type(sk))
   --  arg-macro: procedure sk_ASN1_INTEGER_is_sorted (sk)
   --    OPENSSL_sk_is_sorted(ossl_check_const_ASN1_INTEGER_sk_type(sk))
   --  arg-macro: function sk_ASN1_INTEGER_dup (sk)
   --    return (STACK_OF(ASN1_INTEGER) *)OPENSSL_sk_dup(ossl_check_const_ASN1_INTEGER_sk_type(sk));
   --  arg-macro: function sk_ASN1_INTEGER_deep_copy (sk, copyfunc, freefunc)
   --    return (STACK_OF(ASN1_INTEGER) *)OPENSSL_sk_deep_copy(ossl_check_const_ASN1_INTEGER_sk_type(sk), ossl_check_ASN1_INTEGER_copyfunc_type(copyfunc), ossl_check_ASN1_INTEGER_freefunc_type(freefunc));
   --  arg-macro: function sk_ASN1_INTEGER_set_cmp_func (sk, cmp)
   --    return (sk_ASN1_INTEGER_compfunc)OPENSSL_sk_set_cmp_func(ossl_check_ASN1_INTEGER_sk_type(sk), ossl_check_ASN1_INTEGER_compfunc_type(cmp));
   --  arg-macro: procedure sk_ASN1_UTF8STRING_num (sk)
   --    OPENSSL_sk_num(ossl_check_const_ASN1_UTF8STRING_sk_type(sk))
   --  arg-macro: function sk_ASN1_UTF8STRING_value (sk, idx)
   --    return (ASN1_UTF8STRING *)OPENSSL_sk_value(ossl_check_const_ASN1_UTF8STRING_sk_type(sk), (idx));
   --  arg-macro: function sk_ASN1_UTF8STRING_new (cmp)
   --    return (STACK_OF(ASN1_UTF8STRING) *)OPENSSL_sk_new(ossl_check_ASN1_UTF8STRING_compfunc_type(cmp));
   --  arg-macro: function sk_ASN1_UTF8STRING_new_null ()
   --    return (STACK_OF(ASN1_UTF8STRING) *)OPENSSL_sk_new_null();
   --  arg-macro: function sk_ASN1_UTF8STRING_new_reserve (cmp, n)
   --    return (STACK_OF(ASN1_UTF8STRING) *)OPENSSL_sk_new_reserve(ossl_check_ASN1_UTF8STRING_compfunc_type(cmp), (n));
   --  arg-macro: procedure sk_ASN1_UTF8STRING_reserve (sk, n)
   --    OPENSSL_sk_reserve(ossl_check_ASN1_UTF8STRING_sk_type(sk), (n))
   --  arg-macro: procedure sk_ASN1_UTF8STRING_free (sk)
   --    OPENSSL_sk_free(ossl_check_ASN1_UTF8STRING_sk_type(sk))
   --  arg-macro: procedure sk_ASN1_UTF8STRING_zero (sk)
   --    OPENSSL_sk_zero(ossl_check_ASN1_UTF8STRING_sk_type(sk))
   --  arg-macro: function sk_ASN1_UTF8STRING_delete (sk, i)
   --    return (ASN1_UTF8STRING *)OPENSSL_sk_delete(ossl_check_ASN1_UTF8STRING_sk_type(sk), (i));
   --  arg-macro: function sk_ASN1_UTF8STRING_delete_ptr (sk, ptr)
   --    return (ASN1_UTF8STRING *)OPENSSL_sk_delete_ptr(ossl_check_ASN1_UTF8STRING_sk_type(sk), ossl_check_ASN1_UTF8STRING_type(ptr));
   --  arg-macro: procedure sk_ASN1_UTF8STRING_push (sk, ptr)
   --    OPENSSL_sk_push(ossl_check_ASN1_UTF8STRING_sk_type(sk), ossl_check_ASN1_UTF8STRING_type(ptr))
   --  arg-macro: procedure sk_ASN1_UTF8STRING_unshift (sk, ptr)
   --    OPENSSL_sk_unshift(ossl_check_ASN1_UTF8STRING_sk_type(sk), ossl_check_ASN1_UTF8STRING_type(ptr))
   --  arg-macro: function sk_ASN1_UTF8STRING_pop (sk)
   --    return (ASN1_UTF8STRING *)OPENSSL_sk_pop(ossl_check_ASN1_UTF8STRING_sk_type(sk));
   --  arg-macro: function sk_ASN1_UTF8STRING_shift (sk)
   --    return (ASN1_UTF8STRING *)OPENSSL_sk_shift(ossl_check_ASN1_UTF8STRING_sk_type(sk));
   --  arg-macro: procedure sk_ASN1_UTF8STRING_pop_free (sk, freefunc)
   --    OPENSSL_sk_pop_free(ossl_check_ASN1_UTF8STRING_sk_type(sk),ossl_check_ASN1_UTF8STRING_freefunc_type(freefunc))
   --  arg-macro: procedure sk_ASN1_UTF8STRING_insert (sk, ptr, idx)
   --    OPENSSL_sk_insert(ossl_check_ASN1_UTF8STRING_sk_type(sk), ossl_check_ASN1_UTF8STRING_type(ptr), (idx))
   --  arg-macro: function sk_ASN1_UTF8STRING_set (sk, idx, ptr)
   --    return (ASN1_UTF8STRING *)OPENSSL_sk_set(ossl_check_ASN1_UTF8STRING_sk_type(sk), (idx), ossl_check_ASN1_UTF8STRING_type(ptr));
   --  arg-macro: procedure sk_ASN1_UTF8STRING_find (sk, ptr)
   --    OPENSSL_sk_find(ossl_check_ASN1_UTF8STRING_sk_type(sk), ossl_check_ASN1_UTF8STRING_type(ptr))
   --  arg-macro: procedure sk_ASN1_UTF8STRING_find_ex (sk, ptr)
   --    OPENSSL_sk_find_ex(ossl_check_ASN1_UTF8STRING_sk_type(sk), ossl_check_ASN1_UTF8STRING_type(ptr))
   --  arg-macro: procedure sk_ASN1_UTF8STRING_find_all (sk, ptr, pnum)
   --    OPENSSL_sk_find_all(ossl_check_ASN1_UTF8STRING_sk_type(sk), ossl_check_ASN1_UTF8STRING_type(ptr), pnum)
   --  arg-macro: procedure sk_ASN1_UTF8STRING_sort (sk)
   --    OPENSSL_sk_sort(ossl_check_ASN1_UTF8STRING_sk_type(sk))
   --  arg-macro: procedure sk_ASN1_UTF8STRING_is_sorted (sk)
   --    OPENSSL_sk_is_sorted(ossl_check_const_ASN1_UTF8STRING_sk_type(sk))
   --  arg-macro: function sk_ASN1_UTF8STRING_dup (sk)
   --    return (STACK_OF(ASN1_UTF8STRING) *)OPENSSL_sk_dup(ossl_check_const_ASN1_UTF8STRING_sk_type(sk));
   --  arg-macro: function sk_ASN1_UTF8STRING_deep_copy (sk, copyfunc, freefunc)
   --    return (STACK_OF(ASN1_UTF8STRING) *)OPENSSL_sk_deep_copy(ossl_check_const_ASN1_UTF8STRING_sk_type(sk), ossl_check_ASN1_UTF8STRING_copyfunc_type(copyfunc), ossl_check_ASN1_UTF8STRING_freefunc_type(freefunc));
   --  arg-macro: function sk_ASN1_UTF8STRING_set_cmp_func (sk, cmp)
   --    return (sk_ASN1_UTF8STRING_compfunc)OPENSSL_sk_set_cmp_func(ossl_check_ASN1_UTF8STRING_sk_type(sk), ossl_check_ASN1_UTF8STRING_compfunc_type(cmp));
   --  arg-macro: procedure sk_ASN1_GENERALSTRING_num (sk)
   --    OPENSSL_sk_num(ossl_check_const_ASN1_GENERALSTRING_sk_type(sk))
   --  arg-macro: function sk_ASN1_GENERALSTRING_value (sk, idx)
   --    return (ASN1_GENERALSTRING *)OPENSSL_sk_value(ossl_check_const_ASN1_GENERALSTRING_sk_type(sk), (idx));
   --  arg-macro: function sk_ASN1_GENERALSTRING_new (cmp)
   --    return (STACK_OF(ASN1_GENERALSTRING) *)OPENSSL_sk_new(ossl_check_ASN1_GENERALSTRING_compfunc_type(cmp));
   --  arg-macro: function sk_ASN1_GENERALSTRING_new_null ()
   --    return (STACK_OF(ASN1_GENERALSTRING) *)OPENSSL_sk_new_null();
   --  arg-macro: function sk_ASN1_GENERALSTRING_new_reserve (cmp, n)
   --    return (STACK_OF(ASN1_GENERALSTRING) *)OPENSSL_sk_new_reserve(ossl_check_ASN1_GENERALSTRING_compfunc_type(cmp), (n));
   --  arg-macro: procedure sk_ASN1_GENERALSTRING_reserve (sk, n)
   --    OPENSSL_sk_reserve(ossl_check_ASN1_GENERALSTRING_sk_type(sk), (n))
   --  arg-macro: procedure sk_ASN1_GENERALSTRING_free (sk)
   --    OPENSSL_sk_free(ossl_check_ASN1_GENERALSTRING_sk_type(sk))
   --  arg-macro: procedure sk_ASN1_GENERALSTRING_zero (sk)
   --    OPENSSL_sk_zero(ossl_check_ASN1_GENERALSTRING_sk_type(sk))
   --  arg-macro: function sk_ASN1_GENERALSTRING_delete (sk, i)
   --    return (ASN1_GENERALSTRING *)OPENSSL_sk_delete(ossl_check_ASN1_GENERALSTRING_sk_type(sk), (i));
   --  arg-macro: function sk_ASN1_GENERALSTRING_delete_ptr (sk, ptr)
   --    return (ASN1_GENERALSTRING *)OPENSSL_sk_delete_ptr(ossl_check_ASN1_GENERALSTRING_sk_type(sk), ossl_check_ASN1_GENERALSTRING_type(ptr));
   --  arg-macro: procedure sk_ASN1_GENERALSTRING_push (sk, ptr)
   --    OPENSSL_sk_push(ossl_check_ASN1_GENERALSTRING_sk_type(sk), ossl_check_ASN1_GENERALSTRING_type(ptr))
   --  arg-macro: procedure sk_ASN1_GENERALSTRING_unshift (sk, ptr)
   --    OPENSSL_sk_unshift(ossl_check_ASN1_GENERALSTRING_sk_type(sk), ossl_check_ASN1_GENERALSTRING_type(ptr))
   --  arg-macro: function sk_ASN1_GENERALSTRING_pop (sk)
   --    return (ASN1_GENERALSTRING *)OPENSSL_sk_pop(ossl_check_ASN1_GENERALSTRING_sk_type(sk));
   --  arg-macro: function sk_ASN1_GENERALSTRING_shift (sk)
   --    return (ASN1_GENERALSTRING *)OPENSSL_sk_shift(ossl_check_ASN1_GENERALSTRING_sk_type(sk));
   --  arg-macro: procedure sk_ASN1_GENERALSTRING_pop_free (sk, freefunc)
   --    OPENSSL_sk_pop_free(ossl_check_ASN1_GENERALSTRING_sk_type(sk),ossl_check_ASN1_GENERALSTRING_freefunc_type(freefunc))
   --  arg-macro: procedure sk_ASN1_GENERALSTRING_insert (sk, ptr, idx)
   --    OPENSSL_sk_insert(ossl_check_ASN1_GENERALSTRING_sk_type(sk), ossl_check_ASN1_GENERALSTRING_type(ptr), (idx))
   --  arg-macro: function sk_ASN1_GENERALSTRING_set (sk, idx, ptr)
   --    return (ASN1_GENERALSTRING *)OPENSSL_sk_set(ossl_check_ASN1_GENERALSTRING_sk_type(sk), (idx), ossl_check_ASN1_GENERALSTRING_type(ptr));
   --  arg-macro: procedure sk_ASN1_GENERALSTRING_find (sk, ptr)
   --    OPENSSL_sk_find(ossl_check_ASN1_GENERALSTRING_sk_type(sk), ossl_check_ASN1_GENERALSTRING_type(ptr))
   --  arg-macro: procedure sk_ASN1_GENERALSTRING_find_ex (sk, ptr)
   --    OPENSSL_sk_find_ex(ossl_check_ASN1_GENERALSTRING_sk_type(sk), ossl_check_ASN1_GENERALSTRING_type(ptr))
   --  arg-macro: procedure sk_ASN1_GENERALSTRING_find_all (sk, ptr, pnum)
   --    OPENSSL_sk_find_all(ossl_check_ASN1_GENERALSTRING_sk_type(sk), ossl_check_ASN1_GENERALSTRING_type(ptr), pnum)
   --  arg-macro: procedure sk_ASN1_GENERALSTRING_sort (sk)
   --    OPENSSL_sk_sort(ossl_check_ASN1_GENERALSTRING_sk_type(sk))
   --  arg-macro: procedure sk_ASN1_GENERALSTRING_is_sorted (sk)
   --    OPENSSL_sk_is_sorted(ossl_check_const_ASN1_GENERALSTRING_sk_type(sk))
   --  arg-macro: function sk_ASN1_GENERALSTRING_dup (sk)
   --    return (STACK_OF(ASN1_GENERALSTRING) *)OPENSSL_sk_dup(ossl_check_const_ASN1_GENERALSTRING_sk_type(sk));
   --  arg-macro: function sk_ASN1_GENERALSTRING_deep_copy (sk, copyfunc, freefunc)
   --    return (STACK_OF(ASN1_GENERALSTRING) *)OPENSSL_sk_deep_copy(ossl_check_const_ASN1_GENERALSTRING_sk_type(sk), ossl_check_ASN1_GENERALSTRING_copyfunc_type(copyfunc), ossl_check_ASN1_GENERALSTRING_freefunc_type(freefunc));
   --  arg-macro: function sk_ASN1_GENERALSTRING_set_cmp_func (sk, cmp)
   --    return (sk_ASN1_GENERALSTRING_compfunc)OPENSSL_sk_set_cmp_func(ossl_check_ASN1_GENERALSTRING_sk_type(sk), ossl_check_ASN1_GENERALSTRING_compfunc_type(cmp));
   --  arg-macro: function ASN1_dup_of (type, i2d, d2i, x)
   --    return (type*)ASN1_dup(CHECKED_I2D_OF(type, i2d), CHECKED_D2I_OF(type, d2i), CHECKED_PTR_OF(const type, x));
   --  arg-macro: function M_ASN1_new_of (type)
   --    return type *)ASN1_item_new(ASN1_ITEM_rptr(type);
   --  arg-macro: procedure M_ASN1_free_of (x, type)
   --    ASN1_item_free(CHECKED_PTR_OF(type, x), ASN1_ITEM_rptr(type))
   --  arg-macro: function ASN1_d2i_fp_of (type, xnew, d2i, in, x)
   --    return (type*)ASN1_d2i_fp(CHECKED_NEW_OF(type, xnew), CHECKED_D2I_OF(type, d2i), in, CHECKED_PPTR_OF(type, x));
   --  arg-macro: function ASN1_i2d_fp_of (type, i2d, out, x)
   --    return ASN1_i2d_fp(CHECKED_I2D_OF(type, i2d), out, CHECKED_PTR_OF(const type, x));
   --  arg-macro: function ASN1_d2i_bio_of (type, xnew, d2i, in, x)
   --    return (type*)ASN1_d2i_bio( CHECKED_NEW_OF(type, xnew), CHECKED_D2I_OF(type, d2i), in, CHECKED_PPTR_OF(type, x));
   --  arg-macro: function ASN1_i2d_bio_of (type, i2d, out, x)
   --    return ASN1_i2d_bio(CHECKED_I2D_OF(type, i2d), out, CHECKED_PTR_OF(const type, x));

   ASN1_PCTX_FLAGS_SHOW_ABSENT : constant := 16#001#;  --  /usr/include/openssl/asn1.h:1050

   ASN1_PCTX_FLAGS_SHOW_SEQUENCE : constant := 16#002#;  --  /usr/include/openssl/asn1.h:1052

   ASN1_PCTX_FLAGS_SHOW_SSOF : constant := 16#004#;  --  /usr/include/openssl/asn1.h:1054

   ASN1_PCTX_FLAGS_SHOW_TYPE : constant := 16#008#;  --  /usr/include/openssl/asn1.h:1056

   ASN1_PCTX_FLAGS_NO_ANY_TYPE : constant := 16#010#;  --  /usr/include/openssl/asn1.h:1058

   ASN1_PCTX_FLAGS_NO_MSTRING_TYPE : constant := 16#020#;  --  /usr/include/openssl/asn1.h:1060

   ASN1_PCTX_FLAGS_NO_FIELD_NAME : constant := 16#040#;  --  /usr/include/openssl/asn1.h:1062

   ASN1_PCTX_FLAGS_SHOW_FIELD_STRUCT_NAME : constant := 16#080#;  --  /usr/include/openssl/asn1.h:1064

   ASN1_PCTX_FLAGS_NO_STRUCT_NAME : constant := 16#100#;  --  /usr/include/openssl/asn1.h:1066
   --  arg-macro: procedure DECLARE_ASN1_FUNCTIONS_fname (type, itname, name)
   --    DECLARE_ASN1_ALLOC_FUNCTIONS_name(type, name) DECLARE_ASN1_ENCODE_FUNCTIONS(type, itname, name)
   --  arg-macro: procedure DECLARE_ASN1_FUNCTIONS_const (type)
   --    DECLARE_ASN1_FUNCTIONS(type)
   --  arg-macro: procedure DECLARE_ASN1_ENCODE_FUNCTIONS_const (type, name)
   --    DECLARE_ASN1_ENCODE_FUNCTIONS(type, name)
   --  arg-macro: procedure I2D_OF_const (type)
   --    I2D_OF(type)
   --  arg-macro: procedure ASN1_dup_of_const (type, i2d, d2i, x)
   --    ASN1_dup_of(type,i2d,d2i,x)
   --  arg-macro: procedure ASN1_i2d_fp_of_const (type, i2d, out, x)
   --    ASN1_i2d_fp_of(type,i2d,out,x)
   --  arg-macro: procedure ASN1_i2d_bio_of_const (type, i2d, out, x)
   --    ASN1_i2d_bio_of(type,i2d,out,x)

  -- * WARNING: do not edit!
  -- * Generated by Makefile from include/openssl/asn1.h.in
  -- *
  -- * Copyright 1995-2023 The OpenSSL Project Authors. All Rights Reserved.
  -- *
  -- * Licensed under the Apache License 2.0 (the "License").  You may not use
  -- * this file except in compliance with the License.  You can obtain a copy
  -- * in the file LICENSE in the source distribution or at
  -- * https://www.openssl.org/source/license.html
  --  

  -- ASN.1 tag values  
  -- * NB the constants below are used internally by ASN1_INTEGER
  -- * and ASN1_ENUMERATED to indicate the sign. They are *not* on
  -- * the wire tag values.
  --  

  -- For use with d2i_ASN1_type_bytes()  
  -- For use with ASN1_mbstring_copy()  
  -- Stacks for types not otherwise defined in this header  
   type stack_st_X509_ALGOR is null record;   -- incomplete struct

   type sk_X509_ALGOR_compfunc is access function (arg1 : System.Address; arg2 : System.Address) return int
   with Convention => C;  -- /usr/include/openssl/asn1.h:132

   type sk_X509_ALGOR_freefunc is access procedure (arg1 : access openssl_types_h.X509_algor_st)
   with Convention => C;  -- /usr/include/openssl/asn1.h:132

   type sk_X509_ALGOR_copyfunc is access function (arg1 : access constant openssl_types_h.X509_algor_st) return access openssl_types_h.X509_algor_st
   with Convention => C;  -- /usr/include/openssl/asn1.h:132

   function ossl_check_X509_ALGOR_type (ptr : access openssl_types_h.X509_algor_st) return access openssl_types_h.X509_algor_st  -- /usr/include/openssl/asn1.h:132
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_X509_ALGOR_type";

   function ossl_check_const_X509_ALGOR_sk_type (sk : access constant stack_st_X509_ALGOR) return access constant openssl_stack_h.stack_st  -- /usr/include/openssl/asn1.h:132
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_const_X509_ALGOR_sk_type";

   function ossl_check_X509_ALGOR_sk_type (sk : access stack_st_X509_ALGOR) return access openssl_stack_h.stack_st  -- /usr/include/openssl/asn1.h:132
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_X509_ALGOR_sk_type";

   function ossl_check_X509_ALGOR_compfunc_type (cmp : sk_X509_ALGOR_compfunc) return openssl_stack_h.OPENSSL_sk_compfunc  -- /usr/include/openssl/asn1.h:132
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_X509_ALGOR_compfunc_type";

   function ossl_check_X509_ALGOR_copyfunc_type (cpy : sk_X509_ALGOR_copyfunc) return openssl_stack_h.OPENSSL_sk_copyfunc  -- /usr/include/openssl/asn1.h:132
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_X509_ALGOR_copyfunc_type";

   function ossl_check_X509_ALGOR_freefunc_type (fr : sk_X509_ALGOR_freefunc) return openssl_stack_h.OPENSSL_sk_freefunc  -- /usr/include/openssl/asn1.h:132
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_X509_ALGOR_freefunc_type";

  -- * This indicates that the ASN1_STRING is not a real value but just a place
  -- * holder for the location where indefinite length constructed data should be
  -- * inserted in the memory buffer
  --  

  -- * This flag is used by the CMS code to indicate that a string is not
  -- * complete and is a place holder for content when it had all been accessed.
  -- * The flag will be reset when content has been written to it.
  --  

  -- * This flag is used by ASN1 code to indicate an ASN1_STRING is an MSTRING
  -- * type.
  --  

  -- String is embedded and only content should be freed  
  -- String should be parsed in RFC 5280's time format  
  -- This is the base type that holds just about everything :-)  
   type asn1_string_st is record
      length : aliased int;  -- /usr/include/openssl/asn1.h:187
      c_type : aliased int;  -- /usr/include/openssl/asn1.h:188
      data : access unsigned_char;  -- /usr/include/openssl/asn1.h:189
      flags : aliased long;  -- /usr/include/openssl/asn1.h:195
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/openssl/asn1.h:186

  --     * The value of the following field depends on the type being held.  It
  --     * is mostly being used for BIT_STRING so if the input data has a
  --     * non-zero 'unused bits' value, it will be handled correctly
  --      

  -- * ASN1_ENCODING structure: this is used to save the received encoding of an
  -- * ASN1 type. This is useful to get round problems with invalid encodings
  -- * which can break signatures.
  --  

  -- DER encoding  
   type ASN1_ENCODING_st is record
      enc : access unsigned_char;  -- /usr/include/openssl/asn1.h:205
      len : aliased long;  -- /usr/include/openssl/asn1.h:206
      modified : aliased int;  -- /usr/include/openssl/asn1.h:207
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/openssl/asn1.h:204

  -- Length of encoding  
  -- set to 1 if 'enc' is invalid  
   subtype ASN1_ENCODING is ASN1_ENCODING_st;  -- /usr/include/openssl/asn1.h:208

  -- Used with ASN1 LONG type: if a long is set to this it is omitted  
  -- * A zero passed to ASN1_STRING_TABLE_new_add for the flags is interpreted
  -- * as "don't change" and STABLE_FLAGS_MALLOC is always set. By setting
  -- * STABLE_FLAGS_MALLOC only we can clear the existing value. Use the alias
  -- * STABLE_FLAGS_CLEAR to reflect this.
  --  

   type asn1_string_table_st is record
      nid : aliased int;  -- /usr/include/openssl/asn1.h:227
      minsize : aliased long;  -- /usr/include/openssl/asn1.h:228
      maxsize : aliased long;  -- /usr/include/openssl/asn1.h:229
      mask : aliased unsigned_long;  -- /usr/include/openssl/asn1.h:230
      flags : aliased unsigned_long;  -- /usr/include/openssl/asn1.h:231
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/openssl/asn1.h:226

   type stack_st_ASN1_STRING_TABLE is null record;   -- incomplete struct

   type sk_ASN1_STRING_TABLE_compfunc is access function (arg1 : System.Address; arg2 : System.Address) return int
   with Convention => C;  -- /usr/include/openssl/asn1.h:234

   type sk_ASN1_STRING_TABLE_freefunc is access procedure (arg1 : access asn1_string_table_st)
   with Convention => C;  -- /usr/include/openssl/asn1.h:234

   type sk_ASN1_STRING_TABLE_copyfunc is access function (arg1 : access constant asn1_string_table_st) return access asn1_string_table_st
   with Convention => C;  -- /usr/include/openssl/asn1.h:234

   function ossl_check_ASN1_STRING_TABLE_type (ptr : access asn1_string_table_st) return access asn1_string_table_st  -- /usr/include/openssl/asn1.h:234
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_STRING_TABLE_type";

   function ossl_check_const_ASN1_STRING_TABLE_sk_type (sk : access constant stack_st_ASN1_STRING_TABLE) return access constant openssl_stack_h.stack_st  -- /usr/include/openssl/asn1.h:234
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_const_ASN1_STRING_TABLE_sk_type";

   function ossl_check_ASN1_STRING_TABLE_sk_type (sk : access stack_st_ASN1_STRING_TABLE) return access openssl_stack_h.stack_st  -- /usr/include/openssl/asn1.h:234
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_STRING_TABLE_sk_type";

   function ossl_check_ASN1_STRING_TABLE_compfunc_type (cmp : sk_ASN1_STRING_TABLE_compfunc) return openssl_stack_h.OPENSSL_sk_compfunc  -- /usr/include/openssl/asn1.h:234
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_STRING_TABLE_compfunc_type";

   function ossl_check_ASN1_STRING_TABLE_copyfunc_type (cpy : sk_ASN1_STRING_TABLE_copyfunc) return openssl_stack_h.OPENSSL_sk_copyfunc  -- /usr/include/openssl/asn1.h:234
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_STRING_TABLE_copyfunc_type";

   function ossl_check_ASN1_STRING_TABLE_freefunc_type (fr : sk_ASN1_STRING_TABLE_freefunc) return openssl_stack_h.OPENSSL_sk_freefunc  -- /usr/include/openssl/asn1.h:234
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_STRING_TABLE_freefunc_type";

  -- size limits: this stuff is taken straight from RFC2459  
  -- * Declarations for template structures: for full definitions see asn1t.h
  --  

   type ASN1_TEMPLATE_st is null record;   -- incomplete struct

   subtype ASN1_TEMPLATE is ASN1_TEMPLATE_st;  -- /usr/include/openssl/asn1.h:276

   type ASN1_TLC_st is null record;   -- incomplete struct

   subtype ASN1_TLC is ASN1_TLC_st;  -- /usr/include/openssl/asn1.h:277

  -- This is just an opaque pointer  
   type ASN1_VALUE_st is null record;   -- incomplete struct

   subtype ASN1_VALUE is ASN1_VALUE_st;  -- /usr/include/openssl/asn1.h:279

  -- Declare ASN1 functions: the implement macro in in asn1t.h  
  -- * The mysterious 'extern' that's passed to some macros is innocuous,
  -- * and is there to quiet pre-C99 compilers that may complain about empty
  -- * arguments in macro calls.
  --  

   --  skipped function type d2i_of_void

   --  skipped function type i2d_of_void

  ---
  -- * The following macros and typedefs allow an ASN1_ITEM
  -- * to be embedded in a structure and referenced. Since
  -- * the ASN1_ITEM pointers need to be globally accessible
  -- * (possibly from shared libraries) they may exist in
  -- * different forms. On platforms that support it the
  -- * ASN1_ITEM structure itself will be globally exported.
  -- * Other platforms will export a function that returns
  -- * an ASN1_ITEM pointer.
  -- *
  -- * To handle both cases transparently the macros below
  -- * should be used instead of hard coding an ASN1_ITEM
  -- * pointer in a structure.
  -- *
  -- * The structure will look like this:
  -- *
  -- * typedef struct SOMETHING_st {
  -- *      ...
  -- *      ASN1_ITEM_EXP *iptr;
  -- *      ...
  -- * } SOMETHING;
  -- *
  -- * It would be initialised as e.g.:
  -- *
  -- * SOMETHING somevar = {...,ASN1_ITEM_ref(X509),...};
  -- *
  -- * and the actual pointer extracted with:
  -- *
  -- * const ASN1_ITEM *it = ASN1_ITEM_ptr(somevar.iptr);
  -- *
  -- * Finally an ASN1_ITEM pointer can be extracted from an
  -- * appropriate reference with: ASN1_ITEM_rptr(X509). This
  -- * would be used when a function takes an ASN1_ITEM * argument.
  -- *
  --  

  -- * Platforms that can't easily handle shared global variables are declared as
  -- * functions returning ASN1_ITEM pointers.
  --  

  -- ASN1_ITEM pointer exported type  
   --  skipped function type ASN1_ITEM_EXP

  -- Macro to obtain ASN1_ITEM pointer from exported type  
  -- Macro to include ASN1_ITEM pointer from base type  
  -- Parameters used by ASN1_STRING_print_ex()  
  -- * These determine which characters to escape: RFC2253 special characters,
  -- * control characters and MSB set characters
  --  

  -- Lower 8 bits are reserved as an output type specifier  
  -- * This flag determines how we do escaping: normally RC2253 backslash only,
  -- * set this to use backslash and quote.
  --  

  -- These three flags are internal use only.  
  -- Character is a valid PrintableString character  
  -- Character needs escaping if it is the first character  
  -- Character needs escaping if it is the last character  
  -- * NB the internal flags are safely reused below by flags handled at the top
  -- * level.
  --  

  -- * If this is set we convert all character strings to UTF8 first
  --  

  -- * If this is set we don't attempt to interpret content: just assume all
  -- * strings are 1 byte per character. This will produce some pretty odd
  -- * looking output!
  --  

  -- If this is set we include the string type in the output  
  -- * This determines which strings to display and which to 'dump' (hex dump of
  -- * content octets or DER encoding). We can only dump non character strings or
  -- * everything. If we don't dump 'unknown' they are interpreted as character
  -- * strings with 1 octet per character and are subject to the usual escaping
  -- * options.
  --  

  -- * These determine what 'dumping' does, we can dump the content octets or the
  -- * DER encoding: both use the RFC2253 #XXXXX notation.
  --  

  -- * This flag specifies that RC2254 escaping shall be performed.
  --  

  -- * All the string flags consistent with RFC2253, escaping control characters
  -- * isn't essential in RFC2253 but it is advisable anyway.
  --  

   type anon_union4391 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ptr : Interfaces.C.Strings.chars_ptr;  -- /usr/include/openssl/asn1.h:526
         when 1 =>
            boolean : aliased openssl_types_h.ASN1_BOOLEAN;  -- /usr/include/openssl/asn1.h:527
         when 2 =>
            the_asn1_string : access asn1_string_st;  -- /usr/include/openssl/asn1.h:528
         when 3 =>
            object : access openssl_types_h.asn1_object_st;  -- /usr/include/openssl/asn1.h:529
         when 4 =>
            integer : access asn1_string_st;  -- /usr/include/openssl/asn1.h:530
         when 5 =>
            enumerated : access asn1_string_st;  -- /usr/include/openssl/asn1.h:531
         when 6 =>
            bit_string : access asn1_string_st;  -- /usr/include/openssl/asn1.h:532
         when 7 =>
            octet_string : access asn1_string_st;  -- /usr/include/openssl/asn1.h:533
         when 8 =>
            printablestring : access asn1_string_st;  -- /usr/include/openssl/asn1.h:534
         when 9 =>
            t61string : access asn1_string_st;  -- /usr/include/openssl/asn1.h:535
         when 10 =>
            ia5string : access asn1_string_st;  -- /usr/include/openssl/asn1.h:536
         when 11 =>
            generalstring : access asn1_string_st;  -- /usr/include/openssl/asn1.h:537
         when 12 =>
            bmpstring : access asn1_string_st;  -- /usr/include/openssl/asn1.h:538
         when 13 =>
            universalstring : access asn1_string_st;  -- /usr/include/openssl/asn1.h:539
         when 14 =>
            utctime : access asn1_string_st;  -- /usr/include/openssl/asn1.h:540
         when 15 =>
            generalizedtime : access asn1_string_st;  -- /usr/include/openssl/asn1.h:541
         when 16 =>
            visiblestring : access asn1_string_st;  -- /usr/include/openssl/asn1.h:542
         when 17 =>
            utf8string : access asn1_string_st;  -- /usr/include/openssl/asn1.h:543
         when 18 =>
            set : access asn1_string_st;  -- /usr/include/openssl/asn1.h:548
         when 19 =>
            sequence : access asn1_string_st;  -- /usr/include/openssl/asn1.h:549
         when others =>
            the_asn1_value : access ASN1_VALUE;  -- /usr/include/openssl/asn1.h:550
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type asn1_type_st is record
      c_type : aliased int;  -- /usr/include/openssl/asn1.h:524
      value : aliased anon_union4391;  -- /usr/include/openssl/asn1.h:551
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/openssl/asn1.h:523

  --         * set and sequence are left complete and still contain the set or
  --         * sequence bytes
  --          

   type stack_st_ASN1_TYPE is null record;   -- incomplete struct

   type sk_ASN1_TYPE_compfunc is access function (arg1 : System.Address; arg2 : System.Address) return int
   with Convention => C;  -- /usr/include/openssl/asn1.h:554

   type sk_ASN1_TYPE_freefunc is access procedure (arg1 : access asn1_type_st)
   with Convention => C;  -- /usr/include/openssl/asn1.h:554

   type sk_ASN1_TYPE_copyfunc is access function (arg1 : access constant asn1_type_st) return access asn1_type_st
   with Convention => C;  -- /usr/include/openssl/asn1.h:554

   function ossl_check_ASN1_TYPE_type (ptr : access asn1_type_st) return access asn1_type_st  -- /usr/include/openssl/asn1.h:554
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_TYPE_type";

   function ossl_check_const_ASN1_TYPE_sk_type (sk : access constant stack_st_ASN1_TYPE) return access constant openssl_stack_h.stack_st  -- /usr/include/openssl/asn1.h:554
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_const_ASN1_TYPE_sk_type";

   function ossl_check_ASN1_TYPE_sk_type (sk : access stack_st_ASN1_TYPE) return access openssl_stack_h.stack_st  -- /usr/include/openssl/asn1.h:554
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_TYPE_sk_type";

   function ossl_check_ASN1_TYPE_compfunc_type (cmp : sk_ASN1_TYPE_compfunc) return openssl_stack_h.OPENSSL_sk_compfunc  -- /usr/include/openssl/asn1.h:554
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_TYPE_compfunc_type";

   function ossl_check_ASN1_TYPE_copyfunc_type (cpy : sk_ASN1_TYPE_copyfunc) return openssl_stack_h.OPENSSL_sk_copyfunc  -- /usr/include/openssl/asn1.h:554
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_TYPE_copyfunc_type";

   function ossl_check_ASN1_TYPE_freefunc_type (fr : sk_ASN1_TYPE_freefunc) return openssl_stack_h.OPENSSL_sk_freefunc  -- /usr/include/openssl/asn1.h:554
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_TYPE_freefunc_type";

   subtype ASN1_SEQUENCE_ANY is stack_st_ASN1_TYPE;  -- /usr/include/openssl/asn1.h:582

   function d2i_ASN1_SEQUENCE_ANY
     (a : System.Address;
      c_in : System.Address;
      len : long) return access ASN1_SEQUENCE_ANY  -- /usr/include/openssl/asn1.h:584
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_ASN1_SEQUENCE_ANY";

   function i2d_ASN1_SEQUENCE_ANY (a : access constant ASN1_SEQUENCE_ANY; c_out : System.Address) return int  -- /usr/include/openssl/asn1.h:584
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_ASN1_SEQUENCE_ANY";

   function ASN1_SEQUENCE_ANY_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:584
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_SEQUENCE_ANY_it";

   function d2i_ASN1_SET_ANY
     (a : System.Address;
      c_in : System.Address;
      len : long) return access ASN1_SEQUENCE_ANY  -- /usr/include/openssl/asn1.h:585
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_ASN1_SET_ANY";

   function i2d_ASN1_SET_ANY (a : access constant ASN1_SEQUENCE_ANY; c_out : System.Address) return int  -- /usr/include/openssl/asn1.h:585
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_ASN1_SET_ANY";

   function ASN1_SET_ANY_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:585
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_SET_ANY_it";

  -- This is used to contain a list of bit names  
   type BIT_STRING_BITNAME_st is record
      bitnum : aliased int;  -- /usr/include/openssl/asn1.h:589
      lname : Interfaces.C.Strings.chars_ptr;  -- /usr/include/openssl/asn1.h:590
      sname : Interfaces.C.Strings.chars_ptr;  -- /usr/include/openssl/asn1.h:591
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/openssl/asn1.h:588

   subtype BIT_STRING_BITNAME is BIT_STRING_BITNAME_st;  -- /usr/include/openssl/asn1.h:592

   function ASN1_TYPE_new return access asn1_type_st  -- /usr/include/openssl/asn1.h:623
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TYPE_new";

   procedure ASN1_TYPE_free (a : access asn1_type_st)  -- /usr/include/openssl/asn1.h:623
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TYPE_free";

   function d2i_ASN1_TYPE
     (a : System.Address;
      c_in : System.Address;
      len : long) return access asn1_type_st  -- /usr/include/openssl/asn1.h:624
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_ASN1_TYPE";

   function i2d_ASN1_TYPE (a : access constant asn1_type_st; c_out : System.Address) return int  -- /usr/include/openssl/asn1.h:624
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_ASN1_TYPE";

   function ASN1_ANY_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:624
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_ANY_it";

   function ASN1_TYPE_get (a : access constant asn1_type_st) return int  -- /usr/include/openssl/asn1.h:626
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TYPE_get";

   procedure ASN1_TYPE_set
     (a : access asn1_type_st;
      c_type : int;
      value : System.Address)  -- /usr/include/openssl/asn1.h:627
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TYPE_set";

   function ASN1_TYPE_set1
     (a : access asn1_type_st;
      c_type : int;
      value : System.Address) return int  -- /usr/include/openssl/asn1.h:628
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TYPE_set1";

   function ASN1_TYPE_cmp (a : access constant asn1_type_st; b : access constant asn1_type_st) return int  -- /usr/include/openssl/asn1.h:629
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TYPE_cmp";

   function ASN1_TYPE_pack_sequence
     (it : access constant openssl_types_h.ASN1_ITEM_st;
      s : System.Address;
      t : System.Address) return access asn1_type_st  -- /usr/include/openssl/asn1.h:631
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TYPE_pack_sequence";

   function ASN1_TYPE_unpack_sequence (it : access constant openssl_types_h.ASN1_ITEM_st; t : access constant asn1_type_st) return System.Address  -- /usr/include/openssl/asn1.h:632
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TYPE_unpack_sequence";

   type stack_st_ASN1_OBJECT is null record;   -- incomplete struct

   type sk_ASN1_OBJECT_compfunc is access function (arg1 : System.Address; arg2 : System.Address) return int
   with Convention => C;  -- /usr/include/openssl/asn1.h:634

   type sk_ASN1_OBJECT_freefunc is access procedure (arg1 : access openssl_types_h.asn1_object_st)
   with Convention => C;  -- /usr/include/openssl/asn1.h:634

   type sk_ASN1_OBJECT_copyfunc is access function (arg1 : access constant openssl_types_h.asn1_object_st) return access openssl_types_h.asn1_object_st
   with Convention => C;  -- /usr/include/openssl/asn1.h:634

   function ossl_check_ASN1_OBJECT_type (ptr : access openssl_types_h.asn1_object_st) return access openssl_types_h.asn1_object_st  -- /usr/include/openssl/asn1.h:634
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_OBJECT_type";

   function ossl_check_const_ASN1_OBJECT_sk_type (sk : access constant stack_st_ASN1_OBJECT) return access constant openssl_stack_h.stack_st  -- /usr/include/openssl/asn1.h:634
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_const_ASN1_OBJECT_sk_type";

   function ossl_check_ASN1_OBJECT_sk_type (sk : access stack_st_ASN1_OBJECT) return access openssl_stack_h.stack_st  -- /usr/include/openssl/asn1.h:634
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_OBJECT_sk_type";

   function ossl_check_ASN1_OBJECT_compfunc_type (cmp : sk_ASN1_OBJECT_compfunc) return openssl_stack_h.OPENSSL_sk_compfunc  -- /usr/include/openssl/asn1.h:634
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_OBJECT_compfunc_type";

   function ossl_check_ASN1_OBJECT_copyfunc_type (cpy : sk_ASN1_OBJECT_copyfunc) return openssl_stack_h.OPENSSL_sk_copyfunc  -- /usr/include/openssl/asn1.h:634
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_OBJECT_copyfunc_type";

   function ossl_check_ASN1_OBJECT_freefunc_type (fr : sk_ASN1_OBJECT_freefunc) return openssl_stack_h.OPENSSL_sk_freefunc  -- /usr/include/openssl/asn1.h:634
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_OBJECT_freefunc_type";

   function ASN1_OBJECT_new return access openssl_types_h.asn1_object_st  -- /usr/include/openssl/asn1.h:662
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_OBJECT_new";

   procedure ASN1_OBJECT_free (a : access openssl_types_h.asn1_object_st)  -- /usr/include/openssl/asn1.h:662
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_OBJECT_free";

   function d2i_ASN1_OBJECT
     (a : System.Address;
      c_in : System.Address;
      len : long) return access openssl_types_h.asn1_object_st  -- /usr/include/openssl/asn1.h:662
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_ASN1_OBJECT";

   function i2d_ASN1_OBJECT (a : access constant openssl_types_h.asn1_object_st; c_out : System.Address) return int  -- /usr/include/openssl/asn1.h:662
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_ASN1_OBJECT";

   function ASN1_OBJECT_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:662
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_OBJECT_it";

   function ASN1_STRING_new return access asn1_string_st  -- /usr/include/openssl/asn1.h:664
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_new";

   procedure ASN1_STRING_free (a : access asn1_string_st)  -- /usr/include/openssl/asn1.h:665
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_free";

   procedure ASN1_STRING_clear_free (a : access asn1_string_st)  -- /usr/include/openssl/asn1.h:666
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_clear_free";

   function ASN1_STRING_copy (dst : access asn1_string_st; str : access constant asn1_string_st) return int  -- /usr/include/openssl/asn1.h:667
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_copy";

   function ASN1_STRING_dup (a : access constant asn1_string_st) return access asn1_string_st  -- /usr/include/openssl/asn1.h:668
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_dup";

   function ASN1_STRING_type_new (c_type : int) return access asn1_string_st  -- /usr/include/openssl/asn1.h:669
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_type_new";

   function ASN1_STRING_cmp (a : access constant asn1_string_st; b : access constant asn1_string_st) return int  -- /usr/include/openssl/asn1.h:670
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_cmp";

  --   * Since this is used to store all sorts of things, via macros, for now,
  --   * make its data void *
  --    

   function ASN1_STRING_set
     (str : access asn1_string_st;
      data : System.Address;
      len : int) return int  -- /usr/include/openssl/asn1.h:675
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_set";

   procedure ASN1_STRING_set0
     (str : access asn1_string_st;
      data : System.Address;
      len : int)  -- /usr/include/openssl/asn1.h:676
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_set0";

   function ASN1_STRING_length (x : access constant asn1_string_st) return int  -- /usr/include/openssl/asn1.h:677
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_length";

   procedure ASN1_STRING_length_set (x : access asn1_string_st; n : int)  -- /usr/include/openssl/asn1.h:679
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_length_set";

   function ASN1_STRING_type (x : access constant asn1_string_st) return int  -- /usr/include/openssl/asn1.h:681
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_type";

   function ASN1_STRING_data (x : access asn1_string_st) return access unsigned_char  -- /usr/include/openssl/asn1.h:683
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_data";

   function ASN1_STRING_get0_data (x : access constant asn1_string_st) return access unsigned_char  -- /usr/include/openssl/asn1.h:685
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_get0_data";

   function ASN1_BIT_STRING_new return access asn1_string_st  -- /usr/include/openssl/asn1.h:687
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_BIT_STRING_new";

   procedure ASN1_BIT_STRING_free (a : access asn1_string_st)  -- /usr/include/openssl/asn1.h:687
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_BIT_STRING_free";

   function d2i_ASN1_BIT_STRING
     (a : System.Address;
      c_in : System.Address;
      len : long) return access asn1_string_st  -- /usr/include/openssl/asn1.h:687
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_ASN1_BIT_STRING";

   function i2d_ASN1_BIT_STRING (a : access constant asn1_string_st; c_out : System.Address) return int  -- /usr/include/openssl/asn1.h:687
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_ASN1_BIT_STRING";

   function ASN1_BIT_STRING_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:687
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_BIT_STRING_it";

   function ASN1_BIT_STRING_set
     (a : access asn1_string_st;
      d : access unsigned_char;
      length : int) return int  -- /usr/include/openssl/asn1.h:688
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_BIT_STRING_set";

   function ASN1_BIT_STRING_set_bit
     (a : access asn1_string_st;
      n : int;
      value : int) return int  -- /usr/include/openssl/asn1.h:689
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_BIT_STRING_set_bit";

   function ASN1_BIT_STRING_get_bit (a : access constant asn1_string_st; n : int) return int  -- /usr/include/openssl/asn1.h:690
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_BIT_STRING_get_bit";

   function ASN1_BIT_STRING_check
     (a : access constant asn1_string_st;
      flags : access unsigned_char;
      flags_len : int) return int  -- /usr/include/openssl/asn1.h:691
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_BIT_STRING_check";

   function ASN1_BIT_STRING_name_print
     (c_out : access openssl_types_h.bio_st;
      bs : access asn1_string_st;
      tbl : access BIT_STRING_BITNAME;
      indent : int) return int  -- /usr/include/openssl/asn1.h:694
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_BIT_STRING_name_print";

   function ASN1_BIT_STRING_num_asc (name : Interfaces.C.Strings.chars_ptr; tbl : access BIT_STRING_BITNAME) return int  -- /usr/include/openssl/asn1.h:696
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_BIT_STRING_num_asc";

   function ASN1_BIT_STRING_set_asc
     (bs : access asn1_string_st;
      name : Interfaces.C.Strings.chars_ptr;
      value : int;
      tbl : access BIT_STRING_BITNAME) return int  -- /usr/include/openssl/asn1.h:697
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_BIT_STRING_set_asc";

   type stack_st_ASN1_INTEGER is null record;   -- incomplete struct

   type sk_ASN1_INTEGER_compfunc is access function (arg1 : System.Address; arg2 : System.Address) return int
   with Convention => C;  -- /usr/include/openssl/asn1.h:700

   type sk_ASN1_INTEGER_freefunc is access procedure (arg1 : access asn1_string_st)
   with Convention => C;  -- /usr/include/openssl/asn1.h:700

   type sk_ASN1_INTEGER_copyfunc is access function (arg1 : access constant asn1_string_st) return access asn1_string_st
   with Convention => C;  -- /usr/include/openssl/asn1.h:700

   function ossl_check_ASN1_INTEGER_type (ptr : access asn1_string_st) return access asn1_string_st  -- /usr/include/openssl/asn1.h:700
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_INTEGER_type";

   function ossl_check_const_ASN1_INTEGER_sk_type (sk : access constant stack_st_ASN1_INTEGER) return access constant openssl_stack_h.stack_st  -- /usr/include/openssl/asn1.h:700
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_const_ASN1_INTEGER_sk_type";

   function ossl_check_ASN1_INTEGER_sk_type (sk : access stack_st_ASN1_INTEGER) return access openssl_stack_h.stack_st  -- /usr/include/openssl/asn1.h:700
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_INTEGER_sk_type";

   function ossl_check_ASN1_INTEGER_compfunc_type (cmp : sk_ASN1_INTEGER_compfunc) return openssl_stack_h.OPENSSL_sk_compfunc  -- /usr/include/openssl/asn1.h:700
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_INTEGER_compfunc_type";

   function ossl_check_ASN1_INTEGER_copyfunc_type (cpy : sk_ASN1_INTEGER_copyfunc) return openssl_stack_h.OPENSSL_sk_copyfunc  -- /usr/include/openssl/asn1.h:700
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_INTEGER_copyfunc_type";

   function ossl_check_ASN1_INTEGER_freefunc_type (fr : sk_ASN1_INTEGER_freefunc) return openssl_stack_h.OPENSSL_sk_freefunc  -- /usr/include/openssl/asn1.h:700
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_INTEGER_freefunc_type";

   function ASN1_INTEGER_new return access asn1_string_st  -- /usr/include/openssl/asn1.h:729
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_INTEGER_new";

   procedure ASN1_INTEGER_free (a : access asn1_string_st)  -- /usr/include/openssl/asn1.h:729
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_INTEGER_free";

   function d2i_ASN1_INTEGER
     (a : System.Address;
      c_in : System.Address;
      len : long) return access asn1_string_st  -- /usr/include/openssl/asn1.h:729
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_ASN1_INTEGER";

   function i2d_ASN1_INTEGER (a : access constant asn1_string_st; c_out : System.Address) return int  -- /usr/include/openssl/asn1.h:729
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_ASN1_INTEGER";

   function ASN1_INTEGER_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:729
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_INTEGER_it";

   function d2i_ASN1_UINTEGER
     (a : System.Address;
      pp : System.Address;
      length : long) return access asn1_string_st  -- /usr/include/openssl/asn1.h:730
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_ASN1_UINTEGER";

   function ASN1_INTEGER_dup (a : access constant asn1_string_st) return access asn1_string_st  -- /usr/include/openssl/asn1.h:732
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_INTEGER_dup";

   function ASN1_INTEGER_cmp (x : access constant asn1_string_st; y : access constant asn1_string_st) return int  -- /usr/include/openssl/asn1.h:733
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_INTEGER_cmp";

   function ASN1_ENUMERATED_new return access asn1_string_st  -- /usr/include/openssl/asn1.h:735
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_ENUMERATED_new";

   procedure ASN1_ENUMERATED_free (a : access asn1_string_st)  -- /usr/include/openssl/asn1.h:735
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_ENUMERATED_free";

   function d2i_ASN1_ENUMERATED
     (a : System.Address;
      c_in : System.Address;
      len : long) return access asn1_string_st  -- /usr/include/openssl/asn1.h:735
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_ASN1_ENUMERATED";

   function i2d_ASN1_ENUMERATED (a : access constant asn1_string_st; c_out : System.Address) return int  -- /usr/include/openssl/asn1.h:735
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_ASN1_ENUMERATED";

   function ASN1_ENUMERATED_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:735
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_ENUMERATED_it";

   function ASN1_UTCTIME_check (a : access constant asn1_string_st) return int  -- /usr/include/openssl/asn1.h:737
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_UTCTIME_check";

   function ASN1_UTCTIME_set (s : access asn1_string_st; t : bits_types_time_t_h.time_t) return access asn1_string_st  -- /usr/include/openssl/asn1.h:738
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_UTCTIME_set";

   function ASN1_UTCTIME_adj
     (s : access asn1_string_st;
      t : bits_types_time_t_h.time_t;
      offset_day : int;
      offset_sec : long) return access asn1_string_st  -- /usr/include/openssl/asn1.h:739
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_UTCTIME_adj";

   function ASN1_UTCTIME_set_string (s : access asn1_string_st; str : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/asn1.h:741
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_UTCTIME_set_string";

   function ASN1_UTCTIME_cmp_time_t (s : access constant asn1_string_st; t : bits_types_time_t_h.time_t) return int  -- /usr/include/openssl/asn1.h:742
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_UTCTIME_cmp_time_t";

   function ASN1_GENERALIZEDTIME_check (a : access constant asn1_string_st) return int  -- /usr/include/openssl/asn1.h:744
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_GENERALIZEDTIME_check";

   function ASN1_GENERALIZEDTIME_set (s : access asn1_string_st; t : bits_types_time_t_h.time_t) return access asn1_string_st  -- /usr/include/openssl/asn1.h:745
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_GENERALIZEDTIME_set";

   function ASN1_GENERALIZEDTIME_adj
     (s : access asn1_string_st;
      t : bits_types_time_t_h.time_t;
      offset_day : int;
      offset_sec : long) return access asn1_string_st  -- /usr/include/openssl/asn1.h:747
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_GENERALIZEDTIME_adj";

   function ASN1_GENERALIZEDTIME_set_string (s : access asn1_string_st; str : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/asn1.h:750
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_GENERALIZEDTIME_set_string";

   function ASN1_TIME_diff
     (pday : access int;
      psec : access int;
      from : access constant asn1_string_st;
      to : access constant asn1_string_st) return int  -- /usr/include/openssl/asn1.h:752
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TIME_diff";

   function ASN1_OCTET_STRING_new return access asn1_string_st  -- /usr/include/openssl/asn1.h:755
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_OCTET_STRING_new";

   procedure ASN1_OCTET_STRING_free (a : access asn1_string_st)  -- /usr/include/openssl/asn1.h:755
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_OCTET_STRING_free";

   function d2i_ASN1_OCTET_STRING
     (a : System.Address;
      c_in : System.Address;
      len : long) return access asn1_string_st  -- /usr/include/openssl/asn1.h:755
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_ASN1_OCTET_STRING";

   function i2d_ASN1_OCTET_STRING (a : access constant asn1_string_st; c_out : System.Address) return int  -- /usr/include/openssl/asn1.h:755
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_ASN1_OCTET_STRING";

   function ASN1_OCTET_STRING_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:755
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_OCTET_STRING_it";

   function ASN1_OCTET_STRING_dup (a : access constant asn1_string_st) return access asn1_string_st  -- /usr/include/openssl/asn1.h:756
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_OCTET_STRING_dup";

   function ASN1_OCTET_STRING_cmp (a : access constant asn1_string_st; b : access constant asn1_string_st) return int  -- /usr/include/openssl/asn1.h:757
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_OCTET_STRING_cmp";

   function ASN1_OCTET_STRING_set
     (str : access asn1_string_st;
      data : access unsigned_char;
      len : int) return int  -- /usr/include/openssl/asn1.h:759
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_OCTET_STRING_set";

   type stack_st_ASN1_UTF8STRING is null record;   -- incomplete struct

   type sk_ASN1_UTF8STRING_compfunc is access function (arg1 : System.Address; arg2 : System.Address) return int
   with Convention => C;  -- /usr/include/openssl/asn1.h:762

   type sk_ASN1_UTF8STRING_freefunc is access procedure (arg1 : access asn1_string_st)
   with Convention => C;  -- /usr/include/openssl/asn1.h:762

   type sk_ASN1_UTF8STRING_copyfunc is access function (arg1 : access constant asn1_string_st) return access asn1_string_st
   with Convention => C;  -- /usr/include/openssl/asn1.h:762

   function ossl_check_ASN1_UTF8STRING_type (ptr : access asn1_string_st) return access asn1_string_st  -- /usr/include/openssl/asn1.h:762
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_UTF8STRING_type";

   function ossl_check_const_ASN1_UTF8STRING_sk_type (sk : access constant stack_st_ASN1_UTF8STRING) return access constant openssl_stack_h.stack_st  -- /usr/include/openssl/asn1.h:762
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_const_ASN1_UTF8STRING_sk_type";

   function ossl_check_ASN1_UTF8STRING_sk_type (sk : access stack_st_ASN1_UTF8STRING) return access openssl_stack_h.stack_st  -- /usr/include/openssl/asn1.h:762
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_UTF8STRING_sk_type";

   function ossl_check_ASN1_UTF8STRING_compfunc_type (cmp : sk_ASN1_UTF8STRING_compfunc) return openssl_stack_h.OPENSSL_sk_compfunc  -- /usr/include/openssl/asn1.h:762
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_UTF8STRING_compfunc_type";

   function ossl_check_ASN1_UTF8STRING_copyfunc_type (cpy : sk_ASN1_UTF8STRING_copyfunc) return openssl_stack_h.OPENSSL_sk_copyfunc  -- /usr/include/openssl/asn1.h:762
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_UTF8STRING_copyfunc_type";

   function ossl_check_ASN1_UTF8STRING_freefunc_type (fr : sk_ASN1_UTF8STRING_freefunc) return openssl_stack_h.OPENSSL_sk_freefunc  -- /usr/include/openssl/asn1.h:762
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_UTF8STRING_freefunc_type";

   function ASN1_VISIBLESTRING_new return access asn1_string_st  -- /usr/include/openssl/asn1.h:790
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_VISIBLESTRING_new";

   procedure ASN1_VISIBLESTRING_free (a : access asn1_string_st)  -- /usr/include/openssl/asn1.h:790
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_VISIBLESTRING_free";

   function d2i_ASN1_VISIBLESTRING
     (a : System.Address;
      c_in : System.Address;
      len : long) return access asn1_string_st  -- /usr/include/openssl/asn1.h:790
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_ASN1_VISIBLESTRING";

   function i2d_ASN1_VISIBLESTRING (a : access constant asn1_string_st; c_out : System.Address) return int  -- /usr/include/openssl/asn1.h:790
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_ASN1_VISIBLESTRING";

   function ASN1_VISIBLESTRING_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:790
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_VISIBLESTRING_it";

   function ASN1_UNIVERSALSTRING_new return access asn1_string_st  -- /usr/include/openssl/asn1.h:791
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_UNIVERSALSTRING_new";

   procedure ASN1_UNIVERSALSTRING_free (a : access asn1_string_st)  -- /usr/include/openssl/asn1.h:791
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_UNIVERSALSTRING_free";

   function d2i_ASN1_UNIVERSALSTRING
     (a : System.Address;
      c_in : System.Address;
      len : long) return access asn1_string_st  -- /usr/include/openssl/asn1.h:791
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_ASN1_UNIVERSALSTRING";

   function i2d_ASN1_UNIVERSALSTRING (a : access constant asn1_string_st; c_out : System.Address) return int  -- /usr/include/openssl/asn1.h:791
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_ASN1_UNIVERSALSTRING";

   function ASN1_UNIVERSALSTRING_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:791
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_UNIVERSALSTRING_it";

   function ASN1_UTF8STRING_new return access asn1_string_st  -- /usr/include/openssl/asn1.h:792
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_UTF8STRING_new";

   procedure ASN1_UTF8STRING_free (a : access asn1_string_st)  -- /usr/include/openssl/asn1.h:792
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_UTF8STRING_free";

   function d2i_ASN1_UTF8STRING
     (a : System.Address;
      c_in : System.Address;
      len : long) return access asn1_string_st  -- /usr/include/openssl/asn1.h:792
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_ASN1_UTF8STRING";

   function i2d_ASN1_UTF8STRING (a : access constant asn1_string_st; c_out : System.Address) return int  -- /usr/include/openssl/asn1.h:792
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_ASN1_UTF8STRING";

   function ASN1_UTF8STRING_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:792
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_UTF8STRING_it";

   function ASN1_NULL_new return access openssl_types_h.ASN1_NULL  -- /usr/include/openssl/asn1.h:793
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_NULL_new";

   procedure ASN1_NULL_free (a : access openssl_types_h.ASN1_NULL)  -- /usr/include/openssl/asn1.h:793
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_NULL_free";

   function d2i_ASN1_NULL
     (a : System.Address;
      c_in : System.Address;
      len : long) return access openssl_types_h.ASN1_NULL  -- /usr/include/openssl/asn1.h:793
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_ASN1_NULL";

   function i2d_ASN1_NULL (a : access openssl_types_h.ASN1_NULL; c_out : System.Address) return int  -- /usr/include/openssl/asn1.h:793
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_ASN1_NULL";

   function ASN1_NULL_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:793
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_NULL_it";

   function ASN1_BMPSTRING_new return access asn1_string_st  -- /usr/include/openssl/asn1.h:794
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_BMPSTRING_new";

   procedure ASN1_BMPSTRING_free (a : access asn1_string_st)  -- /usr/include/openssl/asn1.h:794
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_BMPSTRING_free";

   function d2i_ASN1_BMPSTRING
     (a : System.Address;
      c_in : System.Address;
      len : long) return access asn1_string_st  -- /usr/include/openssl/asn1.h:794
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_ASN1_BMPSTRING";

   function i2d_ASN1_BMPSTRING (a : access constant asn1_string_st; c_out : System.Address) return int  -- /usr/include/openssl/asn1.h:794
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_ASN1_BMPSTRING";

   function ASN1_BMPSTRING_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:794
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_BMPSTRING_it";

   function UTF8_getc
     (str : access unsigned_char;
      len : int;
      val : access unsigned_long) return int  -- /usr/include/openssl/asn1.h:796
   with Import => True, 
        Convention => C, 
        External_Name => "UTF8_getc";

   function UTF8_putc
     (str : access unsigned_char;
      len : int;
      value : unsigned_long) return int  -- /usr/include/openssl/asn1.h:797
   with Import => True, 
        Convention => C, 
        External_Name => "UTF8_putc";

   type stack_st_ASN1_GENERALSTRING is null record;   -- incomplete struct

   type sk_ASN1_GENERALSTRING_compfunc is access function (arg1 : System.Address; arg2 : System.Address) return int
   with Convention => C;  -- /usr/include/openssl/asn1.h:799

   type sk_ASN1_GENERALSTRING_freefunc is access procedure (arg1 : access asn1_string_st)
   with Convention => C;  -- /usr/include/openssl/asn1.h:799

   type sk_ASN1_GENERALSTRING_copyfunc is access function (arg1 : access constant asn1_string_st) return access asn1_string_st
   with Convention => C;  -- /usr/include/openssl/asn1.h:799

   function ossl_check_ASN1_GENERALSTRING_type (ptr : access asn1_string_st) return access asn1_string_st  -- /usr/include/openssl/asn1.h:799
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_GENERALSTRING_type";

   function ossl_check_const_ASN1_GENERALSTRING_sk_type (sk : access constant stack_st_ASN1_GENERALSTRING) return access constant openssl_stack_h.stack_st  -- /usr/include/openssl/asn1.h:799
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_const_ASN1_GENERALSTRING_sk_type";

   function ossl_check_ASN1_GENERALSTRING_sk_type (sk : access stack_st_ASN1_GENERALSTRING) return access openssl_stack_h.stack_st  -- /usr/include/openssl/asn1.h:799
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_GENERALSTRING_sk_type";

   function ossl_check_ASN1_GENERALSTRING_compfunc_type (cmp : sk_ASN1_GENERALSTRING_compfunc) return openssl_stack_h.OPENSSL_sk_compfunc  -- /usr/include/openssl/asn1.h:799
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_GENERALSTRING_compfunc_type";

   function ossl_check_ASN1_GENERALSTRING_copyfunc_type (cpy : sk_ASN1_GENERALSTRING_copyfunc) return openssl_stack_h.OPENSSL_sk_copyfunc  -- /usr/include/openssl/asn1.h:799
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_GENERALSTRING_copyfunc_type";

   function ossl_check_ASN1_GENERALSTRING_freefunc_type (fr : sk_ASN1_GENERALSTRING_freefunc) return openssl_stack_h.OPENSSL_sk_freefunc  -- /usr/include/openssl/asn1.h:799
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_ASN1_GENERALSTRING_freefunc_type";

   function ASN1_PRINTABLE_new return access asn1_string_st  -- /usr/include/openssl/asn1.h:827
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_PRINTABLE_new";

   procedure ASN1_PRINTABLE_free (a : access asn1_string_st)  -- /usr/include/openssl/asn1.h:827
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_PRINTABLE_free";

   function d2i_ASN1_PRINTABLE
     (a : System.Address;
      c_in : System.Address;
      len : long) return access asn1_string_st  -- /usr/include/openssl/asn1.h:827
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_ASN1_PRINTABLE";

   function i2d_ASN1_PRINTABLE (a : access constant asn1_string_st; c_out : System.Address) return int  -- /usr/include/openssl/asn1.h:827
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_ASN1_PRINTABLE";

   function ASN1_PRINTABLE_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:827
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_PRINTABLE_it";

   function DIRECTORYSTRING_new return access asn1_string_st  -- /usr/include/openssl/asn1.h:829
   with Import => True, 
        Convention => C, 
        External_Name => "DIRECTORYSTRING_new";

   procedure DIRECTORYSTRING_free (a : access asn1_string_st)  -- /usr/include/openssl/asn1.h:829
   with Import => True, 
        Convention => C, 
        External_Name => "DIRECTORYSTRING_free";

   function d2i_DIRECTORYSTRING
     (a : System.Address;
      c_in : System.Address;
      len : long) return access asn1_string_st  -- /usr/include/openssl/asn1.h:829
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_DIRECTORYSTRING";

   function i2d_DIRECTORYSTRING (a : access constant asn1_string_st; c_out : System.Address) return int  -- /usr/include/openssl/asn1.h:829
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_DIRECTORYSTRING";

   function DIRECTORYSTRING_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:829
   with Import => True, 
        Convention => C, 
        External_Name => "DIRECTORYSTRING_it";

   function DISPLAYTEXT_new return access asn1_string_st  -- /usr/include/openssl/asn1.h:830
   with Import => True, 
        Convention => C, 
        External_Name => "DISPLAYTEXT_new";

   procedure DISPLAYTEXT_free (a : access asn1_string_st)  -- /usr/include/openssl/asn1.h:830
   with Import => True, 
        Convention => C, 
        External_Name => "DISPLAYTEXT_free";

   function d2i_DISPLAYTEXT
     (a : System.Address;
      c_in : System.Address;
      len : long) return access asn1_string_st  -- /usr/include/openssl/asn1.h:830
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_DISPLAYTEXT";

   function i2d_DISPLAYTEXT (a : access constant asn1_string_st; c_out : System.Address) return int  -- /usr/include/openssl/asn1.h:830
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_DISPLAYTEXT";

   function DISPLAYTEXT_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:830
   with Import => True, 
        Convention => C, 
        External_Name => "DISPLAYTEXT_it";

   function ASN1_PRINTABLESTRING_new return access asn1_string_st  -- /usr/include/openssl/asn1.h:831
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_PRINTABLESTRING_new";

   procedure ASN1_PRINTABLESTRING_free (a : access asn1_string_st)  -- /usr/include/openssl/asn1.h:831
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_PRINTABLESTRING_free";

   function d2i_ASN1_PRINTABLESTRING
     (a : System.Address;
      c_in : System.Address;
      len : long) return access asn1_string_st  -- /usr/include/openssl/asn1.h:831
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_ASN1_PRINTABLESTRING";

   function i2d_ASN1_PRINTABLESTRING (a : access constant asn1_string_st; c_out : System.Address) return int  -- /usr/include/openssl/asn1.h:831
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_ASN1_PRINTABLESTRING";

   function ASN1_PRINTABLESTRING_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:831
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_PRINTABLESTRING_it";

   function ASN1_T61STRING_new return access asn1_string_st  -- /usr/include/openssl/asn1.h:832
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_T61STRING_new";

   procedure ASN1_T61STRING_free (a : access asn1_string_st)  -- /usr/include/openssl/asn1.h:832
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_T61STRING_free";

   function d2i_ASN1_T61STRING
     (a : System.Address;
      c_in : System.Address;
      len : long) return access asn1_string_st  -- /usr/include/openssl/asn1.h:832
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_ASN1_T61STRING";

   function i2d_ASN1_T61STRING (a : access constant asn1_string_st; c_out : System.Address) return int  -- /usr/include/openssl/asn1.h:832
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_ASN1_T61STRING";

   function ASN1_T61STRING_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:832
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_T61STRING_it";

   function ASN1_IA5STRING_new return access asn1_string_st  -- /usr/include/openssl/asn1.h:833
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_IA5STRING_new";

   procedure ASN1_IA5STRING_free (a : access asn1_string_st)  -- /usr/include/openssl/asn1.h:833
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_IA5STRING_free";

   function d2i_ASN1_IA5STRING
     (a : System.Address;
      c_in : System.Address;
      len : long) return access asn1_string_st  -- /usr/include/openssl/asn1.h:833
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_ASN1_IA5STRING";

   function i2d_ASN1_IA5STRING (a : access constant asn1_string_st; c_out : System.Address) return int  -- /usr/include/openssl/asn1.h:833
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_ASN1_IA5STRING";

   function ASN1_IA5STRING_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:833
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_IA5STRING_it";

   function ASN1_GENERALSTRING_new return access asn1_string_st  -- /usr/include/openssl/asn1.h:834
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_GENERALSTRING_new";

   procedure ASN1_GENERALSTRING_free (a : access asn1_string_st)  -- /usr/include/openssl/asn1.h:834
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_GENERALSTRING_free";

   function d2i_ASN1_GENERALSTRING
     (a : System.Address;
      c_in : System.Address;
      len : long) return access asn1_string_st  -- /usr/include/openssl/asn1.h:834
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_ASN1_GENERALSTRING";

   function i2d_ASN1_GENERALSTRING (a : access constant asn1_string_st; c_out : System.Address) return int  -- /usr/include/openssl/asn1.h:834
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_ASN1_GENERALSTRING";

   function ASN1_GENERALSTRING_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:834
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_GENERALSTRING_it";

   function ASN1_UTCTIME_new return access asn1_string_st  -- /usr/include/openssl/asn1.h:835
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_UTCTIME_new";

   procedure ASN1_UTCTIME_free (a : access asn1_string_st)  -- /usr/include/openssl/asn1.h:835
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_UTCTIME_free";

   function d2i_ASN1_UTCTIME
     (a : System.Address;
      c_in : System.Address;
      len : long) return access asn1_string_st  -- /usr/include/openssl/asn1.h:835
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_ASN1_UTCTIME";

   function i2d_ASN1_UTCTIME (a : access constant asn1_string_st; c_out : System.Address) return int  -- /usr/include/openssl/asn1.h:835
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_ASN1_UTCTIME";

   function ASN1_UTCTIME_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:835
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_UTCTIME_it";

   function ASN1_GENERALIZEDTIME_new return access asn1_string_st  -- /usr/include/openssl/asn1.h:836
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_GENERALIZEDTIME_new";

   procedure ASN1_GENERALIZEDTIME_free (a : access asn1_string_st)  -- /usr/include/openssl/asn1.h:836
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_GENERALIZEDTIME_free";

   function d2i_ASN1_GENERALIZEDTIME
     (a : System.Address;
      c_in : System.Address;
      len : long) return access asn1_string_st  -- /usr/include/openssl/asn1.h:836
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_ASN1_GENERALIZEDTIME";

   function i2d_ASN1_GENERALIZEDTIME (a : access constant asn1_string_st; c_out : System.Address) return int  -- /usr/include/openssl/asn1.h:836
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_ASN1_GENERALIZEDTIME";

   function ASN1_GENERALIZEDTIME_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:836
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_GENERALIZEDTIME_it";

   function ASN1_TIME_new return access asn1_string_st  -- /usr/include/openssl/asn1.h:837
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TIME_new";

   procedure ASN1_TIME_free (a : access asn1_string_st)  -- /usr/include/openssl/asn1.h:837
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TIME_free";

   function d2i_ASN1_TIME
     (a : System.Address;
      c_in : System.Address;
      len : long) return access asn1_string_st  -- /usr/include/openssl/asn1.h:837
   with Import => True, 
        Convention => C, 
        External_Name => "d2i_ASN1_TIME";

   function i2d_ASN1_TIME (a : access constant asn1_string_st; c_out : System.Address) return int  -- /usr/include/openssl/asn1.h:837
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_ASN1_TIME";

   function ASN1_TIME_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:837
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TIME_it";

   function ASN1_TIME_dup (a : access constant asn1_string_st) return access asn1_string_st  -- /usr/include/openssl/asn1.h:839
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TIME_dup";

   function ASN1_UTCTIME_dup (a : access constant asn1_string_st) return access asn1_string_st  -- /usr/include/openssl/asn1.h:840
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_UTCTIME_dup";

   function ASN1_GENERALIZEDTIME_dup (a : access constant asn1_string_st) return access asn1_string_st  -- /usr/include/openssl/asn1.h:841
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_GENERALIZEDTIME_dup";

   function ASN1_OCTET_STRING_NDEF_it return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:843
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_OCTET_STRING_NDEF_it";

   function ASN1_TIME_set (s : access asn1_string_st; t : bits_types_time_t_h.time_t) return access asn1_string_st  -- /usr/include/openssl/asn1.h:845
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TIME_set";

   function ASN1_TIME_adj
     (s : access asn1_string_st;
      t : bits_types_time_t_h.time_t;
      offset_day : int;
      offset_sec : long) return access asn1_string_st  -- /usr/include/openssl/asn1.h:846
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TIME_adj";

   function ASN1_TIME_check (t : access constant asn1_string_st) return int  -- /usr/include/openssl/asn1.h:848
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TIME_check";

   function ASN1_TIME_to_generalizedtime (t : access constant asn1_string_st; c_out : System.Address) return access asn1_string_st  -- /usr/include/openssl/asn1.h:849
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TIME_to_generalizedtime";

   function ASN1_TIME_set_string (s : access asn1_string_st; str : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/asn1.h:851
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TIME_set_string";

   function ASN1_TIME_set_string_X509 (s : access asn1_string_st; str : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/asn1.h:852
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TIME_set_string_X509";

   function ASN1_TIME_to_tm (s : access constant asn1_string_st; the_tm : access bits_types_struct_tm_h.tm) return int  -- /usr/include/openssl/asn1.h:853
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TIME_to_tm";

   function ASN1_TIME_normalize (s : access asn1_string_st) return int  -- /usr/include/openssl/asn1.h:854
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TIME_normalize";

   function ASN1_TIME_cmp_time_t (s : access constant asn1_string_st; t : bits_types_time_t_h.time_t) return int  -- /usr/include/openssl/asn1.h:855
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TIME_cmp_time_t";

   function ASN1_TIME_compare (a : access constant asn1_string_st; b : access constant asn1_string_st) return int  -- /usr/include/openssl/asn1.h:856
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TIME_compare";

   function i2a_ASN1_INTEGER (bp : access openssl_types_h.bio_st; a : access constant asn1_string_st) return int  -- /usr/include/openssl/asn1.h:858
   with Import => True, 
        Convention => C, 
        External_Name => "i2a_ASN1_INTEGER";

   function a2i_ASN1_INTEGER
     (bp : access openssl_types_h.bio_st;
      bs : access asn1_string_st;
      buf : Interfaces.C.Strings.chars_ptr;
      size : int) return int  -- /usr/include/openssl/asn1.h:859
   with Import => True, 
        Convention => C, 
        External_Name => "a2i_ASN1_INTEGER";

   function i2a_ASN1_ENUMERATED (bp : access openssl_types_h.bio_st; a : access constant asn1_string_st) return int  -- /usr/include/openssl/asn1.h:860
   with Import => True, 
        Convention => C, 
        External_Name => "i2a_ASN1_ENUMERATED";

   function a2i_ASN1_ENUMERATED
     (bp : access openssl_types_h.bio_st;
      bs : access asn1_string_st;
      buf : Interfaces.C.Strings.chars_ptr;
      size : int) return int  -- /usr/include/openssl/asn1.h:861
   with Import => True, 
        Convention => C, 
        External_Name => "a2i_ASN1_ENUMERATED";

   function i2a_ASN1_OBJECT (bp : access openssl_types_h.bio_st; a : access constant openssl_types_h.asn1_object_st) return int  -- /usr/include/openssl/asn1.h:862
   with Import => True, 
        Convention => C, 
        External_Name => "i2a_ASN1_OBJECT";

   function a2i_ASN1_STRING
     (bp : access openssl_types_h.bio_st;
      bs : access asn1_string_st;
      buf : Interfaces.C.Strings.chars_ptr;
      size : int) return int  -- /usr/include/openssl/asn1.h:863
   with Import => True, 
        Convention => C, 
        External_Name => "a2i_ASN1_STRING";

   function i2a_ASN1_STRING
     (bp : access openssl_types_h.bio_st;
      a : access constant asn1_string_st;
      c_type : int) return int  -- /usr/include/openssl/asn1.h:864
   with Import => True, 
        Convention => C, 
        External_Name => "i2a_ASN1_STRING";

   function i2t_ASN1_OBJECT
     (buf : Interfaces.C.Strings.chars_ptr;
      buf_len : int;
      a : access constant openssl_types_h.asn1_object_st) return int  -- /usr/include/openssl/asn1.h:865
   with Import => True, 
        Convention => C, 
        External_Name => "i2t_ASN1_OBJECT";

   function a2d_ASN1_OBJECT
     (c_out : access unsigned_char;
      olen : int;
      buf : Interfaces.C.Strings.chars_ptr;
      num : int) return int  -- /usr/include/openssl/asn1.h:867
   with Import => True, 
        Convention => C, 
        External_Name => "a2d_ASN1_OBJECT";

   function ASN1_OBJECT_create
     (nid : int;
      data : access unsigned_char;
      len : int;
      sn : Interfaces.C.Strings.chars_ptr;
      ln : Interfaces.C.Strings.chars_ptr) return access openssl_types_h.asn1_object_st  -- /usr/include/openssl/asn1.h:868
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_OBJECT_create";

   function ASN1_INTEGER_get_int64 (pr : access bits_stdint_intn_h.int64_t; a : access constant asn1_string_st) return int  -- /usr/include/openssl/asn1.h:871
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_INTEGER_get_int64";

   function ASN1_INTEGER_set_int64 (a : access asn1_string_st; r : bits_stdint_intn_h.int64_t) return int  -- /usr/include/openssl/asn1.h:872
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_INTEGER_set_int64";

   function ASN1_INTEGER_get_uint64 (pr : access bits_stdint_uintn_h.uint64_t; a : access constant asn1_string_st) return int  -- /usr/include/openssl/asn1.h:873
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_INTEGER_get_uint64";

   function ASN1_INTEGER_set_uint64 (a : access asn1_string_st; r : bits_stdint_uintn_h.uint64_t) return int  -- /usr/include/openssl/asn1.h:874
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_INTEGER_set_uint64";

   function ASN1_INTEGER_set (a : access asn1_string_st; v : long) return int  -- /usr/include/openssl/asn1.h:876
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_INTEGER_set";

   function ASN1_INTEGER_get (a : access constant asn1_string_st) return long  -- /usr/include/openssl/asn1.h:877
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_INTEGER_get";

   function BN_to_ASN1_INTEGER (bn : access constant openssl_types_h.bignum_st; ai : access asn1_string_st) return access asn1_string_st  -- /usr/include/openssl/asn1.h:878
   with Import => True, 
        Convention => C, 
        External_Name => "BN_to_ASN1_INTEGER";

   function ASN1_INTEGER_to_BN (ai : access constant asn1_string_st; bn : access openssl_types_h.bignum_st) return access openssl_types_h.bignum_st  -- /usr/include/openssl/asn1.h:879
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_INTEGER_to_BN";

   function ASN1_ENUMERATED_get_int64 (pr : access bits_stdint_intn_h.int64_t; a : access constant asn1_string_st) return int  -- /usr/include/openssl/asn1.h:881
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_ENUMERATED_get_int64";

   function ASN1_ENUMERATED_set_int64 (a : access asn1_string_st; r : bits_stdint_intn_h.int64_t) return int  -- /usr/include/openssl/asn1.h:882
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_ENUMERATED_set_int64";

   function ASN1_ENUMERATED_set (a : access asn1_string_st; v : long) return int  -- /usr/include/openssl/asn1.h:885
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_ENUMERATED_set";

   function ASN1_ENUMERATED_get (a : access constant asn1_string_st) return long  -- /usr/include/openssl/asn1.h:886
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_ENUMERATED_get";

   function BN_to_ASN1_ENUMERATED (bn : access constant openssl_types_h.bignum_st; ai : access asn1_string_st) return access asn1_string_st  -- /usr/include/openssl/asn1.h:887
   with Import => True, 
        Convention => C, 
        External_Name => "BN_to_ASN1_ENUMERATED";

   function ASN1_ENUMERATED_to_BN (ai : access constant asn1_string_st; bn : access openssl_types_h.bignum_st) return access openssl_types_h.bignum_st  -- /usr/include/openssl/asn1.h:888
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_ENUMERATED_to_BN";

  -- General  
  -- given a string, return the correct type, max is the maximum length  
   function ASN1_PRINTABLE_type (s : access unsigned_char; max : int) return int  -- /usr/include/openssl/asn1.h:892
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_PRINTABLE_type";

   function ASN1_tag2bit (tag : int) return unsigned_long  -- /usr/include/openssl/asn1.h:894
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_tag2bit";

  -- SPECIALS  
   function ASN1_get_object
     (pp : System.Address;
      plength : access long;
      ptag : access int;
      pclass : access int;
      omax : long) return int  -- /usr/include/openssl/asn1.h:897
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_get_object";

   function ASN1_check_infinite_end (p : System.Address; len : long) return int  -- /usr/include/openssl/asn1.h:899
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_check_infinite_end";

   function ASN1_const_check_infinite_end (p : System.Address; len : long) return int  -- /usr/include/openssl/asn1.h:900
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_const_check_infinite_end";

   procedure ASN1_put_object
     (pp : System.Address;
      constructed : int;
      length : int;
      tag : int;
      xclass : int)  -- /usr/include/openssl/asn1.h:901
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_put_object";

   function ASN1_put_eoc (pp : System.Address) return int  -- /usr/include/openssl/asn1.h:903
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_put_eoc";

   function ASN1_object_size
     (constructed : int;
      length : int;
      tag : int) return int  -- /usr/include/openssl/asn1.h:904
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_object_size";

  -- Used to implement other functions  
   function ASN1_dup
     (i2d : access function (arg1 : System.Address; arg2 : System.Address) return int;
      d2i : access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : long) return System.Address;
      x : System.Address) return System.Address  -- /usr/include/openssl/asn1.h:907
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_dup";

   function ASN1_item_dup (it : access constant openssl_types_h.ASN1_ITEM_st; x : System.Address) return System.Address  -- /usr/include/openssl/asn1.h:914
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_item_dup";

   function ASN1_item_sign_ex
     (it : access constant openssl_types_h.ASN1_ITEM_st;
      algor1 : access openssl_types_h.X509_algor_st;
      algor2 : access openssl_types_h.X509_algor_st;
      signature : access asn1_string_st;
      data : System.Address;
      id : access constant asn1_string_st;
      pkey : access openssl_types_h.evp_pkey_st;
      md : access constant openssl_types_h.evp_md_st;
      libctx : access openssl_types_h.ossl_lib_ctx_st;
      propq : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/asn1.h:915
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_item_sign_ex";

   function ASN1_item_verify_ex
     (it : access constant openssl_types_h.ASN1_ITEM_st;
      alg : access constant openssl_types_h.X509_algor_st;
      signature : access constant asn1_string_st;
      data : System.Address;
      id : access constant asn1_string_st;
      pkey : access openssl_types_h.evp_pkey_st;
      libctx : access openssl_types_h.ossl_lib_ctx_st;
      propq : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/asn1.h:920
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_item_verify_ex";

  -- ASN1 alloc/free macros for when a type is only used internally  
   function ASN1_d2i_fp
     (xnew : access function return System.Address;
      d2i : access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : long) return System.Address;
      c_in : access bits_types_struct_FILE_h.u_IO_FILE;
      x : System.Address) return System.Address  -- /usr/include/openssl/asn1.h:932
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_d2i_fp";

   function ASN1_item_d2i_fp_ex
     (it : access constant openssl_types_h.ASN1_ITEM_st;
      c_in : access bits_types_struct_FILE_h.u_IO_FILE;
      x : System.Address;
      libctx : access openssl_types_h.ossl_lib_ctx_st;
      propq : Interfaces.C.Strings.chars_ptr) return System.Address  -- /usr/include/openssl/asn1.h:940
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_item_d2i_fp_ex";

   function ASN1_item_d2i_fp
     (it : access constant openssl_types_h.ASN1_ITEM_st;
      c_in : access bits_types_struct_FILE_h.u_IO_FILE;
      x : System.Address) return System.Address  -- /usr/include/openssl/asn1.h:942
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_item_d2i_fp";

   function ASN1_i2d_fp
     (i2d : access function (arg1 : System.Address; arg2 : System.Address) return int;
      c_out : access bits_types_struct_FILE_h.u_IO_FILE;
      x : System.Address) return int  -- /usr/include/openssl/asn1.h:943
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_i2d_fp";

   function ASN1_item_i2d_fp
     (it : access constant openssl_types_h.ASN1_ITEM_st;
      c_out : access bits_types_struct_FILE_h.u_IO_FILE;
      x : System.Address) return int  -- /usr/include/openssl/asn1.h:950
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_item_i2d_fp";

   function ASN1_STRING_print_ex_fp
     (fp : access bits_types_struct_FILE_h.u_IO_FILE;
      str : access constant asn1_string_st;
      flags : unsigned_long) return int  -- /usr/include/openssl/asn1.h:951
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_print_ex_fp";

   function ASN1_STRING_to_UTF8 (c_out : System.Address; c_in : access constant asn1_string_st) return int  -- /usr/include/openssl/asn1.h:954
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_to_UTF8";

   function ASN1_d2i_bio
     (xnew : access function return System.Address;
      d2i : access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : long) return System.Address;
      c_in : access openssl_types_h.bio_st;
      x : System.Address) return System.Address  -- /usr/include/openssl/asn1.h:956
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_d2i_bio";

   function ASN1_item_d2i_bio_ex
     (it : access constant openssl_types_h.ASN1_ITEM_st;
      c_in : access openssl_types_h.bio_st;
      pval : System.Address;
      libctx : access openssl_types_h.ossl_lib_ctx_st;
      propq : Interfaces.C.Strings.chars_ptr) return System.Address  -- /usr/include/openssl/asn1.h:964
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_item_d2i_bio_ex";

   function ASN1_item_d2i_bio
     (it : access constant openssl_types_h.ASN1_ITEM_st;
      c_in : access openssl_types_h.bio_st;
      pval : System.Address) return System.Address  -- /usr/include/openssl/asn1.h:966
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_item_d2i_bio";

   function ASN1_i2d_bio
     (i2d : access function (arg1 : System.Address; arg2 : System.Address) return int;
      c_out : access openssl_types_h.bio_st;
      x : System.Address) return int  -- /usr/include/openssl/asn1.h:967
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_i2d_bio";

   function ASN1_item_i2d_bio
     (it : access constant openssl_types_h.ASN1_ITEM_st;
      c_out : access openssl_types_h.bio_st;
      x : System.Address) return int  -- /usr/include/openssl/asn1.h:974
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_item_i2d_bio";

   function ASN1_item_i2d_mem_bio (it : access constant openssl_types_h.ASN1_ITEM_st; val : access constant ASN1_VALUE) return access openssl_types_h.bio_st  -- /usr/include/openssl/asn1.h:975
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_item_i2d_mem_bio";

   function ASN1_UTCTIME_print (fp : access openssl_types_h.bio_st; a : access constant asn1_string_st) return int  -- /usr/include/openssl/asn1.h:976
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_UTCTIME_print";

   function ASN1_GENERALIZEDTIME_print (fp : access openssl_types_h.bio_st; a : access constant asn1_string_st) return int  -- /usr/include/openssl/asn1.h:977
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_GENERALIZEDTIME_print";

   function ASN1_TIME_print (bp : access openssl_types_h.bio_st; tm : access constant asn1_string_st) return int  -- /usr/include/openssl/asn1.h:978
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TIME_print";

   function ASN1_TIME_print_ex
     (bp : access openssl_types_h.bio_st;
      tm : access constant asn1_string_st;
      flags : unsigned_long) return int  -- /usr/include/openssl/asn1.h:979
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TIME_print_ex";

   function ASN1_STRING_print (bp : access openssl_types_h.bio_st; v : access constant asn1_string_st) return int  -- /usr/include/openssl/asn1.h:980
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_print";

   function ASN1_STRING_print_ex
     (c_out : access openssl_types_h.bio_st;
      str : access constant asn1_string_st;
      flags : unsigned_long) return int  -- /usr/include/openssl/asn1.h:981
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_print_ex";

   function ASN1_buf_print
     (bp : access openssl_types_h.bio_st;
      buf : access unsigned_char;
      buflen : stddef_h.size_t;
      off : int) return int  -- /usr/include/openssl/asn1.h:982
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_buf_print";

   function ASN1_bn_print
     (bp : access openssl_types_h.bio_st;
      number : Interfaces.C.Strings.chars_ptr;
      num : access constant openssl_types_h.bignum_st;
      buf : access unsigned_char;
      off : int) return int  -- /usr/include/openssl/asn1.h:983
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_bn_print";

   function ASN1_parse
     (bp : access openssl_types_h.bio_st;
      pp : access unsigned_char;
      len : long;
      indent : int) return int  -- /usr/include/openssl/asn1.h:985
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_parse";

   function ASN1_parse_dump
     (bp : access openssl_types_h.bio_st;
      pp : access unsigned_char;
      len : long;
      indent : int;
      dump : int) return int  -- /usr/include/openssl/asn1.h:986
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_parse_dump";

   function ASN1_tag2str (tag : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/asn1.h:988
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_tag2str";

  -- Used to load and write Netscape format cert  
   function ASN1_UNIVERSALSTRING_to_string (s : access asn1_string_st) return int  -- /usr/include/openssl/asn1.h:992
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_UNIVERSALSTRING_to_string";

   function ASN1_TYPE_set_octetstring
     (a : access asn1_type_st;
      data : access unsigned_char;
      len : int) return int  -- /usr/include/openssl/asn1.h:994
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TYPE_set_octetstring";

   function ASN1_TYPE_get_octetstring
     (a : access constant asn1_type_st;
      data : access unsigned_char;
      max_len : int) return int  -- /usr/include/openssl/asn1.h:995
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TYPE_get_octetstring";

   function ASN1_TYPE_set_int_octetstring
     (a : access asn1_type_st;
      num : long;
      data : access unsigned_char;
      len : int) return int  -- /usr/include/openssl/asn1.h:996
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TYPE_set_int_octetstring";

   function ASN1_TYPE_get_int_octetstring
     (a : access constant asn1_type_st;
      num : access long;
      data : access unsigned_char;
      max_len : int) return int  -- /usr/include/openssl/asn1.h:998
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_TYPE_get_int_octetstring";

   function ASN1_item_unpack (oct : access constant asn1_string_st; it : access constant openssl_types_h.ASN1_ITEM_st) return System.Address  -- /usr/include/openssl/asn1.h:1001
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_item_unpack";

   function ASN1_item_unpack_ex
     (oct : access constant asn1_string_st;
      it : access constant openssl_types_h.ASN1_ITEM_st;
      libctx : access openssl_types_h.ossl_lib_ctx_st;
      propq : Interfaces.C.Strings.chars_ptr) return System.Address  -- /usr/include/openssl/asn1.h:1002
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_item_unpack_ex";

   function ASN1_item_pack
     (obj : System.Address;
      it : access constant openssl_types_h.ASN1_ITEM_st;
      oct : System.Address) return access asn1_string_st  -- /usr/include/openssl/asn1.h:1005
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_item_pack";

   procedure ASN1_STRING_set_default_mask (mask : unsigned_long)  -- /usr/include/openssl/asn1.h:1008
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_set_default_mask";

   function ASN1_STRING_set_default_mask_asc (p : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/asn1.h:1009
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_set_default_mask_asc";

   function ASN1_STRING_get_default_mask return unsigned_long  -- /usr/include/openssl/asn1.h:1010
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_get_default_mask";

   function ASN1_mbstring_copy
     (c_out : System.Address;
      c_in : access unsigned_char;
      len : int;
      inform : int;
      mask : unsigned_long) return int  -- /usr/include/openssl/asn1.h:1011
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_mbstring_copy";

   function ASN1_mbstring_ncopy
     (c_out : System.Address;
      c_in : access unsigned_char;
      len : int;
      inform : int;
      mask : unsigned_long;
      minsize : long;
      maxsize : long) return int  -- /usr/include/openssl/asn1.h:1013
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_mbstring_ncopy";

   function ASN1_STRING_set_by_NID
     (c_out : System.Address;
      c_in : access unsigned_char;
      inlen : int;
      inform : int;
      nid : int) return access asn1_string_st  -- /usr/include/openssl/asn1.h:1017
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_set_by_NID";

   function ASN1_STRING_TABLE_get (nid : int) return access asn1_string_table_st  -- /usr/include/openssl/asn1.h:1020
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_TABLE_get";

   function ASN1_STRING_TABLE_add
     (arg1 : int;
      arg2 : long;
      arg3 : long;
      arg4 : unsigned_long;
      arg5 : unsigned_long) return int  -- /usr/include/openssl/asn1.h:1021
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_TABLE_add";

   procedure ASN1_STRING_TABLE_cleanup  -- /usr/include/openssl/asn1.h:1022
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_STRING_TABLE_cleanup";

  -- ASN1 template functions  
  -- Old API compatible functions  
   function ASN1_item_new (it : access constant openssl_types_h.ASN1_ITEM_st) return access ASN1_VALUE  -- /usr/include/openssl/asn1.h:1027
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_item_new";

   function ASN1_item_new_ex
     (it : access constant openssl_types_h.ASN1_ITEM_st;
      libctx : access openssl_types_h.ossl_lib_ctx_st;
      propq : Interfaces.C.Strings.chars_ptr) return access ASN1_VALUE  -- /usr/include/openssl/asn1.h:1028
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_item_new_ex";

   procedure ASN1_item_free (val : access ASN1_VALUE; it : access constant openssl_types_h.ASN1_ITEM_st)  -- /usr/include/openssl/asn1.h:1030
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_item_free";

   function ASN1_item_d2i_ex
     (val : System.Address;
      c_in : System.Address;
      len : long;
      it : access constant openssl_types_h.ASN1_ITEM_st;
      libctx : access openssl_types_h.ossl_lib_ctx_st;
      propq : Interfaces.C.Strings.chars_ptr) return access ASN1_VALUE  -- /usr/include/openssl/asn1.h:1031
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_item_d2i_ex";

   function ASN1_item_d2i
     (val : System.Address;
      c_in : System.Address;
      len : long;
      it : access constant openssl_types_h.ASN1_ITEM_st) return access ASN1_VALUE  -- /usr/include/openssl/asn1.h:1034
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_item_d2i";

   function ASN1_item_i2d
     (val : access constant ASN1_VALUE;
      c_out : System.Address;
      it : access constant openssl_types_h.ASN1_ITEM_st) return int  -- /usr/include/openssl/asn1.h:1036
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_item_i2d";

   function ASN1_item_ndef_i2d
     (val : access constant ASN1_VALUE;
      c_out : System.Address;
      it : access constant openssl_types_h.ASN1_ITEM_st) return int  -- /usr/include/openssl/asn1.h:1037
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_item_ndef_i2d";

   procedure ASN1_add_oid_module  -- /usr/include/openssl/asn1.h:1040
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_add_oid_module";

   procedure ASN1_add_stable_module  -- /usr/include/openssl/asn1.h:1041
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_add_stable_module";

   function ASN1_generate_nconf (str : Interfaces.C.Strings.chars_ptr; nconf : access openssl_types_h.conf_st) return access asn1_type_st  -- /usr/include/openssl/asn1.h:1043
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_generate_nconf";

   function ASN1_generate_v3 (str : Interfaces.C.Strings.chars_ptr; cnf : access openssl_types_h.v3_ext_ctx) return access asn1_type_st  -- /usr/include/openssl/asn1.h:1044
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_generate_v3";

   function ASN1_str2mask (str : Interfaces.C.Strings.chars_ptr; pmask : access unsigned_long) return int  -- /usr/include/openssl/asn1.h:1045
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_str2mask";

  -- ASN1 Print flags  
  -- Indicate missing OPTIONAL fields  
  -- Mark start and end of SEQUENCE  
  -- Mark start and end of SEQUENCE/SET OF  
  -- Show the ASN1 type of primitives  
  -- Don't show ASN1 type of ANY  
  -- Don't show ASN1 type of MSTRINGs  
  -- Don't show field names in SEQUENCE  
  -- Show structure names of each SEQUENCE field  
  -- Don't show structure name even at top level  
   function ASN1_item_print
     (c_out : access openssl_types_h.bio_st;
      ifld : access constant ASN1_VALUE;
      indent : int;
      it : access constant openssl_types_h.ASN1_ITEM_st;
      pctx : access constant openssl_types_h.asn1_pctx_st) return int  -- /usr/include/openssl/asn1.h:1068
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_item_print";

   function ASN1_PCTX_new return access openssl_types_h.asn1_pctx_st  -- /usr/include/openssl/asn1.h:1070
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_PCTX_new";

   procedure ASN1_PCTX_free (p : access openssl_types_h.asn1_pctx_st)  -- /usr/include/openssl/asn1.h:1071
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_PCTX_free";

   function ASN1_PCTX_get_flags (p : access constant openssl_types_h.asn1_pctx_st) return unsigned_long  -- /usr/include/openssl/asn1.h:1072
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_PCTX_get_flags";

   procedure ASN1_PCTX_set_flags (p : access openssl_types_h.asn1_pctx_st; flags : unsigned_long)  -- /usr/include/openssl/asn1.h:1073
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_PCTX_set_flags";

   function ASN1_PCTX_get_nm_flags (p : access constant openssl_types_h.asn1_pctx_st) return unsigned_long  -- /usr/include/openssl/asn1.h:1074
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_PCTX_get_nm_flags";

   procedure ASN1_PCTX_set_nm_flags (p : access openssl_types_h.asn1_pctx_st; flags : unsigned_long)  -- /usr/include/openssl/asn1.h:1075
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_PCTX_set_nm_flags";

   function ASN1_PCTX_get_cert_flags (p : access constant openssl_types_h.asn1_pctx_st) return unsigned_long  -- /usr/include/openssl/asn1.h:1076
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_PCTX_get_cert_flags";

   procedure ASN1_PCTX_set_cert_flags (p : access openssl_types_h.asn1_pctx_st; flags : unsigned_long)  -- /usr/include/openssl/asn1.h:1077
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_PCTX_set_cert_flags";

   function ASN1_PCTX_get_oid_flags (p : access constant openssl_types_h.asn1_pctx_st) return unsigned_long  -- /usr/include/openssl/asn1.h:1078
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_PCTX_get_oid_flags";

   procedure ASN1_PCTX_set_oid_flags (p : access openssl_types_h.asn1_pctx_st; flags : unsigned_long)  -- /usr/include/openssl/asn1.h:1079
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_PCTX_set_oid_flags";

   function ASN1_PCTX_get_str_flags (p : access constant openssl_types_h.asn1_pctx_st) return unsigned_long  -- /usr/include/openssl/asn1.h:1080
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_PCTX_get_str_flags";

   procedure ASN1_PCTX_set_str_flags (p : access openssl_types_h.asn1_pctx_st; flags : unsigned_long)  -- /usr/include/openssl/asn1.h:1081
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_PCTX_set_str_flags";

   function ASN1_SCTX_new (scan_cb : access function (arg1 : access openssl_types_h.asn1_sctx_st) return int) return access openssl_types_h.asn1_sctx_st  -- /usr/include/openssl/asn1.h:1083
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_SCTX_new";

   procedure ASN1_SCTX_free (p : access openssl_types_h.asn1_sctx_st)  -- /usr/include/openssl/asn1.h:1084
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_SCTX_free";

   function ASN1_SCTX_get_item (p : access openssl_types_h.asn1_sctx_st) return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:1085
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_SCTX_get_item";

   function ASN1_SCTX_get_template (p : access openssl_types_h.asn1_sctx_st) return access constant ASN1_TEMPLATE  -- /usr/include/openssl/asn1.h:1086
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_SCTX_get_template";

   function ASN1_SCTX_get_flags (p : access openssl_types_h.asn1_sctx_st) return unsigned_long  -- /usr/include/openssl/asn1.h:1087
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_SCTX_get_flags";

   procedure ASN1_SCTX_set_app_data (p : access openssl_types_h.asn1_sctx_st; data : System.Address)  -- /usr/include/openssl/asn1.h:1088
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_SCTX_set_app_data";

   function ASN1_SCTX_get_app_data (p : access openssl_types_h.asn1_sctx_st) return System.Address  -- /usr/include/openssl/asn1.h:1089
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_SCTX_get_app_data";

   function BIO_f_asn1 return access constant openssl_bio_h.bio_method_st  -- /usr/include/openssl/asn1.h:1091
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_f_asn1";

  -- cannot constify val because of CMS_stream()  
   function BIO_new_NDEF
     (c_out : access openssl_types_h.bio_st;
      val : access ASN1_VALUE;
      it : access constant openssl_types_h.ASN1_ITEM_st) return access openssl_types_h.bio_st  -- /usr/include/openssl/asn1.h:1094
   with Import => True, 
        Convention => C, 
        External_Name => "BIO_new_NDEF";

   function i2d_ASN1_bio_stream
     (c_out : access openssl_types_h.bio_st;
      val : access ASN1_VALUE;
      c_in : access openssl_types_h.bio_st;
      flags : int;
      it : access constant openssl_types_h.ASN1_ITEM_st) return int  -- /usr/include/openssl/asn1.h:1096
   with Import => True, 
        Convention => C, 
        External_Name => "i2d_ASN1_bio_stream";

   function PEM_write_bio_ASN1_stream
     (c_out : access openssl_types_h.bio_st;
      val : access ASN1_VALUE;
      c_in : access openssl_types_h.bio_st;
      flags : int;
      hdr : Interfaces.C.Strings.chars_ptr;
      it : access constant openssl_types_h.ASN1_ITEM_st) return int  -- /usr/include/openssl/asn1.h:1098
   with Import => True, 
        Convention => C, 
        External_Name => "PEM_write_bio_ASN1_stream";

  -- cannot constify val because of CMS_dataFinal()  
   function SMIME_write_ASN1
     (the_bio : access openssl_types_h.bio_st;
      val : access ASN1_VALUE;
      data : access openssl_types_h.bio_st;
      flags : int;
      ctype_nid : int;
      econt_nid : int;
      mdalgs : access stack_st_X509_ALGOR;
      it : access constant openssl_types_h.ASN1_ITEM_st) return int  -- /usr/include/openssl/asn1.h:1101
   with Import => True, 
        Convention => C, 
        External_Name => "SMIME_write_ASN1";

   function SMIME_write_ASN1_ex
     (the_bio : access openssl_types_h.bio_st;
      val : access ASN1_VALUE;
      data : access openssl_types_h.bio_st;
      flags : int;
      ctype_nid : int;
      econt_nid : int;
      mdalgs : access stack_st_X509_ALGOR;
      it : access constant openssl_types_h.ASN1_ITEM_st;
      libctx : access openssl_types_h.ossl_lib_ctx_st;
      propq : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/asn1.h:1104
   with Import => True, 
        Convention => C, 
        External_Name => "SMIME_write_ASN1_ex";

   function SMIME_read_ASN1
     (the_bio : access openssl_types_h.bio_st;
      bcont : System.Address;
      it : access constant openssl_types_h.ASN1_ITEM_st) return access ASN1_VALUE  -- /usr/include/openssl/asn1.h:1108
   with Import => True, 
        Convention => C, 
        External_Name => "SMIME_read_ASN1";

   function SMIME_read_ASN1_ex
     (the_bio : access openssl_types_h.bio_st;
      flags : int;
      bcont : System.Address;
      it : access constant openssl_types_h.ASN1_ITEM_st;
      x : System.Address;
      libctx : access openssl_types_h.ossl_lib_ctx_st;
      propq : Interfaces.C.Strings.chars_ptr) return access ASN1_VALUE  -- /usr/include/openssl/asn1.h:1109
   with Import => True, 
        Convention => C, 
        External_Name => "SMIME_read_ASN1_ex";

   function SMIME_crlf_copy
     (c_in : access openssl_types_h.bio_st;
      c_out : access openssl_types_h.bio_st;
      flags : int) return int  -- /usr/include/openssl/asn1.h:1112
   with Import => True, 
        Convention => C, 
        External_Name => "SMIME_crlf_copy";

   function SMIME_text (c_in : access openssl_types_h.bio_st; c_out : access openssl_types_h.bio_st) return int  -- /usr/include/openssl/asn1.h:1113
   with Import => True, 
        Convention => C, 
        External_Name => "SMIME_text";

   function ASN1_ITEM_lookup (name : Interfaces.C.Strings.chars_ptr) return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:1115
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_ITEM_lookup";

   function ASN1_ITEM_get (i : stddef_h.size_t) return access constant openssl_types_h.ASN1_ITEM_st  -- /usr/include/openssl/asn1.h:1116
   with Import => True, 
        Convention => C, 
        External_Name => "ASN1_ITEM_get";

  -- Legacy compatibility  
end openssl_asn1_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
