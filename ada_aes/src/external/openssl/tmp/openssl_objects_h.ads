pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
limited with openssl_types_h;
with stddef_h;

package openssl_objects_h is

   OBJ_NAME_TYPE_UNDEF : constant := 16#00#;  --  /usr/include/openssl/objects.h:24
   OBJ_NAME_TYPE_MD_METH : constant := 16#01#;  --  /usr/include/openssl/objects.h:25
   OBJ_NAME_TYPE_CIPHER_METH : constant := 16#02#;  --  /usr/include/openssl/objects.h:26
   OBJ_NAME_TYPE_PKEY_METH : constant := 16#03#;  --  /usr/include/openssl/objects.h:27
   OBJ_NAME_TYPE_COMP_METH : constant := 16#04#;  --  /usr/include/openssl/objects.h:28
   OBJ_NAME_TYPE_MAC_METH : constant := 16#05#;  --  /usr/include/openssl/objects.h:29
   OBJ_NAME_TYPE_KDF_METH : constant := 16#06#;  --  /usr/include/openssl/objects.h:30
   OBJ_NAME_TYPE_NUM : constant := 16#07#;  --  /usr/include/openssl/objects.h:31

   OBJ_NAME_ALIAS : constant := 16#8000#;  --  /usr/include/openssl/objects.h:33

   OBJ_BSEARCH_VALUE_ON_NOMATCH : constant := 16#01#;  --  /usr/include/openssl/objects.h:35
   OBJ_BSEARCH_FIRST_VALUE_ON_MATCH : constant := 16#02#;  --  /usr/include/openssl/objects.h:36
   --  arg-macro: procedure OBJ_create_and_add_object (a, b, c)
   --    OBJ_create(a,b,c)
   --  arg-macro: procedure DECLARE_OBJ_BSEARCH_CMP_FN (type1, type2, cmp)
   --    _DECLARE_OBJ_BSEARCH_CMP_FN(static, type1, type2, cmp)
   --  unsupported macro: DECLARE_OBJ_BSEARCH_GLOBAL_CMP_FN(type1,type2,nm) type2 * OBJ_bsearch_ ##nm(type1 *key, type2 const *base, int num)
   --  unsupported macro: IMPLEMENT_OBJ_BSEARCH_CMP_FN(type1,type2,nm) static int nm ##_cmp_BSEARCH_CMP_FN(const void *a_, const void *b_) { type1 const *a = a_; type2 const *b = b_; return nm ##_cmp(a,b); } static type2 *OBJ_bsearch_ ##nm(type1 *key, type2 const *base, int num) { return (type2 *)OBJ_bsearch_(key, base, num, sizeof(type2), nm ##_cmp_BSEARCH_CMP_FN); } extern void dummy_prototype(void)
   --  unsupported macro: IMPLEMENT_OBJ_BSEARCH_GLOBAL_CMP_FN(type1,type2,nm) static int nm ##_cmp_BSEARCH_CMP_FN(const void *a_, const void *b_) { type1 const *a = a_; type2 const *b = b_; return nm ##_cmp(a,b); } type2 *OBJ_bsearch_ ##nm(type1 *key, type2 const *base, int num) { return (type2 *)OBJ_bsearch_(key, base, num, sizeof(type2), nm ##_cmp_BSEARCH_CMP_FN); } extern void dummy_prototype(void)
   --  unsupported macro: OBJ_bsearch(type1,key,type2,base,num,cmp) ((type2 *)OBJ_bsearch_(CHECKED_PTR_OF(type1,key),CHECKED_PTR_OF(type2,base), num,sizeof(type2), ((void)CHECKED_PTR_OF(type1,cmp ##_type_1), (void)CHECKED_PTR_OF(type2,cmp ##_type_2), cmp ##_BSEARCH_CMP_FN)))
   --  unsupported macro: OBJ_bsearch_ex(type1,key,type2,base,num,cmp,flags) ((type2 *)OBJ_bsearch_ex_(CHECKED_PTR_OF(type1,key),CHECKED_PTR_OF(type2,base), num,sizeof(type2), ((void)CHECKED_PTR_OF(type1,cmp ##_type_1), (void)type_2=CHECKED_PTR_OF(type2,cmp ##_type_2), cmp ##_BSEARCH_CMP_FN)),flags)
   --  arg-macro: procedure OBJ_cleanup ()
   --    while(0) continue

  -- * Copyright 1995-2019 The OpenSSL Project Authors. All Rights Reserved.
  -- *
  -- * Licensed under the Apache License 2.0 (the "License").  You may not use
  -- * this file except in compliance with the License.  You can obtain a copy
  -- * in the file LICENSE in the source distribution or at
  -- * https://www.openssl.org/source/license.html
  --  

   type obj_name_st is record
      c_type : aliased int;  -- /usr/include/openssl/objects.h:44
      alias : aliased int;  -- /usr/include/openssl/objects.h:45
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/include/openssl/objects.h:46
      data : Interfaces.C.Strings.chars_ptr;  -- /usr/include/openssl/objects.h:47
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/openssl/objects.h:43

   subtype OBJ_NAME is obj_name_st;  -- /usr/include/openssl/objects.h:48

   function OBJ_NAME_init return int  -- /usr/include/openssl/objects.h:52
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_NAME_init";

   function OBJ_NAME_new_index
     (hash_func : access function (arg1 : Interfaces.C.Strings.chars_ptr) return unsigned_long;
      cmp_func : access function (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return int;
      free_func : access procedure
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : Interfaces.C.Strings.chars_ptr)) return int  -- /usr/include/openssl/objects.h:53
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_NAME_new_index";

   function OBJ_NAME_get (name : Interfaces.C.Strings.chars_ptr; c_type : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/objects.h:56
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_NAME_get";

   function OBJ_NAME_add
     (name : Interfaces.C.Strings.chars_ptr;
      c_type : int;
      data : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/objects.h:57
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_NAME_add";

   function OBJ_NAME_remove (name : Interfaces.C.Strings.chars_ptr; c_type : int) return int  -- /usr/include/openssl/objects.h:58
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_NAME_remove";

  -- -1 for everything  
   procedure OBJ_NAME_cleanup (c_type : int)  -- /usr/include/openssl/objects.h:59
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_NAME_cleanup";

   procedure OBJ_NAME_do_all
     (c_type : int;
      fn : access procedure (arg1 : access constant OBJ_NAME; arg2 : System.Address);
      arg : System.Address)  -- /usr/include/openssl/objects.h:60
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_NAME_do_all";

   procedure OBJ_NAME_do_all_sorted
     (c_type : int;
      fn : access procedure (arg1 : access constant OBJ_NAME; arg2 : System.Address);
      arg : System.Address)  -- /usr/include/openssl/objects.h:62
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_NAME_do_all_sorted";

   function OBJ_dup (a : access constant openssl_types_h.asn1_object_st) return access openssl_types_h.asn1_object_st  -- /usr/include/openssl/objects.h:66
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_dup";

   function OBJ_nid2obj (n : int) return access openssl_types_h.asn1_object_st  -- /usr/include/openssl/objects.h:67
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_nid2obj";

   function OBJ_nid2ln (n : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/objects.h:68
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_nid2ln";

   function OBJ_nid2sn (n : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/objects.h:69
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_nid2sn";

   function OBJ_obj2nid (o : access constant openssl_types_h.asn1_object_st) return int  -- /usr/include/openssl/objects.h:70
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_obj2nid";

   function OBJ_txt2obj (s : Interfaces.C.Strings.chars_ptr; no_name : int) return access openssl_types_h.asn1_object_st  -- /usr/include/openssl/objects.h:71
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_txt2obj";

   function OBJ_obj2txt
     (buf : Interfaces.C.Strings.chars_ptr;
      buf_len : int;
      a : access constant openssl_types_h.asn1_object_st;
      no_name : int) return int  -- /usr/include/openssl/objects.h:72
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_obj2txt";

   function OBJ_txt2nid (s : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/objects.h:73
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_txt2nid";

   function OBJ_ln2nid (s : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/objects.h:74
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_ln2nid";

   function OBJ_sn2nid (s : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/objects.h:75
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_sn2nid";

   function OBJ_cmp (a : access constant openssl_types_h.asn1_object_st; b : access constant openssl_types_h.asn1_object_st) return int  -- /usr/include/openssl/objects.h:76
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_cmp";

   function OBJ_bsearch_u
     (key : System.Address;
      base : System.Address;
      num : int;
      size : int;
      cmp : access function (arg1 : System.Address; arg2 : System.Address) return int) return System.Address  -- /usr/include/openssl/objects.h:77
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_bsearch_";

   function OBJ_bsearch_ex_u
     (key : System.Address;
      base : System.Address;
      num : int;
      size : int;
      cmp : access function (arg1 : System.Address; arg2 : System.Address) return int;
      flags : int) return System.Address  -- /usr/include/openssl/objects.h:79
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_bsearch_ex_";

  ---
  -- * Unsolved problem: if a type is actually a pointer type, like
  -- * nid_triple is, then its impossible to get a const where you need
  -- * it. Consider:
  -- *
  -- * typedef int nid_triple[3];
  -- * const void *a_;
  -- * const nid_triple const *a = a_;
  -- *
  -- * The assignment discards a const because what you really want is:
  -- *
  -- * const int const * const *a = a_;
  -- *
  -- * But if you do that, you lose the fact that a is an array of 3 ints,
  -- * which breaks comparison functions.
  -- *
  -- * Thus we end up having to cast, sadly, or unpack the
  -- * declarations. Or, as I finally did in this case, declare nid_triple
  -- * to be a struct, which it should have been in the first place.
  -- *
  -- * Ben, August 2008.
  -- *
  -- * Also, strictly speaking not all types need be const, but handling
  -- * the non-constness means a lot of complication, and in practice
  -- * comparison routines do always not touch their arguments.
  --  

   function OBJ_new_nid (num : int) return int  -- /usr/include/openssl/objects.h:163
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_new_nid";

   function OBJ_add_object (obj : access constant openssl_types_h.asn1_object_st) return int  -- /usr/include/openssl/objects.h:164
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_add_object";

   function OBJ_create
     (oid : Interfaces.C.Strings.chars_ptr;
      sn : Interfaces.C.Strings.chars_ptr;
      ln : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/objects.h:165
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_create";

   function OBJ_create_objects (c_in : access openssl_types_h.bio_st) return int  -- /usr/include/openssl/objects.h:169
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_create_objects";

   function OBJ_length (obj : access constant openssl_types_h.asn1_object_st) return stddef_h.size_t  -- /usr/include/openssl/objects.h:171
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_length";

   function OBJ_get0_data (obj : access constant openssl_types_h.asn1_object_st) return access unsigned_char  -- /usr/include/openssl/objects.h:172
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_get0_data";

   function OBJ_find_sigid_algs
     (signid : int;
      pdig_nid : access int;
      ppkey_nid : access int) return int  -- /usr/include/openssl/objects.h:174
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_find_sigid_algs";

   function OBJ_find_sigid_by_algs
     (psignid : access int;
      dig_nid : int;
      pkey_nid : int) return int  -- /usr/include/openssl/objects.h:175
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_find_sigid_by_algs";

   function OBJ_add_sigid
     (signid : int;
      dig_id : int;
      pkey_id : int) return int  -- /usr/include/openssl/objects.h:176
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_add_sigid";

   procedure OBJ_sigid_free  -- /usr/include/openssl/objects.h:177
   with Import => True, 
        Convention => C, 
        External_Name => "OBJ_sigid_free";

end openssl_objects_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
