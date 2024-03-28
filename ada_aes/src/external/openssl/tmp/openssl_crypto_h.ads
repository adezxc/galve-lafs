pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with System;
with bits_stdint_uintn_h;
with Interfaces.C.Strings;
with stddef_h;
limited with openssl_types_h;
with openssl_stack_h;
with bits_types_time_t_h;
limited with bits_types_struct_tm_h;
with bits_pthreadtypes_h;
limited with openssl_core_h;

package openssl_crypto_h is

   --  unsupported macro: SSLeay OpenSSL_version_num
   --  unsupported macro: SSLeay_version OpenSSL_version
   --  unsupported macro: SSLEAY_VERSION_NUMBER OPENSSL_VERSION_NUMBER
   --  unsupported macro: SSLEAY_VERSION OPENSSL_VERSION
   --  unsupported macro: SSLEAY_CFLAGS OPENSSL_CFLAGS
   --  unsupported macro: SSLEAY_BUILT_ON OPENSSL_BUILT_ON
   --  unsupported macro: SSLEAY_PLATFORM OPENSSL_PLATFORM
   --  unsupported macro: SSLEAY_DIR OPENSSL_DIR
   --  arg-macro: procedure OPENSSL_malloc_init ()
   --    while(0) continue
   --  arg-macro: procedure OPENSSL_malloc (num)
   --    CRYPTO_malloc(num, OPENSSL_FILE, OPENSSL_LINE)
   --  arg-macro: procedure OPENSSL_zalloc (num)
   --    CRYPTO_zalloc(num, OPENSSL_FILE, OPENSSL_LINE)
   --  arg-macro: procedure OPENSSL_realloc (addr, num)
   --    CRYPTO_realloc(addr, num, OPENSSL_FILE, OPENSSL_LINE)
   --  arg-macro: procedure OPENSSL_clear_realloc (addr, old_num, num)
   --    CRYPTO_clear_realloc(addr, old_num, num, OPENSSL_FILE, OPENSSL_LINE)
   --  arg-macro: procedure OPENSSL_clear_free (addr, num)
   --    CRYPTO_clear_free(addr, num, OPENSSL_FILE, OPENSSL_LINE)
   --  arg-macro: procedure OPENSSL_free (addr)
   --    CRYPTO_free(addr, OPENSSL_FILE, OPENSSL_LINE)
   --  arg-macro: procedure OPENSSL_memdup (str, s)
   --    CRYPTO_memdup((str), s, OPENSSL_FILE, OPENSSL_LINE)
   --  arg-macro: procedure OPENSSL_strdup (str)
   --    CRYPTO_strdup(str, OPENSSL_FILE, OPENSSL_LINE)
   --  arg-macro: procedure OPENSSL_strndup (str, n)
   --    CRYPTO_strndup(str, n, OPENSSL_FILE, OPENSSL_LINE)
   --  arg-macro: procedure OPENSSL_secure_malloc (num)
   --    CRYPTO_secure_malloc(num, OPENSSL_FILE, OPENSSL_LINE)
   --  arg-macro: procedure OPENSSL_secure_zalloc (num)
   --    CRYPTO_secure_zalloc(num, OPENSSL_FILE, OPENSSL_LINE)
   --  arg-macro: procedure OPENSSL_secure_free (addr)
   --    CRYPTO_secure_free(addr, OPENSSL_FILE, OPENSSL_LINE)
   --  arg-macro: procedure OPENSSL_secure_clear_free (addr, num)
   --    CRYPTO_secure_clear_free(addr, num, OPENSSL_FILE, OPENSSL_LINE)
   --  arg-macro: procedure OPENSSL_secure_actual_size (ptr)
   --    CRYPTO_secure_actual_size(ptr)
   --  arg-macro: function OPENSSL_MALLOC_MAX_NELEMS (type)
   --    return ((2**(sizeof(int)*8-1))-1)/sizeof(type);
   OPENSSL_VERSION : constant := 0;  --  /usr/include/openssl/crypto.h:154
   OPENSSL_CFLAGS : constant := 1;  --  /usr/include/openssl/crypto.h:155
   OPENSSL_BUILT_ON : constant := 2;  --  /usr/include/openssl/crypto.h:156
   OPENSSL_PLATFORM : constant := 3;  --  /usr/include/openssl/crypto.h:157
   OPENSSL_DIR : constant := 4;  --  /usr/include/openssl/crypto.h:158
   OPENSSL_ENGINES_DIR : constant := 5;  --  /usr/include/openssl/crypto.h:159
   OPENSSL_VERSION_STRING : constant := 6;  --  /usr/include/openssl/crypto.h:160
   OPENSSL_FULL_VERSION_STRING : constant := 7;  --  /usr/include/openssl/crypto.h:161
   OPENSSL_MODULES_DIR : constant := 8;  --  /usr/include/openssl/crypto.h:162
   OPENSSL_CPU_INFO : constant := 9;  --  /usr/include/openssl/crypto.h:163

   OPENSSL_INFO_CONFIG_DIR : constant := 1001;  --  /usr/include/openssl/crypto.h:170
   OPENSSL_INFO_ENGINES_DIR : constant := 1002;  --  /usr/include/openssl/crypto.h:171
   OPENSSL_INFO_MODULES_DIR : constant := 1003;  --  /usr/include/openssl/crypto.h:172
   OPENSSL_INFO_DSO_EXTENSION : constant := 1004;  --  /usr/include/openssl/crypto.h:173
   OPENSSL_INFO_DIR_FILENAME_SEPARATOR : constant := 1005;  --  /usr/include/openssl/crypto.h:174
   OPENSSL_INFO_LIST_SEPARATOR : constant := 1006;  --  /usr/include/openssl/crypto.h:175
   OPENSSL_INFO_SEED_SOURCE : constant := 1007;  --  /usr/include/openssl/crypto.h:176
   OPENSSL_INFO_CPU_SETTINGS : constant := 1008;  --  /usr/include/openssl/crypto.h:177
   --  arg-macro: procedure sk_void_num (sk)
   --    OPENSSL_sk_num(ossl_check_const_void_sk_type(sk))
   --  arg-macro: function sk_void_value (sk, idx)
   --    return (void *)OPENSSL_sk_value(ossl_check_const_void_sk_type(sk), (idx));
   --  arg-macro: function sk_void_new (cmp)
   --    return (STACK_OF(void) *)OPENSSL_sk_new(ossl_check_void_compfunc_type(cmp));
   --  arg-macro: function sk_void_new_null ()
   --    return (STACK_OF(void) *)OPENSSL_sk_new_null();
   --  arg-macro: function sk_void_new_reserve (cmp, n)
   --    return (STACK_OF(void) *)OPENSSL_sk_new_reserve(ossl_check_void_compfunc_type(cmp), (n));
   --  arg-macro: procedure sk_void_reserve (sk, n)
   --    OPENSSL_sk_reserve(ossl_check_void_sk_type(sk), (n))
   --  arg-macro: procedure sk_void_free (sk)
   --    OPENSSL_sk_free(ossl_check_void_sk_type(sk))
   --  arg-macro: procedure sk_void_zero (sk)
   --    OPENSSL_sk_zero(ossl_check_void_sk_type(sk))
   --  arg-macro: function sk_void_delete (sk, i)
   --    return (void *)OPENSSL_sk_delete(ossl_check_void_sk_type(sk), (i));
   --  arg-macro: function sk_void_delete_ptr (sk, ptr)
   --    return (void *)OPENSSL_sk_delete_ptr(ossl_check_void_sk_type(sk), ossl_check_void_type(ptr));
   --  arg-macro: procedure sk_void_push (sk, ptr)
   --    OPENSSL_sk_push(ossl_check_void_sk_type(sk), ossl_check_void_type(ptr))
   --  arg-macro: procedure sk_void_unshift (sk, ptr)
   --    OPENSSL_sk_unshift(ossl_check_void_sk_type(sk), ossl_check_void_type(ptr))
   --  arg-macro: function sk_void_pop (sk)
   --    return (void *)OPENSSL_sk_pop(ossl_check_void_sk_type(sk));
   --  arg-macro: function sk_void_shift (sk)
   --    return (void *)OPENSSL_sk_shift(ossl_check_void_sk_type(sk));
   --  arg-macro: procedure sk_void_pop_free (sk, freefunc)
   --    OPENSSL_sk_pop_free(ossl_check_void_sk_type(sk),ossl_check_void_freefunc_type(freefunc))
   --  arg-macro: procedure sk_void_insert (sk, ptr, idx)
   --    OPENSSL_sk_insert(ossl_check_void_sk_type(sk), ossl_check_void_type(ptr), (idx))
   --  arg-macro: function sk_void_set (sk, idx, ptr)
   --    return (void *)OPENSSL_sk_set(ossl_check_void_sk_type(sk), (idx), ossl_check_void_type(ptr));
   --  arg-macro: procedure sk_void_find (sk, ptr)
   --    OPENSSL_sk_find(ossl_check_void_sk_type(sk), ossl_check_void_type(ptr))
   --  arg-macro: procedure sk_void_find_ex (sk, ptr)
   --    OPENSSL_sk_find_ex(ossl_check_void_sk_type(sk), ossl_check_void_type(ptr))
   --  arg-macro: procedure sk_void_find_all (sk, ptr, pnum)
   --    OPENSSL_sk_find_all(ossl_check_void_sk_type(sk), ossl_check_void_type(ptr), pnum)
   --  arg-macro: procedure sk_void_sort (sk)
   --    OPENSSL_sk_sort(ossl_check_void_sk_type(sk))
   --  arg-macro: procedure sk_void_is_sorted (sk)
   --    OPENSSL_sk_is_sorted(ossl_check_const_void_sk_type(sk))
   --  arg-macro: function sk_void_dup (sk)
   --    return (STACK_OF(void) *)OPENSSL_sk_dup(ossl_check_const_void_sk_type(sk));
   --  arg-macro: function sk_void_deep_copy (sk, copyfunc, freefunc)
   --    return (STACK_OF(void) *)OPENSSL_sk_deep_copy(ossl_check_const_void_sk_type(sk), ossl_check_void_copyfunc_type(copyfunc), ossl_check_void_freefunc_type(freefunc));
   --  arg-macro: function sk_void_set_cmp_func (sk, cmp)
   --    return (sk_void_compfunc)OPENSSL_sk_set_cmp_func(ossl_check_void_sk_type(sk), ossl_check_void_compfunc_type(cmp));

   CRYPTO_EX_INDEX_SSL : constant := 0;  --  /usr/include/openssl/crypto.h:218
   CRYPTO_EX_INDEX_SSL_CTX : constant := 1;  --  /usr/include/openssl/crypto.h:219
   CRYPTO_EX_INDEX_SSL_SESSION : constant := 2;  --  /usr/include/openssl/crypto.h:220
   CRYPTO_EX_INDEX_X509 : constant := 3;  --  /usr/include/openssl/crypto.h:221
   CRYPTO_EX_INDEX_X509_STORE : constant := 4;  --  /usr/include/openssl/crypto.h:222
   CRYPTO_EX_INDEX_X509_STORE_CTX : constant := 5;  --  /usr/include/openssl/crypto.h:223
   CRYPTO_EX_INDEX_DH : constant := 6;  --  /usr/include/openssl/crypto.h:224
   CRYPTO_EX_INDEX_DSA : constant := 7;  --  /usr/include/openssl/crypto.h:225
   CRYPTO_EX_INDEX_EC_KEY : constant := 8;  --  /usr/include/openssl/crypto.h:226
   CRYPTO_EX_INDEX_RSA : constant := 9;  --  /usr/include/openssl/crypto.h:227
   CRYPTO_EX_INDEX_ENGINE : constant := 10;  --  /usr/include/openssl/crypto.h:228
   CRYPTO_EX_INDEX_UI : constant := 11;  --  /usr/include/openssl/crypto.h:229
   CRYPTO_EX_INDEX_BIO : constant := 12;  --  /usr/include/openssl/crypto.h:230
   CRYPTO_EX_INDEX_APP : constant := 13;  --  /usr/include/openssl/crypto.h:231
   CRYPTO_EX_INDEX_UI_METHOD : constant := 14;  --  /usr/include/openssl/crypto.h:232
   CRYPTO_EX_INDEX_RAND_DRBG : constant := 15;  --  /usr/include/openssl/crypto.h:233
   --  unsupported macro: CRYPTO_EX_INDEX_DRBG CRYPTO_EX_INDEX_RAND_DRBG

   CRYPTO_EX_INDEX_OSSL_LIB_CTX : constant := 16;  --  /usr/include/openssl/crypto.h:235
   CRYPTO_EX_INDEX_EVP_PKEY : constant := 17;  --  /usr/include/openssl/crypto.h:236
   CRYPTO_EX_INDEX_u_COUNT : constant := 18;  --  /usr/include/openssl/crypto.h:237
   --  arg-macro: procedure CRYPTO_cleanup_all_ex_data ()
   --    while(0) continue
   --  arg-macro: function CRYPTO_num_locks ()
   --    return 1;
   --  arg-macro: function CRYPTO_get_locking_callback ()
   --    return NULL;
   --  arg-macro: function CRYPTO_get_add_lock_callback ()
   --    return NULL;

   CRYPTO_LOCK : constant := 1;  --  /usr/include/openssl/crypto.h:301
   CRYPTO_UNLOCK : constant := 2;  --  /usr/include/openssl/crypto.h:302
   CRYPTO_READ : constant := 4;  --  /usr/include/openssl/crypto.h:303
   CRYPTO_WRITE : constant := 8;  --  /usr/include/openssl/crypto.h:304
   --  arg-macro: function CRYPTO_THREADID_set_callback (threadid_func)
   --    return 0;
   --  arg-macro: function CRYPTO_THREADID_get_callback ()
   --    return NULL;
   --  arg-macro: function CRYPTO_THREADID_cmp (a, b)
   --    return -1;
   --  arg-macro: function CRYPTO_THREADID_hash (id)
   --    return 0;
   --  arg-macro: function CRYPTO_get_id_callback ()
   --    return NULL;
   --  arg-macro: function CRYPTO_thread_id ()
   --    return 0;
   --  arg-macro: function CRYPTO_get_dynlock_create_callback ()
   --    return NULL;
   --  arg-macro: function CRYPTO_get_dynlock_lock_callback ()
   --    return NULL;
   --  arg-macro: function CRYPTO_get_dynlock_destroy_callback ()
   --    return NULL;
   --  arg-macro: procedure OpenSSLDie (f, l, a)
   --    OPENSSL_die((a),(f),(l))
   --  unsupported macro: OPENSSL_assert(e) (void)((e) ? 0 : (OPENSSL_die("assertion failed: " #e, OPENSSL_FILE, OPENSSL_LINE), 1))

   OPENSSL_INIT_NO_LOAD_CRYPTO_STRINGS : constant := 16#00000001#;  --  /usr/include/openssl/crypto.h:449
   OPENSSL_INIT_LOAD_CRYPTO_STRINGS : constant := 16#00000002#;  --  /usr/include/openssl/crypto.h:450
   OPENSSL_INIT_ADD_ALL_CIPHERS : constant := 16#00000004#;  --  /usr/include/openssl/crypto.h:451
   OPENSSL_INIT_ADD_ALL_DIGESTS : constant := 16#00000008#;  --  /usr/include/openssl/crypto.h:452
   OPENSSL_INIT_NO_ADD_ALL_CIPHERS : constant := 16#00000010#;  --  /usr/include/openssl/crypto.h:453
   OPENSSL_INIT_NO_ADD_ALL_DIGESTS : constant := 16#00000020#;  --  /usr/include/openssl/crypto.h:454
   OPENSSL_INIT_LOAD_CONFIG : constant := 16#00000040#;  --  /usr/include/openssl/crypto.h:455
   OPENSSL_INIT_NO_LOAD_CONFIG : constant := 16#00000080#;  --  /usr/include/openssl/crypto.h:456
   OPENSSL_INIT_ASYNC : constant := 16#00000100#;  --  /usr/include/openssl/crypto.h:457
   OPENSSL_INIT_ENGINE_RDRAND : constant := 16#00000200#;  --  /usr/include/openssl/crypto.h:458
   OPENSSL_INIT_ENGINE_DYNAMIC : constant := 16#00000400#;  --  /usr/include/openssl/crypto.h:459
   OPENSSL_INIT_ENGINE_OPENSSL : constant := 16#00000800#;  --  /usr/include/openssl/crypto.h:460
   OPENSSL_INIT_ENGINE_CRYPTODEV : constant := 16#00001000#;  --  /usr/include/openssl/crypto.h:461
   OPENSSL_INIT_ENGINE_CAPI : constant := 16#00002000#;  --  /usr/include/openssl/crypto.h:462
   OPENSSL_INIT_ENGINE_PADLOCK : constant := 16#00004000#;  --  /usr/include/openssl/crypto.h:463
   OPENSSL_INIT_ENGINE_AFALG : constant := 16#00008000#;  --  /usr/include/openssl/crypto.h:464

   OPENSSL_INIT_ATFORK : constant := 16#00020000#;  --  /usr/include/openssl/crypto.h:466

   OPENSSL_INIT_NO_ATEXIT : constant := 16#00080000#;  --  /usr/include/openssl/crypto.h:468
   --  unsupported macro: OPENSSL_INIT_ENGINE_ALL_BUILTIN (OPENSSL_INIT_ENGINE_RDRAND | OPENSSL_INIT_ENGINE_DYNAMIC | OPENSSL_INIT_ENGINE_CRYPTODEV | OPENSSL_INIT_ENGINE_CAPI | OPENSSL_INIT_ENGINE_PADLOCK)
   --  unsupported macro: CRYPTO_ONCE_STATIC_INIT PTHREAD_ONCE_INIT

  -- * WARNING: do not edit!
  -- * Generated by Makefile from include/openssl/crypto.h.in
  -- *
  -- * Copyright 1995-2023 The OpenSSL Project Authors. All Rights Reserved.
  -- * Copyright (c) 2002, Oracle and/or its affiliates. All rights reserved
  -- *
  -- * Licensed under the Apache License 2.0 (the "License").  You may not use
  -- * this file except in compliance with the License.  You can obtain a copy
  -- * in the file LICENSE in the source distribution or at
  -- * https://www.openssl.org/source/license.html
  --  

  -- * Resolve problems on some operating systems with symbol names that clash
  -- * one way or another
  --  

  -- * Old type for allocating dynamic locks. No longer used. Use the new thread
  -- * API instead.
  --  

   type CRYPTO_dynlock is record
      dummy : aliased int;  -- /usr/include/openssl/crypto.h:74
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/openssl/crypto.h:75

   subtype CRYPTO_RWLOCK is System.Address;  -- /usr/include/openssl/crypto.h:79

   function CRYPTO_THREAD_lock_new return System.Address  -- /usr/include/openssl/crypto.h:81
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_THREAD_lock_new";

   function CRYPTO_THREAD_read_lock (lock : System.Address) return int  -- /usr/include/openssl/crypto.h:82
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_THREAD_read_lock";

   function CRYPTO_THREAD_write_lock (lock : System.Address) return int  -- /usr/include/openssl/crypto.h:83
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_THREAD_write_lock";

   function CRYPTO_THREAD_unlock (lock : System.Address) return int  -- /usr/include/openssl/crypto.h:84
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_THREAD_unlock";

   procedure CRYPTO_THREAD_lock_free (lock : System.Address)  -- /usr/include/openssl/crypto.h:85
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_THREAD_lock_free";

   function CRYPTO_atomic_add
     (val : access int;
      amount : int;
      ret : access int;
      lock : System.Address) return int  -- /usr/include/openssl/crypto.h:87
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_atomic_add";

   function CRYPTO_atomic_or
     (val : access bits_stdint_uintn_h.uint64_t;
      op : bits_stdint_uintn_h.uint64_t;
      ret : access bits_stdint_uintn_h.uint64_t;
      lock : System.Address) return int  -- /usr/include/openssl/crypto.h:88
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_atomic_or";

   function CRYPTO_atomic_load
     (val : access bits_stdint_uintn_h.uint64_t;
      ret : access bits_stdint_uintn_h.uint64_t;
      lock : System.Address) return int  -- /usr/include/openssl/crypto.h:90
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_atomic_load";

   function CRYPTO_atomic_load_int
     (val : access int;
      ret : access int;
      lock : System.Address) return int  -- /usr/include/openssl/crypto.h:91
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_atomic_load_int";

  -- No longer needed, so this is a no-op  
   function OPENSSL_strlcpy
     (dst : Interfaces.C.Strings.chars_ptr;
      src : Interfaces.C.Strings.chars_ptr;
      siz : stddef_h.size_t) return stddef_h.size_t  -- /usr/include/openssl/crypto.h:125
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_strlcpy";

   function OPENSSL_strlcat
     (dst : Interfaces.C.Strings.chars_ptr;
      src : Interfaces.C.Strings.chars_ptr;
      siz : stddef_h.size_t) return stddef_h.size_t  -- /usr/include/openssl/crypto.h:126
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_strlcat";

   function OPENSSL_strnlen (str : Interfaces.C.Strings.chars_ptr; maxlen : stddef_h.size_t) return stddef_h.size_t  -- /usr/include/openssl/crypto.h:127
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_strnlen";

   function OPENSSL_buf2hexstr_ex
     (str : Interfaces.C.Strings.chars_ptr;
      str_n : stddef_h.size_t;
      strlength : access stddef_h.size_t;
      buf : access unsigned_char;
      buflen : stddef_h.size_t;
      sep : char) return int  -- /usr/include/openssl/crypto.h:128
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_buf2hexstr_ex";

   function OPENSSL_buf2hexstr (buf : access unsigned_char; buflen : long) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/crypto.h:131
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_buf2hexstr";

   function OPENSSL_hexstr2buf_ex
     (buf : access unsigned_char;
      buf_n : stddef_h.size_t;
      buflen : access stddef_h.size_t;
      str : Interfaces.C.Strings.chars_ptr;
      sep : char) return int  -- /usr/include/openssl/crypto.h:132
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_hexstr2buf_ex";

   function OPENSSL_hexstr2buf (str : Interfaces.C.Strings.chars_ptr; buflen : access long) return access unsigned_char  -- /usr/include/openssl/crypto.h:134
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_hexstr2buf";

   function OPENSSL_hexchar2int (c : unsigned_char) return int  -- /usr/include/openssl/crypto.h:135
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_hexchar2int";

   function OPENSSL_strcasecmp (s1 : Interfaces.C.Strings.chars_ptr; s2 : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/crypto.h:136
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_strcasecmp";

   function OPENSSL_strncasecmp
     (s1 : Interfaces.C.Strings.chars_ptr;
      s2 : Interfaces.C.Strings.chars_ptr;
      n : stddef_h.size_t) return int  -- /usr/include/openssl/crypto.h:137
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_strncasecmp";

  -- * These functions return the values of OPENSSL_VERSION_MAJOR,
  -- * OPENSSL_VERSION_MINOR, OPENSSL_VERSION_PATCH, OPENSSL_VERSION_PRE_RELEASE
  -- * and OPENSSL_VERSION_BUILD_METADATA, respectively.
  --  

   function OPENSSL_version_major return unsigned  -- /usr/include/openssl/crypto.h:146
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_version_major";

   function OPENSSL_version_minor return unsigned  -- /usr/include/openssl/crypto.h:147
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_version_minor";

   function OPENSSL_version_patch return unsigned  -- /usr/include/openssl/crypto.h:148
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_version_patch";

   function OPENSSL_version_pre_release return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/crypto.h:149
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_version_pre_release";

   function OPENSSL_version_build_metadata return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/crypto.h:150
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_version_build_metadata";

   function OpenSSL_version_num return unsigned_long  -- /usr/include/openssl/crypto.h:152
   with Import => True, 
        Convention => C, 
        External_Name => "OpenSSL_version_num";

   function OpenSSL_version (c_type : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/crypto.h:153
   with Import => True, 
        Convention => C, 
        External_Name => "OpenSSL_version";

   function OPENSSL_info (c_type : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/crypto.h:165
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_info";

  -- * The series starts at 1001 to avoid confusion with the OpenSSL_version
  -- * types.
  --  

   function OPENSSL_issetugid return int  -- /usr/include/openssl/crypto.h:179
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_issetugid";

   type stack_st_void is null record;   -- incomplete struct

   type crypto_ex_data_st is record
      ctx : access openssl_types_h.ossl_lib_ctx_st;  -- /usr/include/openssl/crypto.h:182
      sk : access stack_st_void;  -- /usr/include/openssl/crypto.h:183
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/openssl/crypto.h:181

   type sk_void_compfunc is access function (arg1 : System.Address; arg2 : System.Address) return int
   with Convention => C;  -- /usr/include/openssl/crypto.h:186

   type sk_void_freefunc is access procedure (arg1 : System.Address)
   with Convention => C;  -- /usr/include/openssl/crypto.h:186

   type sk_void_copyfunc is access function (arg1 : System.Address) return System.Address
   with Convention => C;  -- /usr/include/openssl/crypto.h:186

   function ossl_check_void_type (ptr : System.Address) return System.Address  -- /usr/include/openssl/crypto.h:186
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_void_type";

   function ossl_check_const_void_sk_type (sk : access constant stack_st_void) return access constant openssl_stack_h.stack_st  -- /usr/include/openssl/crypto.h:186
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_const_void_sk_type";

   function ossl_check_void_sk_type (sk : access stack_st_void) return access openssl_stack_h.stack_st  -- /usr/include/openssl/crypto.h:186
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_void_sk_type";

   function ossl_check_void_compfunc_type (cmp : sk_void_compfunc) return openssl_stack_h.OPENSSL_sk_compfunc  -- /usr/include/openssl/crypto.h:186
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_void_compfunc_type";

   function ossl_check_void_copyfunc_type (cpy : sk_void_copyfunc) return openssl_stack_h.OPENSSL_sk_copyfunc  -- /usr/include/openssl/crypto.h:186
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_void_copyfunc_type";

   function ossl_check_void_freefunc_type (fr : sk_void_freefunc) return openssl_stack_h.OPENSSL_sk_freefunc  -- /usr/include/openssl/crypto.h:186
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_void_freefunc_type";

  -- * Per class, we have a STACK of function pointers.
  --  

   --  skipped function type CRYPTO_EX_new

   --  skipped function type CRYPTO_EX_free

   --  skipped function type CRYPTO_EX_dup

   function CRYPTO_get_ex_new_index
     (class_index : int;
      argl : long;
      argp : System.Address;
      new_func : access procedure
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : access crypto_ex_data_st;
         arg4 : int;
         arg5 : long;
         arg6 : System.Address);
      dup_func : access function
        (arg1 : access crypto_ex_data_st;
         arg2 : access constant crypto_ex_data_st;
         arg3 : System.Address;
         arg4 : int;
         arg5 : long;
         arg6 : System.Address) return int;
      free_func : access procedure
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : access crypto_ex_data_st;
         arg4 : int;
         arg5 : long;
         arg6 : System.Address)) return int  -- /usr/include/openssl/crypto.h:245
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_get_ex_new_index";

  -- No longer use an index.  
   function CRYPTO_free_ex_index (class_index : int; idx : int) return int  -- /usr/include/openssl/crypto.h:250
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_free_ex_index";

  -- * Initialise/duplicate/free CRYPTO_EX_DATA variables corresponding to a
  -- * given class (invokes whatever per-class callbacks are applicable)
  --  

   function CRYPTO_new_ex_data
     (class_index : int;
      obj : System.Address;
      ad : access crypto_ex_data_st) return int  -- /usr/include/openssl/crypto.h:256
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_new_ex_data";

   function CRYPTO_dup_ex_data
     (class_index : int;
      to : access crypto_ex_data_st;
      from : access constant crypto_ex_data_st) return int  -- /usr/include/openssl/crypto.h:257
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_dup_ex_data";

   procedure CRYPTO_free_ex_data
     (class_index : int;
      obj : System.Address;
      ad : access crypto_ex_data_st)  -- /usr/include/openssl/crypto.h:260
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_free_ex_data";

  -- Allocate a single item in the CRYPTO_EX_DATA variable  
   function CRYPTO_alloc_ex_data
     (class_index : int;
      obj : System.Address;
      ad : access crypto_ex_data_st;
      idx : int) return int  -- /usr/include/openssl/crypto.h:263
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_alloc_ex_data";

  -- * Get/set data in a CRYPTO_EX_DATA variable corresponding to a particular
  -- * index (relative to the class type involved)
  --  

   function CRYPTO_set_ex_data
     (ad : access crypto_ex_data_st;
      idx : int;
      val : System.Address) return int  -- /usr/include/openssl/crypto.h:270
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_set_ex_data";

   function CRYPTO_get_ex_data (ad : access constant crypto_ex_data_st; idx : int) return System.Address  -- /usr/include/openssl/crypto.h:271
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_get_ex_data";

  -- * This function cleans up all "ex_data" state. It mustn't be called under
  -- * potential race-conditions.
  --  

  -- * The old locking functions have been removed completely without compatibility
  -- * macros. This is because the old functions either could not properly report
  -- * errors, or the returned error values were not clearly documented.
  -- * Replacing the locking functions with no-ops would cause race condition
  -- * issues in the affected applications. It is far better for them to fail at
  -- * compile time.
  -- * On the other hand, the locking callbacks are no longer used.  Consequently,
  -- * the callback management functions can be safely replaced with no-op macros.
  --  

  -- * These defines where used in combination with the old locking callbacks,
  -- * they are not called anymore, but old code that's not called might still
  -- * use them.
  --  

  -- This structure is no longer used  
   type crypto_threadid_st is record
      dummy : aliased int;  -- /usr/include/openssl/crypto.h:308
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/openssl/crypto.h:307

   subtype CRYPTO_THREADID is crypto_threadid_st;  -- /usr/include/openssl/crypto.h:309

  -- Only use CRYPTO_THREADID_set_[numeric|pointer]() within callbacks  
   type CRYPTO_malloc_fn is access function
        (arg1 : stddef_h.size_t;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int) return System.Address
   with Convention => C;  -- /usr/include/openssl/crypto.h:334

   type CRYPTO_realloc_fn is access function
        (arg1 : System.Address;
         arg2 : stddef_h.size_t;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : int) return System.Address
   with Convention => C;  -- /usr/include/openssl/crypto.h:335

   type CRYPTO_free_fn is access procedure
        (arg1 : System.Address;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int)
   with Convention => C;  -- /usr/include/openssl/crypto.h:337

   function CRYPTO_set_mem_functions
     (malloc_fn : CRYPTO_malloc_fn;
      realloc_fn : CRYPTO_realloc_fn;
      free_fn : CRYPTO_free_fn) return int  -- /usr/include/openssl/crypto.h:338
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_set_mem_functions";

   procedure CRYPTO_get_mem_functions
     (malloc_fn : System.Address;
      realloc_fn : System.Address;
      free_fn : System.Address)  -- /usr/include/openssl/crypto.h:341
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_get_mem_functions";

   function CRYPTO_malloc
     (num : stddef_h.size_t;
      file : Interfaces.C.Strings.chars_ptr;
      line : int) return System.Address  -- /usr/include/openssl/crypto.h:345
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_malloc";

   function CRYPTO_zalloc
     (num : stddef_h.size_t;
      file : Interfaces.C.Strings.chars_ptr;
      line : int) return System.Address  -- /usr/include/openssl/crypto.h:346
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_zalloc";

   function CRYPTO_memdup
     (str : System.Address;
      siz : stddef_h.size_t;
      file : Interfaces.C.Strings.chars_ptr;
      line : int) return System.Address  -- /usr/include/openssl/crypto.h:347
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_memdup";

   function CRYPTO_strdup
     (str : Interfaces.C.Strings.chars_ptr;
      file : Interfaces.C.Strings.chars_ptr;
      line : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/crypto.h:348
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_strdup";

   function CRYPTO_strndup
     (str : Interfaces.C.Strings.chars_ptr;
      s : stddef_h.size_t;
      file : Interfaces.C.Strings.chars_ptr;
      line : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/crypto.h:349
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_strndup";

   procedure CRYPTO_free
     (ptr : System.Address;
      file : Interfaces.C.Strings.chars_ptr;
      line : int)  -- /usr/include/openssl/crypto.h:350
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_free";

   procedure CRYPTO_clear_free
     (ptr : System.Address;
      num : stddef_h.size_t;
      file : Interfaces.C.Strings.chars_ptr;
      line : int)  -- /usr/include/openssl/crypto.h:351
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_clear_free";

   function CRYPTO_realloc
     (addr : System.Address;
      num : stddef_h.size_t;
      file : Interfaces.C.Strings.chars_ptr;
      line : int) return System.Address  -- /usr/include/openssl/crypto.h:352
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_realloc";

   function CRYPTO_clear_realloc
     (addr : System.Address;
      old_num : stddef_h.size_t;
      num : stddef_h.size_t;
      file : Interfaces.C.Strings.chars_ptr;
      line : int) return System.Address  -- /usr/include/openssl/crypto.h:353
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_clear_realloc";

   function CRYPTO_secure_malloc_init (sz : stddef_h.size_t; minsize : stddef_h.size_t) return int  -- /usr/include/openssl/crypto.h:356
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_secure_malloc_init";

   function CRYPTO_secure_malloc_done return int  -- /usr/include/openssl/crypto.h:357
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_secure_malloc_done";

   function CRYPTO_secure_malloc
     (num : stddef_h.size_t;
      file : Interfaces.C.Strings.chars_ptr;
      line : int) return System.Address  -- /usr/include/openssl/crypto.h:358
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_secure_malloc";

   function CRYPTO_secure_zalloc
     (num : stddef_h.size_t;
      file : Interfaces.C.Strings.chars_ptr;
      line : int) return System.Address  -- /usr/include/openssl/crypto.h:359
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_secure_zalloc";

   procedure CRYPTO_secure_free
     (ptr : System.Address;
      file : Interfaces.C.Strings.chars_ptr;
      line : int)  -- /usr/include/openssl/crypto.h:360
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_secure_free";

   procedure CRYPTO_secure_clear_free
     (ptr : System.Address;
      num : stddef_h.size_t;
      file : Interfaces.C.Strings.chars_ptr;
      line : int)  -- /usr/include/openssl/crypto.h:361
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_secure_clear_free";

   function CRYPTO_secure_allocated (ptr : System.Address) return int  -- /usr/include/openssl/crypto.h:363
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_secure_allocated";

   function CRYPTO_secure_malloc_initialized return int  -- /usr/include/openssl/crypto.h:364
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_secure_malloc_initialized";

   function CRYPTO_secure_actual_size (ptr : System.Address) return stddef_h.size_t  -- /usr/include/openssl/crypto.h:365
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_secure_actual_size";

   function CRYPTO_secure_used return stddef_h.size_t  -- /usr/include/openssl/crypto.h:366
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_secure_used";

   procedure OPENSSL_cleanse (ptr : System.Address; len : stddef_h.size_t)  -- /usr/include/openssl/crypto.h:368
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_cleanse";

  -- * The following can be used to detect memory leaks in the library. If
  -- * used, it turns on malloc checking
  --  

  -- die if we have to  
   procedure OPENSSL_die
     (assertion : Interfaces.C.Strings.chars_ptr;
      file : Interfaces.C.Strings.chars_ptr;
      line : int)  -- /usr/include/openssl/crypto.h:416
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_die";

   function OPENSSL_isservice return int  -- /usr/include/openssl/crypto.h:423
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_isservice";

   procedure OPENSSL_init  -- /usr/include/openssl/crypto.h:425
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_init";

   procedure OPENSSL_fork_prepare  -- /usr/include/openssl/crypto.h:428
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_fork_prepare";

   procedure OPENSSL_fork_parent  -- /usr/include/openssl/crypto.h:429
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_fork_parent";

   procedure OPENSSL_fork_child  -- /usr/include/openssl/crypto.h:430
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_fork_child";

   function OPENSSL_gmtime (timer : access bits_types_time_t_h.time_t; result : access bits_types_struct_tm_h.tm) return access bits_types_struct_tm_h.tm  -- /usr/include/openssl/crypto.h:434
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_gmtime";

   function OPENSSL_gmtime_adj
     (the_tm : access bits_types_struct_tm_h.tm;
      offset_day : int;
      offset_sec : long) return int  -- /usr/include/openssl/crypto.h:435
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_gmtime_adj";

   function OPENSSL_gmtime_diff
     (pday : access int;
      psec : access int;
      from : access constant bits_types_struct_tm_h.tm;
      to : access constant bits_types_struct_tm_h.tm) return int  -- /usr/include/openssl/crypto.h:436
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_gmtime_diff";

  -- * CRYPTO_memcmp returns zero iff the |len| bytes at |a| and |b| are equal.
  -- * It takes an amount of time dependent on |len|, but independent of the
  -- * contents of |a| and |b|. Unlike memcmp, it cannot be used to put elements
  -- * into a defined order as the return value when a != b is undefined, other
  -- * than to be non-zero.
  --  

   function CRYPTO_memcmp
     (in_a : System.Address;
      in_b : System.Address;
      len : stddef_h.size_t) return int  -- /usr/include/openssl/crypto.h:446
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_memcmp";

  -- Standard initialisation options  
  -- FREE:                                     0x00010000L  
  -- OPENSSL_INIT_BASE_ONLY                    0x00040000L  
  -- OPENSSL_INIT flag range 0x03f00000 reserved for OPENSSL_init_ssl()  
  -- FREE: 0x04000000L  
  -- FREE: 0x08000000L  
  -- FREE: 0x10000000L  
  -- FREE: 0x20000000L  
  -- FREE: 0x40000000L  
  -- FREE: 0x80000000L  
  -- Max OPENSSL_INIT flag value is 0x80000000  
  -- openssl and dasync not counted as builtin  
  -- Library initialisation functions  
   procedure OPENSSL_cleanup  -- /usr/include/openssl/crypto.h:485
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_cleanup";

   function OPENSSL_init_crypto (opts : bits_stdint_uintn_h.uint64_t; settings : access constant openssl_types_h.ossl_init_settings_st) return int  -- /usr/include/openssl/crypto.h:486
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_init_crypto";

   function OPENSSL_atexit (handler : access procedure) return int  -- /usr/include/openssl/crypto.h:487
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_atexit";

   procedure OPENSSL_thread_stop  -- /usr/include/openssl/crypto.h:488
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_thread_stop";

   procedure OPENSSL_thread_stop_ex (ctx : access openssl_types_h.ossl_lib_ctx_st)  -- /usr/include/openssl/crypto.h:489
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_thread_stop_ex";

  -- Low-level control of initialization  
   function OPENSSL_INIT_new return access openssl_types_h.ossl_init_settings_st  -- /usr/include/openssl/crypto.h:492
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_INIT_new";

   function OPENSSL_INIT_set_config_filename (settings : access openssl_types_h.ossl_init_settings_st; config_filename : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/crypto.h:494
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_INIT_set_config_filename";

   procedure OPENSSL_INIT_set_config_file_flags (settings : access openssl_types_h.ossl_init_settings_st; flags : unsigned_long)  -- /usr/include/openssl/crypto.h:496
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_INIT_set_config_file_flags";

   function OPENSSL_INIT_set_config_appname (settings : access openssl_types_h.ossl_init_settings_st; config_appname : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/crypto.h:498
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_INIT_set_config_appname";

   procedure OPENSSL_INIT_free (settings : access openssl_types_h.ossl_init_settings_st)  -- /usr/include/openssl/crypto.h:501
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_INIT_free";

  -- application has to include <windows.h> in order to use this  
   subtype CRYPTO_ONCE is bits_pthreadtypes_h.pthread_once_t;  -- /usr/include/openssl/crypto.h:521

   subtype CRYPTO_THREAD_LOCAL is bits_pthreadtypes_h.pthread_key_t;  -- /usr/include/openssl/crypto.h:522

   subtype CRYPTO_THREAD_ID is bits_pthreadtypes_h.pthread_t;  -- /usr/include/openssl/crypto.h:523

   function CRYPTO_THREAD_run_once (once : access CRYPTO_ONCE; init : access procedure) return int  -- /usr/include/openssl/crypto.h:536
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_THREAD_run_once";

   function CRYPTO_THREAD_init_local (key : access CRYPTO_THREAD_LOCAL; cleanup : access procedure (arg1 : System.Address)) return int  -- /usr/include/openssl/crypto.h:538
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_THREAD_init_local";

   function CRYPTO_THREAD_get_local (key : access CRYPTO_THREAD_LOCAL) return System.Address  -- /usr/include/openssl/crypto.h:539
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_THREAD_get_local";

   function CRYPTO_THREAD_set_local (key : access CRYPTO_THREAD_LOCAL; val : System.Address) return int  -- /usr/include/openssl/crypto.h:540
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_THREAD_set_local";

   function CRYPTO_THREAD_cleanup_local (key : access CRYPTO_THREAD_LOCAL) return int  -- /usr/include/openssl/crypto.h:541
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_THREAD_cleanup_local";

   function CRYPTO_THREAD_get_current_id return CRYPTO_THREAD_ID  -- /usr/include/openssl/crypto.h:543
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_THREAD_get_current_id";

   function CRYPTO_THREAD_compare_id (a : CRYPTO_THREAD_ID; b : CRYPTO_THREAD_ID) return int  -- /usr/include/openssl/crypto.h:544
   with Import => True, 
        Convention => C, 
        External_Name => "CRYPTO_THREAD_compare_id";

   function OSSL_LIB_CTX_new return access openssl_types_h.ossl_lib_ctx_st  -- /usr/include/openssl/crypto.h:546
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_LIB_CTX_new";

   function OSSL_LIB_CTX_new_from_dispatch (handle : access constant openssl_core_h.ossl_core_handle_st; c_in : access constant openssl_core_h.ossl_dispatch_st) return access openssl_types_h.ossl_lib_ctx_st  -- /usr/include/openssl/crypto.h:547
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_LIB_CTX_new_from_dispatch";

   function OSSL_LIB_CTX_new_child (handle : access constant openssl_core_h.ossl_core_handle_st; c_in : access constant openssl_core_h.ossl_dispatch_st) return access openssl_types_h.ossl_lib_ctx_st  -- /usr/include/openssl/crypto.h:549
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_LIB_CTX_new_child";

   function OSSL_LIB_CTX_load_config (ctx : access openssl_types_h.ossl_lib_ctx_st; config_file : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/crypto.h:551
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_LIB_CTX_load_config";

   procedure OSSL_LIB_CTX_free (arg1 : access openssl_types_h.ossl_lib_ctx_st)  -- /usr/include/openssl/crypto.h:552
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_LIB_CTX_free";

   function OSSL_LIB_CTX_get0_global_default return access openssl_types_h.ossl_lib_ctx_st  -- /usr/include/openssl/crypto.h:553
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_LIB_CTX_get0_global_default";

   function OSSL_LIB_CTX_set0_default (libctx : access openssl_types_h.ossl_lib_ctx_st) return access openssl_types_h.ossl_lib_ctx_st  -- /usr/include/openssl/crypto.h:554
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_LIB_CTX_set0_default";

   procedure OSSL_sleep (millis : bits_stdint_uintn_h.uint64_t)  -- /usr/include/openssl/crypto.h:556
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_sleep";

end openssl_crypto_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
