pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;
with stddef_h;

package openssl_core_h is

   --  unsupported macro: OSSL_DISPATCH_END { 0, NULL }
   OSSL_PARAM_INTEGER : constant := 1;  --  /usr/include/openssl/core.h:106
   OSSL_PARAM_UNSIGNED_INTEGER : constant := 2;  --  /usr/include/openssl/core.h:107

   OSSL_PARAM_REAL : constant := 3;  --  /usr/include/openssl/core.h:112

   OSSL_PARAM_UTF8_STRING : constant := 4;  --  /usr/include/openssl/core.h:117

   OSSL_PARAM_OCTET_STRING : constant := 5;  --  /usr/include/openssl/core.h:123

   OSSL_PARAM_UTF8_PTR : constant := 6;  --  /usr/include/openssl/core.h:141

   OSSL_PARAM_OCTET_PTR : constant := 7;  --  /usr/include/openssl/core.h:160

  -- * Copyright 2019-2023 The OpenSSL Project Authors. All Rights Reserved.
  -- *
  -- * Licensed under the Apache License 2.0 (the "License").  You may not use
  -- * this file except in compliance with the License.  You can obtain a copy
  -- * in the file LICENSE in the source distribution or at
  -- * https://www.openssl.org/source/license.html
  --  

  ---
  -- * Base types
  -- * ----------
  -- *
  -- * These are the types that the OpenSSL core and providers have in common
  -- * to communicate data between them.
  --  

  -- Opaque handles to be used with core upcall functions from providers  
   type ossl_core_handle_st is null record;   -- incomplete struct

   subtype OSSL_CORE_HANDLE is ossl_core_handle_st;  -- /usr/include/openssl/core.h:30

   type openssl_core_ctx_st is null record;   -- incomplete struct

   subtype OPENSSL_CORE_CTX is openssl_core_ctx_st;  -- /usr/include/openssl/core.h:31

   type ossl_core_bio_st is null record;   -- incomplete struct

   subtype OSSL_CORE_BIO is ossl_core_bio_st;  -- /usr/include/openssl/core.h:32

  -- * Dispatch table element.  function_id numbers and the functions are defined
  -- * in core_dispatch.h, see macros with 'OSSL_CORE_MAKE_FUNC' in their names.
  -- *
  -- * An array of these is always terminated by function_id == 0
  --  

   type ossl_dispatch_st is record
      function_id : aliased int;  -- /usr/include/openssl/core.h:41
      c_function : access procedure;  -- /usr/include/openssl/core.h:42
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/openssl/core.h:40

  -- * Other items, essentially an int<->pointer map element.
  -- *
  -- * We make this type distinct from OSSL_DISPATCH to ensure that dispatch
  -- * tables remain tables with function pointers only.
  -- *
  -- * This is used whenever we need to pass things like a table of error reason
  -- * codes <-> reason string maps, ...
  -- *
  -- * Usage determines which field works as key if any, rather than field order.
  -- *
  -- * An array of these is always terminated by id == 0 && ptr == NULL
  --  

   type ossl_item_st is record
      id : aliased unsigned;  -- /usr/include/openssl/core.h:62
      ptr : System.Address;  -- /usr/include/openssl/core.h:63
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/openssl/core.h:61

  -- * Type to tie together algorithm names, property definition string and
  -- * the algorithm implementation in the form of a dispatch table.
  -- *
  -- * An array of these is always terminated by algorithm_names == NULL
  --  

  -- key  
   type ossl_algorithm_st is record
      algorithm_names : Interfaces.C.Strings.chars_ptr;  -- /usr/include/openssl/core.h:73
      property_definition : Interfaces.C.Strings.chars_ptr;  -- /usr/include/openssl/core.h:74
      implementation : access constant ossl_dispatch_st;  -- /usr/include/openssl/core.h:75
      algorithm_description : Interfaces.C.Strings.chars_ptr;  -- /usr/include/openssl/core.h:76
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/openssl/core.h:72

  -- key  
  -- * Type to pass object data in a uniform way, without exposing the object
  -- * structure.
  -- *
  -- * An array of these is always terminated by key == NULL
  --  

  -- the name of the parameter  
   type ossl_param_st is record
      key : Interfaces.C.Strings.chars_ptr;  -- /usr/include/openssl/core.h:86
      data_type : aliased unsigned;  -- /usr/include/openssl/core.h:87
      data : System.Address;  -- /usr/include/openssl/core.h:88
      data_size : aliased stddef_h.size_t;  -- /usr/include/openssl/core.h:89
      return_size : aliased stddef_h.size_t;  -- /usr/include/openssl/core.h:90
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/openssl/core.h:85

  -- declare what kind of content is in buffer  
  -- value being passed in or out  
  -- data size  
  -- returned content size  
  -- Currently supported OSSL_PARAM data types  
  -- * OSSL_PARAM_INTEGER and OSSL_PARAM_UNSIGNED_INTEGER
  -- * are arbitrary length and therefore require an arbitrarily sized buffer,
  -- * since they may be used to pass numbers larger than what is natively
  -- * available.
  -- *
  -- * The number must be buffered in native form, i.e. MSB first on B_ENDIAN
  -- * systems and LSB first on L_ENDIAN systems.  This means that arbitrary
  -- * native integers can be stored in the buffer, just make sure that the
  -- * buffer size is correct and the buffer itself is properly aligned (for
  -- * example by having the buffer field point at a C integer).
  --  

  ---
  -- * OSSL_PARAM_REAL
  -- * is a C binary floating point values in native form and alignment.
  --  

  ---
  -- * OSSL_PARAM_UTF8_STRING
  -- * is a printable string.  It is expected to be printed as it is.
  --  

  ---
  -- * OSSL_PARAM_OCTET_STRING
  -- * is a string of bytes with no further specification.  It is expected to be
  -- * printed as a hexdump.
  --  

  ---
  -- * OSSL_PARAM_UTF8_PTR
  -- * is a pointer to a printable string.  It is expected to be printed as it is.
  -- *
  -- * The difference between this and OSSL_PARAM_UTF8_STRING is that only pointers
  -- * are manipulated for this type.
  -- *
  -- * This is more relevant for parameter requests, where the responding
  -- * function doesn't need to copy the data to the provided buffer, but
  -- * sets the provided buffer to point at the actual data instead.
  -- *
  -- * WARNING!  Using these is FRAGILE, as it assumes that the actual
  -- * data and its location are constant.
  -- *
  -- * EXTRA WARNING!  If you are not completely sure you most likely want
  -- * to use the OSSL_PARAM_UTF8_STRING type.
  --  

  ---
  -- * OSSL_PARAM_OCTET_PTR
  -- * is a pointer to a string of bytes with no further specification.  It is
  -- * expected to be printed as a hexdump.
  -- *
  -- * The difference between this and OSSL_PARAM_OCTET_STRING is that only pointers
  -- * are manipulated for this type.
  -- *
  -- * This is more relevant for parameter requests, where the responding
  -- * function doesn't need to copy the data to the provided buffer, but
  -- * sets the provided buffer to point at the actual data instead.
  -- *
  -- * WARNING!  Using these is FRAGILE, as it assumes that the actual
  -- * data and its location are constant.
  -- *
  -- * EXTRA WARNING!  If you are not completely sure you most likely want
  -- * to use the OSSL_PARAM_OCTET_STRING type.
  --  

  -- * Typedef for the thread stop handling callback. Used both internally and by
  -- * providers.
  -- *
  -- * Providers may register for notifications about threads stopping by
  -- * registering a callback to hear about such events. Providers register the
  -- * callback using the OSSL_FUNC_CORE_THREAD_START function in the |in| dispatch
  -- * table passed to OSSL_provider_init(). The arg passed back to a provider will
  -- * be the provider side context object.
  --  

   type OSSL_thread_stop_handler_fn is access procedure (arg1 : System.Address)
   with Convention => C;  -- /usr/include/openssl/core.h:172

  ---
  -- * Provider entry point
  -- * --------------------
  -- *
  -- * This function is expected to be present in any dynamically loadable
  -- * provider module.  By definition, if this function doesn't exist in a
  -- * module, that module is not an OpenSSL provider module.
  --  

  ---
  -- * |handle|     pointer to opaque type OSSL_CORE_HANDLE.  This can be used
  -- *              together with some functions passed via |in| to query data.
  -- * |in|         is the array of functions that the Core passes to the provider.
  -- * |out|        will be the array of base functions that the provider passes
  -- *              back to the Core.
  -- * |provctx|    a provider side context object, optionally created if the
  -- *              provider needs it.  This value is passed to other provider
  -- *              functions, notably other context constructors.
  --  

   --  skipped function type OSSL_provider_init_fn

   function OSSL_provider_init
     (arg1 : access constant OSSL_CORE_HANDLE;
      arg2 : access constant ossl_dispatch_st;
      arg3 : System.Address;
      arg4 : System.Address) return int  -- /usr/include/openssl/core.h:201
   with Import => True, 
        Convention => C, 
        External_Name => "OSSL_provider_init";

  -- * Generic callback function signature.
  -- *
  -- * The expectation is that any provider function that wants to offer
  -- * a callback / hook can do so by taking an argument with this type,
  -- * as well as a pointer to caller-specific data.  When calling the
  -- * callback, the provider function can populate an OSSL_PARAM array
  -- * with data of its choice and pass that in the callback call, along
  -- * with the caller data argument.
  -- *
  -- * libcrypto may use the OSSL_PARAM array to create arguments for an
  -- * application callback it knows about.
  --  

   --  skipped function type OSSL_CALLBACK

   --  skipped function type OSSL_INOUT_CALLBACK

  -- * Passphrase callback function signature
  -- *
  -- * This is similar to the generic callback function above, but adds a
  -- * result parameter.
  --  

   --  skipped function type OSSL_PASSPHRASE_CALLBACK

end openssl_core_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
