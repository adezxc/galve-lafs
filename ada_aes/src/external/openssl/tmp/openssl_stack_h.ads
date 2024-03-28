pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with System;

package openssl_stack_h is

   --  unsupported macro: sk_num OPENSSL_sk_num
   --  unsupported macro: sk_value OPENSSL_sk_value
   --  unsupported macro: sk_set OPENSSL_sk_set
   --  unsupported macro: sk_new OPENSSL_sk_new
   --  unsupported macro: sk_new_null OPENSSL_sk_new_null
   --  unsupported macro: sk_free OPENSSL_sk_free
   --  unsupported macro: sk_pop_free OPENSSL_sk_pop_free
   --  unsupported macro: sk_deep_copy OPENSSL_sk_deep_copy
   --  unsupported macro: sk_insert OPENSSL_sk_insert
   --  unsupported macro: sk_delete OPENSSL_sk_delete
   --  unsupported macro: sk_delete_ptr OPENSSL_sk_delete_ptr
   --  unsupported macro: sk_find OPENSSL_sk_find
   --  unsupported macro: sk_find_ex OPENSSL_sk_find_ex
   --  unsupported macro: sk_push OPENSSL_sk_push
   --  unsupported macro: sk_unshift OPENSSL_sk_unshift
   --  unsupported macro: sk_shift OPENSSL_sk_shift
   --  unsupported macro: sk_pop OPENSSL_sk_pop
   --  unsupported macro: sk_zero OPENSSL_sk_zero
   --  unsupported macro: sk_set_cmp_func OPENSSL_sk_set_cmp_func
   --  unsupported macro: sk_dup OPENSSL_sk_dup
   --  unsupported macro: sk_sort OPENSSL_sk_sort
   --  unsupported macro: sk_is_sorted OPENSSL_sk_is_sorted
  -- * Copyright 1995-2021 The OpenSSL Project Authors. All Rights Reserved.
  -- *
  -- * Licensed under the Apache License 2.0 (the "License").  You may not use
  -- * this file except in compliance with the License.  You can obtain a copy
  -- * in the file LICENSE in the source distribution or at
  -- * https://www.openssl.org/source/license.html
  --  

  -- Use STACK_OF(...) instead  
   type stack_st is null record;   -- incomplete struct

   subtype OPENSSL_STACK is stack_st;  -- /usr/include/openssl/stack.h:23

   type OPENSSL_sk_compfunc is access function (arg1 : System.Address; arg2 : System.Address) return int
   with Convention => C;  -- /usr/include/openssl/stack.h:25

   type OPENSSL_sk_freefunc is access procedure (arg1 : System.Address)
   with Convention => C;  -- /usr/include/openssl/stack.h:26

   type OPENSSL_sk_copyfunc is access function (arg1 : System.Address) return System.Address
   with Convention => C;  -- /usr/include/openssl/stack.h:27

   function OPENSSL_sk_num (arg1 : access constant OPENSSL_STACK) return int  -- /usr/include/openssl/stack.h:29
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_num";

   function OPENSSL_sk_value (arg1 : access constant OPENSSL_STACK; arg2 : int) return System.Address  -- /usr/include/openssl/stack.h:30
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_value";

   function OPENSSL_sk_set
     (st : access OPENSSL_STACK;
      i : int;
      data : System.Address) return System.Address  -- /usr/include/openssl/stack.h:32
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_set";

   function OPENSSL_sk_new (cmp : OPENSSL_sk_compfunc) return access OPENSSL_STACK  -- /usr/include/openssl/stack.h:34
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_new";

   function OPENSSL_sk_new_null return access OPENSSL_STACK  -- /usr/include/openssl/stack.h:35
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_new_null";

   function OPENSSL_sk_new_reserve (c : OPENSSL_sk_compfunc; n : int) return access OPENSSL_STACK  -- /usr/include/openssl/stack.h:36
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_new_reserve";

   function OPENSSL_sk_reserve (st : access OPENSSL_STACK; n : int) return int  -- /usr/include/openssl/stack.h:37
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_reserve";

   procedure OPENSSL_sk_free (arg1 : access OPENSSL_STACK)  -- /usr/include/openssl/stack.h:38
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_free";

   procedure OPENSSL_sk_pop_free (st : access OPENSSL_STACK; func : access procedure (arg1 : System.Address))  -- /usr/include/openssl/stack.h:39
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_pop_free";

   function OPENSSL_sk_deep_copy
     (arg1 : access constant OPENSSL_STACK;
      c : OPENSSL_sk_copyfunc;
      f : OPENSSL_sk_freefunc) return access OPENSSL_STACK  -- /usr/include/openssl/stack.h:40
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_deep_copy";

   function OPENSSL_sk_insert
     (sk : access OPENSSL_STACK;
      data : System.Address;
      where : int) return int  -- /usr/include/openssl/stack.h:43
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_insert";

   function OPENSSL_sk_delete (st : access OPENSSL_STACK; loc : int) return System.Address  -- /usr/include/openssl/stack.h:44
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_delete";

   function OPENSSL_sk_delete_ptr (st : access OPENSSL_STACK; p : System.Address) return System.Address  -- /usr/include/openssl/stack.h:45
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_delete_ptr";

   function OPENSSL_sk_find (st : access OPENSSL_STACK; data : System.Address) return int  -- /usr/include/openssl/stack.h:46
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_find";

   function OPENSSL_sk_find_ex (st : access OPENSSL_STACK; data : System.Address) return int  -- /usr/include/openssl/stack.h:47
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_find_ex";

   function OPENSSL_sk_find_all
     (st : access OPENSSL_STACK;
      data : System.Address;
      pnum : access int) return int  -- /usr/include/openssl/stack.h:48
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_find_all";

   function OPENSSL_sk_push (st : access OPENSSL_STACK; data : System.Address) return int  -- /usr/include/openssl/stack.h:49
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_push";

   function OPENSSL_sk_unshift (st : access OPENSSL_STACK; data : System.Address) return int  -- /usr/include/openssl/stack.h:50
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_unshift";

   function OPENSSL_sk_shift (st : access OPENSSL_STACK) return System.Address  -- /usr/include/openssl/stack.h:51
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_shift";

   function OPENSSL_sk_pop (st : access OPENSSL_STACK) return System.Address  -- /usr/include/openssl/stack.h:52
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_pop";

   procedure OPENSSL_sk_zero (st : access OPENSSL_STACK)  -- /usr/include/openssl/stack.h:53
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_zero";

   function OPENSSL_sk_set_cmp_func (sk : access OPENSSL_STACK; cmp : OPENSSL_sk_compfunc) return OPENSSL_sk_compfunc  -- /usr/include/openssl/stack.h:54
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_set_cmp_func";

   function OPENSSL_sk_dup (st : access constant OPENSSL_STACK) return access OPENSSL_STACK  -- /usr/include/openssl/stack.h:56
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_dup";

   procedure OPENSSL_sk_sort (st : access OPENSSL_STACK)  -- /usr/include/openssl/stack.h:57
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_sort";

   function OPENSSL_sk_is_sorted (st : access constant OPENSSL_STACK) return int  -- /usr/include/openssl/stack.h:58
   with Import => True, 
        Convention => C, 
        External_Name => "OPENSSL_sk_is_sorted";

end openssl_stack_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
