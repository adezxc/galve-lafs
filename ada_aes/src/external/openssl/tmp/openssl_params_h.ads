pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
limited with openssl_core_h;
with Interfaces.C.Strings;
with openssl_types_h;
with bits_stdint_intn_h;
with bits_stdint_uintn_h;
with stddef_h;
with bits_types_time_t_h;
with System;

package openssl_params_h is

   --  unsupported macro: OSSL_PARAM_UNMODIFIED ((size_t)-1)
   --  unsupported macro: OSSL_PARAM_END { NULL, 0, NULL, 0, 0 }
   --  arg-macro: procedure OSSL_PARAM_DEFN (key, type, addr, sz)
   --    { (key), (type), (addr), (sz), OSSL_PARAM_UNMODIFIED }
   --  arg-macro: procedure OSSL_PARAM_int (key, addr)
   --    OSSL_PARAM_DEFN((key), OSSL_PARAM_INTEGER, (addr), sizeof(int))
   --  arg-macro: procedure OSSL_PARAM_uint (key, addr)
   --    OSSL_PARAM_DEFN((key), OSSL_PARAM_UNSIGNED_INTEGER, (addr), sizeof(unsigned int))
   --  arg-macro: procedure OSSL_PARAM_long (key, addr)
   --    OSSL_PARAM_DEFN((key), OSSL_PARAM_INTEGER, (addr), sizeof(long int))
   --  arg-macro: procedure OSSL_PARAM_ulong (key, addr)
   --    OSSL_PARAM_DEFN((key), OSSL_PARAM_UNSIGNED_INTEGER, (addr), sizeof(unsigned long int))
   --  arg-macro: procedure OSSL_PARAM_int32 (key, addr)
   --    OSSL_PARAM_DEFN((key), OSSL_PARAM_INTEGER, (addr), sizeof(int32_t))
   --  arg-macro: procedure OSSL_PARAM_uint32 (key, addr)
   --    OSSL_PARAM_DEFN((key), OSSL_PARAM_UNSIGNED_INTEGER, (addr), sizeof(uint32_t))
   --  arg-macro: procedure OSSL_PARAM_int64 (key, addr)
   --    OSSL_PARAM_DEFN((key), OSSL_PARAM_INTEGER, (addr), sizeof(int64_t))
   --  arg-macro: procedure OSSL_PARAM_uint64 (key, addr)
   --    OSSL_PARAM_DEFN((key), OSSL_PARAM_UNSIGNED_INTEGER, (addr), sizeof(uint64_t))
   --  arg-macro: procedure OSSL_PARAM_size_t (key, addr)
   --    OSSL_PARAM_DEFN((key), OSSL_PARAM_UNSIGNED_INTEGER, (addr), sizeof(size_t))
   --  arg-macro: procedure OSSL_PARAM_time_t (key, addr)
   --    OSSL_PARAM_DEFN((key), OSSL_PARAM_INTEGER, (addr), sizeof(time_t))
   --  arg-macro: procedure OSSL_PARAM_double (key, addr)
   --    OSSL_PARAM_DEFN((key), OSSL_PARAM_REAL, (addr), sizeof(double))
   --  arg-macro: procedure OSSL_PARAM_BN (key, bn, sz)
   --    OSSL_PARAM_DEFN((key), OSSL_PARAM_UNSIGNED_INTEGER, (bn), (sz))
   --  arg-macro: procedure OSSL_PARAM_utf8_string (key, addr, sz)
   --    OSSL_PARAM_DEFN((key), OSSL_PARAM_UTF8_STRING, (addr), sz)
   --  arg-macro: procedure OSSL_PARAM_octet_string (key, addr, sz)
   --    OSSL_PARAM_DEFN((key), OSSL_PARAM_OCTET_STRING, (addr), sz)
   --  arg-macro: procedure OSSL_PARAM_utf8_ptr (key, addr, sz)
   --    OSSL_PARAM_DEFN((key), OSSL_PARAM_UTF8_PTR, (addr), sz)
   --  arg-macro: procedure OSSL_PARAM_octet_ptr (key, addr, sz)
   --    OSSL_PARAM_DEFN((key), OSSL_PARAM_OCTET_PTR, (addr), sz)
  -- * Copyright 2019-2021 The OpenSSL Project Authors. All Rights Reserved.
  -- * Copyright (c) 2019, Oracle and/or its affiliates.  All rights reserved.
  -- *
  -- * Licensed under the Apache License 2.0 (the "License").  You may not use
  -- * this file except in compliance with the License.  You can obtain a copy
  -- * in the file LICENSE in the source distribution or at
  -- * https://www.openssl.org/source/license.html
  --  

  -- Basic parameter types without return sizes  
  -- Search an OSSL_PARAM array for a matching name  
   function OSSL_PARAM_locate (p : access openssl_core_h.ossl_param_st; key : Interfaces.C.Strings.chars_ptr) return access openssl_core_h.ossl_param_st  -- /usr/include/openssl/params.h:71
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_locate";

   function OSSL_PARAM_locate_const (p : access constant openssl_core_h.ossl_param_st; key : Interfaces.C.Strings.chars_ptr) return access constant openssl_core_h.ossl_param_st  -- /usr/include/openssl/params.h:72
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_locate_const";

  -- Basic parameter type run-time construction  
   function OSSL_PARAM_construct_int (key : Interfaces.C.Strings.chars_ptr; buf : access int) return openssl_types_h.OSSL_PARAM  -- /usr/include/openssl/params.h:75
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_construct_int";

   function OSSL_PARAM_construct_uint (key : Interfaces.C.Strings.chars_ptr; buf : access unsigned) return openssl_types_h.OSSL_PARAM  -- /usr/include/openssl/params.h:76
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_construct_uint";

   function OSSL_PARAM_construct_long (key : Interfaces.C.Strings.chars_ptr; buf : access long) return openssl_types_h.OSSL_PARAM  -- /usr/include/openssl/params.h:77
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_construct_long";

   function OSSL_PARAM_construct_ulong (key : Interfaces.C.Strings.chars_ptr; buf : access unsigned_long) return openssl_types_h.OSSL_PARAM  -- /usr/include/openssl/params.h:78
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_construct_ulong";

   function OSSL_PARAM_construct_int32 (key : Interfaces.C.Strings.chars_ptr; buf : access bits_stdint_intn_h.int32_t) return openssl_types_h.OSSL_PARAM  -- /usr/include/openssl/params.h:79
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_construct_int32";

   function OSSL_PARAM_construct_uint32 (key : Interfaces.C.Strings.chars_ptr; buf : access bits_stdint_uintn_h.uint32_t) return openssl_types_h.OSSL_PARAM  -- /usr/include/openssl/params.h:80
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_construct_uint32";

   function OSSL_PARAM_construct_int64 (key : Interfaces.C.Strings.chars_ptr; buf : access bits_stdint_intn_h.int64_t) return openssl_types_h.OSSL_PARAM  -- /usr/include/openssl/params.h:81
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_construct_int64";

   function OSSL_PARAM_construct_uint64 (key : Interfaces.C.Strings.chars_ptr; buf : access bits_stdint_uintn_h.uint64_t) return openssl_types_h.OSSL_PARAM  -- /usr/include/openssl/params.h:82
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_construct_uint64";

   function OSSL_PARAM_construct_size_t (key : Interfaces.C.Strings.chars_ptr; buf : access stddef_h.size_t) return openssl_types_h.OSSL_PARAM  -- /usr/include/openssl/params.h:83
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_construct_size_t";

   function OSSL_PARAM_construct_time_t (key : Interfaces.C.Strings.chars_ptr; buf : access bits_types_time_t_h.time_t) return openssl_types_h.OSSL_PARAM  -- /usr/include/openssl/params.h:84
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_construct_time_t";

   function OSSL_PARAM_construct_BN
     (key : Interfaces.C.Strings.chars_ptr;
      buf : access unsigned_char;
      bsize : stddef_h.size_t) return openssl_types_h.OSSL_PARAM  -- /usr/include/openssl/params.h:85
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_construct_BN";

   function OSSL_PARAM_construct_double (key : Interfaces.C.Strings.chars_ptr; buf : access double) return openssl_types_h.OSSL_PARAM  -- /usr/include/openssl/params.h:87
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_construct_double";

   function OSSL_PARAM_construct_utf8_string
     (key : Interfaces.C.Strings.chars_ptr;
      buf : Interfaces.C.Strings.chars_ptr;
      bsize : stddef_h.size_t) return openssl_types_h.OSSL_PARAM  -- /usr/include/openssl/params.h:88
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_construct_utf8_string";

   function OSSL_PARAM_construct_utf8_ptr
     (key : Interfaces.C.Strings.chars_ptr;
      buf : System.Address;
      bsize : stddef_h.size_t) return openssl_types_h.OSSL_PARAM  -- /usr/include/openssl/params.h:90
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_construct_utf8_ptr";

   function OSSL_PARAM_construct_octet_string
     (key : Interfaces.C.Strings.chars_ptr;
      buf : System.Address;
      bsize : stddef_h.size_t) return openssl_types_h.OSSL_PARAM  -- /usr/include/openssl/params.h:92
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_construct_octet_string";

   function OSSL_PARAM_construct_octet_ptr
     (key : Interfaces.C.Strings.chars_ptr;
      buf : System.Address;
      bsize : stddef_h.size_t) return openssl_types_h.OSSL_PARAM  -- /usr/include/openssl/params.h:94
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_construct_octet_ptr";

   function OSSL_PARAM_construct_end return openssl_types_h.OSSL_PARAM  -- /usr/include/openssl/params.h:96
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_construct_end";

   function OSSL_PARAM_allocate_from_text
     (to : access openssl_core_h.ossl_param_st;
      paramdefs : access constant openssl_core_h.ossl_param_st;
      key : Interfaces.C.Strings.chars_ptr;
      value : Interfaces.C.Strings.chars_ptr;
      value_n : stddef_h.size_t;
      found : access int) return int  -- /usr/include/openssl/params.h:98
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_allocate_from_text";

   function OSSL_PARAM_get_int (p : access constant openssl_core_h.ossl_param_st; val : access int) return int  -- /usr/include/openssl/params.h:103
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_get_int";

   function OSSL_PARAM_get_uint (p : access constant openssl_core_h.ossl_param_st; val : access unsigned) return int  -- /usr/include/openssl/params.h:104
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_get_uint";

   function OSSL_PARAM_get_long (p : access constant openssl_core_h.ossl_param_st; val : access long) return int  -- /usr/include/openssl/params.h:105
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_get_long";

   function OSSL_PARAM_get_ulong (p : access constant openssl_core_h.ossl_param_st; val : access unsigned_long) return int  -- /usr/include/openssl/params.h:106
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_get_ulong";

   function OSSL_PARAM_get_int32 (p : access constant openssl_core_h.ossl_param_st; val : access bits_stdint_intn_h.int32_t) return int  -- /usr/include/openssl/params.h:107
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_get_int32";

   function OSSL_PARAM_get_uint32 (p : access constant openssl_core_h.ossl_param_st; val : access bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/openssl/params.h:108
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_get_uint32";

   function OSSL_PARAM_get_int64 (p : access constant openssl_core_h.ossl_param_st; val : access bits_stdint_intn_h.int64_t) return int  -- /usr/include/openssl/params.h:109
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_get_int64";

   function OSSL_PARAM_get_uint64 (p : access constant openssl_core_h.ossl_param_st; val : access bits_stdint_uintn_h.uint64_t) return int  -- /usr/include/openssl/params.h:110
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_get_uint64";

   function OSSL_PARAM_get_size_t (p : access constant openssl_core_h.ossl_param_st; val : access stddef_h.size_t) return int  -- /usr/include/openssl/params.h:111
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_get_size_t";

   function OSSL_PARAM_get_time_t (p : access constant openssl_core_h.ossl_param_st; val : access bits_types_time_t_h.time_t) return int  -- /usr/include/openssl/params.h:112
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_get_time_t";

   function OSSL_PARAM_set_int (p : access openssl_core_h.ossl_param_st; val : int) return int  -- /usr/include/openssl/params.h:114
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_set_int";

   function OSSL_PARAM_set_uint (p : access openssl_core_h.ossl_param_st; val : unsigned) return int  -- /usr/include/openssl/params.h:115
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_set_uint";

   function OSSL_PARAM_set_long (p : access openssl_core_h.ossl_param_st; val : long) return int  -- /usr/include/openssl/params.h:116
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_set_long";

   function OSSL_PARAM_set_ulong (p : access openssl_core_h.ossl_param_st; val : unsigned_long) return int  -- /usr/include/openssl/params.h:117
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_set_ulong";

   function OSSL_PARAM_set_int32 (p : access openssl_core_h.ossl_param_st; val : bits_stdint_intn_h.int32_t) return int  -- /usr/include/openssl/params.h:118
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_set_int32";

   function OSSL_PARAM_set_uint32 (p : access openssl_core_h.ossl_param_st; val : bits_stdint_uintn_h.uint32_t) return int  -- /usr/include/openssl/params.h:119
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_set_uint32";

   function OSSL_PARAM_set_int64 (p : access openssl_core_h.ossl_param_st; val : bits_stdint_intn_h.int64_t) return int  -- /usr/include/openssl/params.h:120
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_set_int64";

   function OSSL_PARAM_set_uint64 (p : access openssl_core_h.ossl_param_st; val : bits_stdint_uintn_h.uint64_t) return int  -- /usr/include/openssl/params.h:121
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_set_uint64";

   function OSSL_PARAM_set_size_t (p : access openssl_core_h.ossl_param_st; val : stddef_h.size_t) return int  -- /usr/include/openssl/params.h:122
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_set_size_t";

   function OSSL_PARAM_set_time_t (p : access openssl_core_h.ossl_param_st; val : bits_types_time_t_h.time_t) return int  -- /usr/include/openssl/params.h:123
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_set_time_t";

   function OSSL_PARAM_get_double (p : access constant openssl_core_h.ossl_param_st; val : access double) return int  -- /usr/include/openssl/params.h:125
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_get_double";

   function OSSL_PARAM_set_double (p : access openssl_core_h.ossl_param_st; val : double) return int  -- /usr/include/openssl/params.h:126
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_set_double";

   function OSSL_PARAM_get_BN (p : access constant openssl_core_h.ossl_param_st; val : System.Address) return int  -- /usr/include/openssl/params.h:128
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_get_BN";

   function OSSL_PARAM_set_BN (p : access openssl_core_h.ossl_param_st; val : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/params.h:129
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_set_BN";

   function OSSL_PARAM_get_utf8_string
     (p : access constant openssl_core_h.ossl_param_st;
      val : System.Address;
      max_len : stddef_h.size_t) return int  -- /usr/include/openssl/params.h:131
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_get_utf8_string";

   function OSSL_PARAM_set_utf8_string (p : access openssl_core_h.ossl_param_st; val : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/params.h:132
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_set_utf8_string";

   function OSSL_PARAM_get_octet_string
     (p : access constant openssl_core_h.ossl_param_st;
      val : System.Address;
      max_len : stddef_h.size_t;
      used_len : access stddef_h.size_t) return int  -- /usr/include/openssl/params.h:134
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_get_octet_string";

   function OSSL_PARAM_set_octet_string
     (p : access openssl_core_h.ossl_param_st;
      val : System.Address;
      len : stddef_h.size_t) return int  -- /usr/include/openssl/params.h:136
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_set_octet_string";

   function OSSL_PARAM_get_utf8_ptr (p : access constant openssl_core_h.ossl_param_st; val : System.Address) return int  -- /usr/include/openssl/params.h:138
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_get_utf8_ptr";

   function OSSL_PARAM_set_utf8_ptr (p : access openssl_core_h.ossl_param_st; val : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/params.h:139
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_set_utf8_ptr";

   function OSSL_PARAM_get_octet_ptr
     (p : access constant openssl_core_h.ossl_param_st;
      val : System.Address;
      used_len : access stddef_h.size_t) return int  -- /usr/include/openssl/params.h:141
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_get_octet_ptr";

   function OSSL_PARAM_set_octet_ptr
     (p : access openssl_core_h.ossl_param_st;
      val : System.Address;
      used_len : stddef_h.size_t) return int  -- /usr/include/openssl/params.h:143
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_set_octet_ptr";

   function OSSL_PARAM_get_utf8_string_ptr (p : access constant openssl_core_h.ossl_param_st; val : System.Address) return int  -- /usr/include/openssl/params.h:146
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_get_utf8_string_ptr";

   function OSSL_PARAM_get_octet_string_ptr
     (p : access constant openssl_core_h.ossl_param_st;
      val : System.Address;
      used_len : access stddef_h.size_t) return int  -- /usr/include/openssl/params.h:147
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_get_octet_string_ptr";

   function OSSL_PARAM_modified (p : access constant openssl_core_h.ossl_param_st) return int  -- /usr/include/openssl/params.h:150
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_modified";

   procedure OSSL_PARAM_set_all_unmodified (p : access openssl_core_h.ossl_param_st)  -- /usr/include/openssl/params.h:151
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_set_all_unmodified";

   function OSSL_PARAM_dup (p : access constant openssl_core_h.ossl_param_st) return access openssl_core_h.ossl_param_st  -- /usr/include/openssl/params.h:153
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_dup";

   function OSSL_PARAM_merge (p1 : access constant openssl_core_h.ossl_param_st; p2 : access constant openssl_core_h.ossl_param_st) return access openssl_core_h.ossl_param_st  -- /usr/include/openssl/params.h:154
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_merge";

   procedure OSSL_PARAM_free (p : access openssl_core_h.ossl_param_st)  -- /usr/include/openssl/params.h:155
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_PARAM_free";

end openssl_params_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
