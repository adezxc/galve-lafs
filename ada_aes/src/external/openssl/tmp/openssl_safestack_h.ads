pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
with openssl_stack_h;

package openssl_safestack_h is

   --  unsupported macro: STACK_OF(type) struct stack_st_ ##type
   --  unsupported macro: SKM_DEFINE_STACK_OF_INTERNAL(t1,t2,t3) STACK_OF(t1); typedef int (*sk_ ##t1 ##_compfunc)(const t3 * const *a, const t3 *const *b); typedef void (*sk_ ##t1 ##_freefunc)(t3 *a); typedef t3 * (*sk_ ##t1 ##_copyfunc)(const t3 *a); static ossl_unused ossl_inline t2 *ossl_check_ ##t1 ##_type(t2 *ptr) { return ptr; } static ossl_unused ossl_inline const OPENSSL_STACK *ossl_check_const_ ##t1 ##_sk_type(const STACK_OF(t1) *sk) { return (const OPENSSL_STACK *)sk; } static ossl_unused ossl_inline OPENSSL_STACK *ossl_check_ ##t1 ##_sk_type(STACK_OF(t1) *sk) { return (OPENSSL_STACK *)sk; } static ossl_unused ossl_inline OPENSSL_sk_compfunc ossl_check_ ##t1 ##_compfunc_type(sk_ ##t1 ##_compfunc cmp) { return (OPENSSL_sk_compfunc)cmp; } static ossl_unused ossl_inline OPENSSL_sk_copyfunc ossl_check_ ##t1 ##_copyfunc_type(sk_ ##t1 ##_copyfunc cpy) { return (OPENSSL_sk_copyfunc)cpy; } static ossl_unused ossl_inline OPENSSL_sk_freefunc ossl_check_ ##t1 ##_freefunc_type(sk_ ##t1 ##_freefunc fr) { return (OPENSSL_sk_freefunc)fr; }
   --  unsupported macro: SKM_DEFINE_STACK_OF(t1,t2,t3) STACK_OF(t1); typedef int (*sk_ ##t1 ##_compfunc)(const t3 * const *a, const t3 *const *b); typedef void (*sk_ ##t1 ##_freefunc)(t3 *a); typedef t3 * (*sk_ ##t1 ##_copyfunc)(const t3 *a); static ossl_unused ossl_inline int sk_ ##t1 ##_num(const STACK_OF(t1) *sk) { return OPENSSL_sk_num((const OPENSSL_STACK *)sk); } static ossl_unused ossl_inline t2 *sk_ ##t1 ##_value(const STACK_OF(t1) *sk, int idx) { return (t2 *)OPENSSL_sk_value((const OPENSSL_STACK *)sk, idx); } static ossl_unused ossl_inline STACK_OF(t1) *sk_ ##t1 ##_new(sk_ ##t1 ##_compfunc compare) { return (STACK_OF(t1) *)OPENSSL_sk_new((OPENSSL_sk_compfunc)compare); } static ossl_unused ossl_inline STACK_OF(t1) *sk_ ##t1 ##_new_null(void) { return (STACK_OF(t1) *)OPENSSL_sk_new_null(); } static ossl_unused ossl_inline STACK_OF(t1) *sk_ ##t1 ##_new_reserve(sk_ ##t1 ##_compfunc compare, int n) { return (STACK_OF(t1) *)OPENSSL_sk_new_reserve((OPENSSL_sk_compfunc)compare, n); } static ossl_unused ossl_inline int sk_ ##t1 ##_reserve(STACK_OF(t1) *sk, int n) { return OPENSSL_sk_reserve((OPENSSL_STACK *)sk, n); } static ossl_unused ossl_inline void sk_ ##t1 ##_free(STACK_OF(t1) *sk) { OPENSSL_sk_free((OPENSSL_STACK *)sk); } static ossl_unused ossl_inline void sk_ ##t1 ##_zero(STACK_OF(t1) *sk) { OPENSSL_sk_zero((OPENSSL_STACK *)sk); } static ossl_unused ossl_inline t2 *sk_ ##t1 ##_delete(STACK_OF(t1) *sk, int i) { return (t2 *)OPENSSL_sk_delete((OPENSSL_STACK *)sk, i); } static ossl_unused ossl_inline t2 *sk_ ##t1 ##_delete_ptr(STACK_OF(t1) *sk, t2 *ptr) { return (t2 *)OPENSSL_sk_delete_ptr((OPENSSL_STACK *)sk, (const void *)ptr); } static ossl_unused ossl_inline int sk_ ##t1 ##_push(STACK_OF(t1) *sk, t2 *ptr) { return OPENSSL_sk_push((OPENSSL_STACK *)sk, (const void *)ptr); } static ossl_unused ossl_inline int sk_ ##t1 ##_unshift(STACK_OF(t1) *sk, t2 *ptr) { return OPENSSL_sk_unshift((OPENSSL_STACK *)sk, (const void *)ptr); } static ossl_unused ossl_inline t2 *sk_ ##t1 ##_pop(STACK_OF(t1) *sk) { return (t2 *)OPENSSL_sk_pop((OPENSSL_STACK *)sk); } static ossl_unused ossl_inline t2 *sk_ ##t1 ##_shift(STACK_OF(t1) *sk) { return (t2 *)OPENSSL_sk_shift((OPENSSL_STACK *)sk); } static ossl_unused ossl_inline void sk_ ##t1 ##_pop_free(STACK_OF(t1) *sk, sk_ ##t1 ##_freefunc freefunc) { OPENSSL_sk_pop_free((OPENSSL_STACK *)sk, (OPENSSL_sk_freefunc)freefunc); } static ossl_unused ossl_inline int sk_ ##t1 ##_insert(STACK_OF(t1) *sk, t2 *ptr, int idx) { return OPENSSL_sk_insert((OPENSSL_STACK *)sk, (const void *)ptr, idx); } static ossl_unused ossl_inline t2 *sk_ ##t1 ##_set(STACK_OF(t1) *sk, int idx, t2 *ptr) { return (t2 *)OPENSSL_sk_set((OPENSSL_STACK *)sk, idx, (const void *)ptr); } static ossl_unused ossl_inline int sk_ ##t1 ##_find(STACK_OF(t1) *sk, t2 *ptr) { return OPENSSL_sk_find((OPENSSL_STACK *)sk, (const void *)ptr); } static ossl_unused ossl_inline int sk_ ##t1 ##_find_ex(STACK_OF(t1) *sk, t2 *ptr) { return OPENSSL_sk_find_ex((OPENSSL_STACK *)sk, (const void *)ptr); } static ossl_unused ossl_inline int sk_ ##t1 ##_find_all(STACK_OF(t1) *sk, t2 *ptr, int *pnum) { return OPENSSL_sk_find_all((OPENSSL_STACK *)sk, (const void *)ptr, pnum); } static ossl_unused ossl_inline void sk_ ##t1 ##_sort(STACK_OF(t1) *sk) { OPENSSL_sk_sort((OPENSSL_STACK *)sk); } static ossl_unused ossl_inline int sk_ ##t1 ##_is_sorted(const STACK_OF(t1) *sk) { return OPENSSL_sk_is_sorted((const OPENSSL_STACK *)sk); } static ossl_unused ossl_inline STACK_OF(t1) * sk_ ##t1 ##_dup(const STACK_OF(t1) *sk) { return (STACK_OF(t1) *)OPENSSL_sk_dup((const OPENSSL_STACK *)sk); } static ossl_unused ossl_inline STACK_OF(t1) *sk_ ##t1 ##_deep_copy(const STACK_OF(t1) *sk, sk_ ##t1 ##_copyfunc copyfunc, sk_ ##t1 ##_freefunc freefunc) { return (STACK_OF(t1) *)OPENSSL_sk_deep_copy((const OPENSSL_STACK *)sk, (OPENSSL_sk_copyfunc)copyfunc, (OPENSSL_sk_freefunc)freefunc); } static ossl_unused ossl_inline sk_ ##t1 ##_compfunc sk_ ##t1 ##_set_cmp_func(STACK_OF(t1) *sk, sk_ ##t1 ##_compfunc compare) { return (sk_ ##t1 ##_compfunc)OPENSSL_sk_set_cmp_func((OPENSSL_STACK *)sk, (OPENSSL_sk_compfunc)compare); }
   --  arg-macro: procedure DEFINE_STACK_OF (t)
   --    SKM_DEFINE_STACK_OF(t, t, t)
   --  arg-macro: procedure DEFINE_STACK_OF_CONST (t)
   --    SKM_DEFINE_STACK_OF(t, const t, t)
   --  arg-macro: procedure DEFINE_SPECIAL_STACK_OF (t1, t2)
   --    SKM_DEFINE_STACK_OF(t1, t2, t2)
   --  arg-macro: procedure DEFINE_SPECIAL_STACK_OF_CONST (t1, t2)
   --    SKM_DEFINE_STACK_OF(t1, const t2, t2)
   --  arg-macro: procedure sk_OPENSSL_STRING_num (sk)
   --    OPENSSL_sk_num(ossl_check_const_OPENSSL_STRING_sk_type(sk))
   --  arg-macro: function sk_OPENSSL_STRING_value (sk, idx)
   --    return (char *)OPENSSL_sk_value(ossl_check_const_OPENSSL_STRING_sk_type(sk), (idx));
   --  arg-macro: function sk_OPENSSL_STRING_new (cmp)
   --    return (STACK_OF(OPENSSL_STRING) *)OPENSSL_sk_new(ossl_check_OPENSSL_STRING_compfunc_type(cmp));
   --  arg-macro: function sk_OPENSSL_STRING_new_null ()
   --    return (STACK_OF(OPENSSL_STRING) *)OPENSSL_sk_new_null();
   --  arg-macro: function sk_OPENSSL_STRING_new_reserve (cmp, n)
   --    return (STACK_OF(OPENSSL_STRING) *)OPENSSL_sk_new_reserve(ossl_check_OPENSSL_STRING_compfunc_type(cmp), (n));
   --  arg-macro: procedure sk_OPENSSL_STRING_reserve (sk, n)
   --    OPENSSL_sk_reserve(ossl_check_OPENSSL_STRING_sk_type(sk), (n))
   --  arg-macro: procedure sk_OPENSSL_STRING_free (sk)
   --    OPENSSL_sk_free(ossl_check_OPENSSL_STRING_sk_type(sk))
   --  arg-macro: procedure sk_OPENSSL_STRING_zero (sk)
   --    OPENSSL_sk_zero(ossl_check_OPENSSL_STRING_sk_type(sk))
   --  arg-macro: function sk_OPENSSL_STRING_delete (sk, i)
   --    return (char *)OPENSSL_sk_delete(ossl_check_OPENSSL_STRING_sk_type(sk), (i));
   --  arg-macro: function sk_OPENSSL_STRING_delete_ptr (sk, ptr)
   --    return (char *)OPENSSL_sk_delete_ptr(ossl_check_OPENSSL_STRING_sk_type(sk), ossl_check_OPENSSL_STRING_type(ptr));
   --  arg-macro: procedure sk_OPENSSL_STRING_push (sk, ptr)
   --    OPENSSL_sk_push(ossl_check_OPENSSL_STRING_sk_type(sk), ossl_check_OPENSSL_STRING_type(ptr))
   --  arg-macro: procedure sk_OPENSSL_STRING_unshift (sk, ptr)
   --    OPENSSL_sk_unshift(ossl_check_OPENSSL_STRING_sk_type(sk), ossl_check_OPENSSL_STRING_type(ptr))
   --  arg-macro: function sk_OPENSSL_STRING_pop (sk)
   --    return (char *)OPENSSL_sk_pop(ossl_check_OPENSSL_STRING_sk_type(sk));
   --  arg-macro: function sk_OPENSSL_STRING_shift (sk)
   --    return (char *)OPENSSL_sk_shift(ossl_check_OPENSSL_STRING_sk_type(sk));
   --  arg-macro: procedure sk_OPENSSL_STRING_pop_free (sk, freefunc)
   --    OPENSSL_sk_pop_free(ossl_check_OPENSSL_STRING_sk_type(sk),ossl_check_OPENSSL_STRING_freefunc_type(freefunc))
   --  arg-macro: procedure sk_OPENSSL_STRING_insert (sk, ptr, idx)
   --    OPENSSL_sk_insert(ossl_check_OPENSSL_STRING_sk_type(sk), ossl_check_OPENSSL_STRING_type(ptr), (idx))
   --  arg-macro: function sk_OPENSSL_STRING_set (sk, idx, ptr)
   --    return (char *)OPENSSL_sk_set(ossl_check_OPENSSL_STRING_sk_type(sk), (idx), ossl_check_OPENSSL_STRING_type(ptr));
   --  arg-macro: procedure sk_OPENSSL_STRING_find (sk, ptr)
   --    OPENSSL_sk_find(ossl_check_OPENSSL_STRING_sk_type(sk), ossl_check_OPENSSL_STRING_type(ptr))
   --  arg-macro: procedure sk_OPENSSL_STRING_find_ex (sk, ptr)
   --    OPENSSL_sk_find_ex(ossl_check_OPENSSL_STRING_sk_type(sk), ossl_check_OPENSSL_STRING_type(ptr))
   --  arg-macro: procedure sk_OPENSSL_STRING_find_all (sk, ptr, pnum)
   --    OPENSSL_sk_find_all(ossl_check_OPENSSL_STRING_sk_type(sk), ossl_check_OPENSSL_STRING_type(ptr), pnum)
   --  arg-macro: procedure sk_OPENSSL_STRING_sort (sk)
   --    OPENSSL_sk_sort(ossl_check_OPENSSL_STRING_sk_type(sk))
   --  arg-macro: procedure sk_OPENSSL_STRING_is_sorted (sk)
   --    OPENSSL_sk_is_sorted(ossl_check_const_OPENSSL_STRING_sk_type(sk))
   --  arg-macro: function sk_OPENSSL_STRING_dup (sk)
   --    return (STACK_OF(OPENSSL_STRING) *)OPENSSL_sk_dup(ossl_check_const_OPENSSL_STRING_sk_type(sk));
   --  arg-macro: function sk_OPENSSL_STRING_deep_copy (sk, copyfunc, freefunc)
   --    return (STACK_OF(OPENSSL_STRING) *)OPENSSL_sk_deep_copy(ossl_check_const_OPENSSL_STRING_sk_type(sk), ossl_check_OPENSSL_STRING_copyfunc_type(copyfunc), ossl_check_OPENSSL_STRING_freefunc_type(freefunc));
   --  arg-macro: function sk_OPENSSL_STRING_set_cmp_func (sk, cmp)
   --    return (sk_OPENSSL_STRING_compfunc)OPENSSL_sk_set_cmp_func(ossl_check_OPENSSL_STRING_sk_type(sk), ossl_check_OPENSSL_STRING_compfunc_type(cmp));
   --  arg-macro: procedure sk_OPENSSL_CSTRING_num (sk)
   --    OPENSSL_sk_num(ossl_check_const_OPENSSL_CSTRING_sk_type(sk))
   --  arg-macro: function sk_OPENSSL_CSTRING_value (sk, idx)
   --    return (const char *)OPENSSL_sk_value(ossl_check_const_OPENSSL_CSTRING_sk_type(sk), (idx));
   --  arg-macro: function sk_OPENSSL_CSTRING_new (cmp)
   --    return (STACK_OF(OPENSSL_CSTRING) *)OPENSSL_sk_new(ossl_check_OPENSSL_CSTRING_compfunc_type(cmp));
   --  arg-macro: function sk_OPENSSL_CSTRING_new_null ()
   --    return (STACK_OF(OPENSSL_CSTRING) *)OPENSSL_sk_new_null();
   --  arg-macro: function sk_OPENSSL_CSTRING_new_reserve (cmp, n)
   --    return (STACK_OF(OPENSSL_CSTRING) *)OPENSSL_sk_new_reserve(ossl_check_OPENSSL_CSTRING_compfunc_type(cmp), (n));
   --  arg-macro: procedure sk_OPENSSL_CSTRING_reserve (sk, n)
   --    OPENSSL_sk_reserve(ossl_check_OPENSSL_CSTRING_sk_type(sk), (n))
   --  arg-macro: procedure sk_OPENSSL_CSTRING_free (sk)
   --    OPENSSL_sk_free(ossl_check_OPENSSL_CSTRING_sk_type(sk))
   --  arg-macro: procedure sk_OPENSSL_CSTRING_zero (sk)
   --    OPENSSL_sk_zero(ossl_check_OPENSSL_CSTRING_sk_type(sk))
   --  arg-macro: function sk_OPENSSL_CSTRING_delete (sk, i)
   --    return (const char *)OPENSSL_sk_delete(ossl_check_OPENSSL_CSTRING_sk_type(sk), (i));
   --  arg-macro: function sk_OPENSSL_CSTRING_delete_ptr (sk, ptr)
   --    return (const char *)OPENSSL_sk_delete_ptr(ossl_check_OPENSSL_CSTRING_sk_type(sk), ossl_check_OPENSSL_CSTRING_type(ptr));
   --  arg-macro: procedure sk_OPENSSL_CSTRING_push (sk, ptr)
   --    OPENSSL_sk_push(ossl_check_OPENSSL_CSTRING_sk_type(sk), ossl_check_OPENSSL_CSTRING_type(ptr))
   --  arg-macro: procedure sk_OPENSSL_CSTRING_unshift (sk, ptr)
   --    OPENSSL_sk_unshift(ossl_check_OPENSSL_CSTRING_sk_type(sk), ossl_check_OPENSSL_CSTRING_type(ptr))
   --  arg-macro: function sk_OPENSSL_CSTRING_pop (sk)
   --    return (const char *)OPENSSL_sk_pop(ossl_check_OPENSSL_CSTRING_sk_type(sk));
   --  arg-macro: function sk_OPENSSL_CSTRING_shift (sk)
   --    return (const char *)OPENSSL_sk_shift(ossl_check_OPENSSL_CSTRING_sk_type(sk));
   --  arg-macro: procedure sk_OPENSSL_CSTRING_pop_free (sk, freefunc)
   --    OPENSSL_sk_pop_free(ossl_check_OPENSSL_CSTRING_sk_type(sk),ossl_check_OPENSSL_CSTRING_freefunc_type(freefunc))
   --  arg-macro: procedure sk_OPENSSL_CSTRING_insert (sk, ptr, idx)
   --    OPENSSL_sk_insert(ossl_check_OPENSSL_CSTRING_sk_type(sk), ossl_check_OPENSSL_CSTRING_type(ptr), (idx))
   --  arg-macro: function sk_OPENSSL_CSTRING_set (sk, idx, ptr)
   --    return (const char *)OPENSSL_sk_set(ossl_check_OPENSSL_CSTRING_sk_type(sk), (idx), ossl_check_OPENSSL_CSTRING_type(ptr));
   --  arg-macro: procedure sk_OPENSSL_CSTRING_find (sk, ptr)
   --    OPENSSL_sk_find(ossl_check_OPENSSL_CSTRING_sk_type(sk), ossl_check_OPENSSL_CSTRING_type(ptr))
   --  arg-macro: procedure sk_OPENSSL_CSTRING_find_ex (sk, ptr)
   --    OPENSSL_sk_find_ex(ossl_check_OPENSSL_CSTRING_sk_type(sk), ossl_check_OPENSSL_CSTRING_type(ptr))
   --  arg-macro: procedure sk_OPENSSL_CSTRING_find_all (sk, ptr, pnum)
   --    OPENSSL_sk_find_all(ossl_check_OPENSSL_CSTRING_sk_type(sk), ossl_check_OPENSSL_CSTRING_type(ptr), pnum)
   --  arg-macro: procedure sk_OPENSSL_CSTRING_sort (sk)
   --    OPENSSL_sk_sort(ossl_check_OPENSSL_CSTRING_sk_type(sk))
   --  arg-macro: procedure sk_OPENSSL_CSTRING_is_sorted (sk)
   --    OPENSSL_sk_is_sorted(ossl_check_const_OPENSSL_CSTRING_sk_type(sk))
   --  arg-macro: function sk_OPENSSL_CSTRING_dup (sk)
   --    return (STACK_OF(OPENSSL_CSTRING) *)OPENSSL_sk_dup(ossl_check_const_OPENSSL_CSTRING_sk_type(sk));
   --  arg-macro: function sk_OPENSSL_CSTRING_deep_copy (sk, copyfunc, freefunc)
   --    return (STACK_OF(OPENSSL_CSTRING) *)OPENSSL_sk_deep_copy(ossl_check_const_OPENSSL_CSTRING_sk_type(sk), ossl_check_OPENSSL_CSTRING_copyfunc_type(copyfunc), ossl_check_OPENSSL_CSTRING_freefunc_type(freefunc));
   --  arg-macro: function sk_OPENSSL_CSTRING_set_cmp_func (sk, cmp)
   --    return (sk_OPENSSL_CSTRING_compfunc)OPENSSL_sk_set_cmp_func(ossl_check_OPENSSL_CSTRING_sk_type(sk), ossl_check_OPENSSL_CSTRING_compfunc_type(cmp));
   --  arg-macro: procedure sk_OPENSSL_BLOCK_num (sk)
   --    OPENSSL_sk_num(ossl_check_const_OPENSSL_BLOCK_sk_type(sk))
   --  arg-macro: function sk_OPENSSL_BLOCK_value (sk, idx)
   --    return (void *)OPENSSL_sk_value(ossl_check_const_OPENSSL_BLOCK_sk_type(sk), (idx));
   --  arg-macro: function sk_OPENSSL_BLOCK_new (cmp)
   --    return (STACK_OF(OPENSSL_BLOCK) *)OPENSSL_sk_new(ossl_check_OPENSSL_BLOCK_compfunc_type(cmp));
   --  arg-macro: function sk_OPENSSL_BLOCK_new_null ()
   --    return (STACK_OF(OPENSSL_BLOCK) *)OPENSSL_sk_new_null();
   --  arg-macro: function sk_OPENSSL_BLOCK_new_reserve (cmp, n)
   --    return (STACK_OF(OPENSSL_BLOCK) *)OPENSSL_sk_new_reserve(ossl_check_OPENSSL_BLOCK_compfunc_type(cmp), (n));
   --  arg-macro: procedure sk_OPENSSL_BLOCK_reserve (sk, n)
   --    OPENSSL_sk_reserve(ossl_check_OPENSSL_BLOCK_sk_type(sk), (n))
   --  arg-macro: procedure sk_OPENSSL_BLOCK_free (sk)
   --    OPENSSL_sk_free(ossl_check_OPENSSL_BLOCK_sk_type(sk))
   --  arg-macro: procedure sk_OPENSSL_BLOCK_zero (sk)
   --    OPENSSL_sk_zero(ossl_check_OPENSSL_BLOCK_sk_type(sk))
   --  arg-macro: function sk_OPENSSL_BLOCK_delete (sk, i)
   --    return (void *)OPENSSL_sk_delete(ossl_check_OPENSSL_BLOCK_sk_type(sk), (i));
   --  arg-macro: function sk_OPENSSL_BLOCK_delete_ptr (sk, ptr)
   --    return (void *)OPENSSL_sk_delete_ptr(ossl_check_OPENSSL_BLOCK_sk_type(sk), ossl_check_OPENSSL_BLOCK_type(ptr));
   --  arg-macro: procedure sk_OPENSSL_BLOCK_push (sk, ptr)
   --    OPENSSL_sk_push(ossl_check_OPENSSL_BLOCK_sk_type(sk), ossl_check_OPENSSL_BLOCK_type(ptr))
   --  arg-macro: procedure sk_OPENSSL_BLOCK_unshift (sk, ptr)
   --    OPENSSL_sk_unshift(ossl_check_OPENSSL_BLOCK_sk_type(sk), ossl_check_OPENSSL_BLOCK_type(ptr))
   --  arg-macro: function sk_OPENSSL_BLOCK_pop (sk)
   --    return (void *)OPENSSL_sk_pop(ossl_check_OPENSSL_BLOCK_sk_type(sk));
   --  arg-macro: function sk_OPENSSL_BLOCK_shift (sk)
   --    return (void *)OPENSSL_sk_shift(ossl_check_OPENSSL_BLOCK_sk_type(sk));
   --  arg-macro: procedure sk_OPENSSL_BLOCK_pop_free (sk, freefunc)
   --    OPENSSL_sk_pop_free(ossl_check_OPENSSL_BLOCK_sk_type(sk),ossl_check_OPENSSL_BLOCK_freefunc_type(freefunc))
   --  arg-macro: procedure sk_OPENSSL_BLOCK_insert (sk, ptr, idx)
   --    OPENSSL_sk_insert(ossl_check_OPENSSL_BLOCK_sk_type(sk), ossl_check_OPENSSL_BLOCK_type(ptr), (idx))
   --  arg-macro: function sk_OPENSSL_BLOCK_set (sk, idx, ptr)
   --    return (void *)OPENSSL_sk_set(ossl_check_OPENSSL_BLOCK_sk_type(sk), (idx), ossl_check_OPENSSL_BLOCK_type(ptr));
   --  arg-macro: procedure sk_OPENSSL_BLOCK_find (sk, ptr)
   --    OPENSSL_sk_find(ossl_check_OPENSSL_BLOCK_sk_type(sk), ossl_check_OPENSSL_BLOCK_type(ptr))
   --  arg-macro: procedure sk_OPENSSL_BLOCK_find_ex (sk, ptr)
   --    OPENSSL_sk_find_ex(ossl_check_OPENSSL_BLOCK_sk_type(sk), ossl_check_OPENSSL_BLOCK_type(ptr))
   --  arg-macro: procedure sk_OPENSSL_BLOCK_find_all (sk, ptr, pnum)
   --    OPENSSL_sk_find_all(ossl_check_OPENSSL_BLOCK_sk_type(sk), ossl_check_OPENSSL_BLOCK_type(ptr), pnum)
   --  arg-macro: procedure sk_OPENSSL_BLOCK_sort (sk)
   --    OPENSSL_sk_sort(ossl_check_OPENSSL_BLOCK_sk_type(sk))
   --  arg-macro: procedure sk_OPENSSL_BLOCK_is_sorted (sk)
   --    OPENSSL_sk_is_sorted(ossl_check_const_OPENSSL_BLOCK_sk_type(sk))
   --  arg-macro: function sk_OPENSSL_BLOCK_dup (sk)
   --    return (STACK_OF(OPENSSL_BLOCK) *)OPENSSL_sk_dup(ossl_check_const_OPENSSL_BLOCK_sk_type(sk));
   --  arg-macro: function sk_OPENSSL_BLOCK_deep_copy (sk, copyfunc, freefunc)
   --    return (STACK_OF(OPENSSL_BLOCK) *)OPENSSL_sk_deep_copy(ossl_check_const_OPENSSL_BLOCK_sk_type(sk), ossl_check_OPENSSL_BLOCK_copyfunc_type(copyfunc), ossl_check_OPENSSL_BLOCK_freefunc_type(freefunc));
   --  arg-macro: function sk_OPENSSL_BLOCK_set_cmp_func (sk, cmp)
   --    return (sk_OPENSSL_BLOCK_compfunc)OPENSSL_sk_set_cmp_func(ossl_check_OPENSSL_BLOCK_sk_type(sk), ossl_check_OPENSSL_BLOCK_compfunc_type(cmp));
  -- * WARNING: do not edit!
  -- * Generated by Makefile from include/openssl/safestack.h.in
  -- *
  -- * Copyright 1999-2021 The OpenSSL Project Authors. All Rights Reserved.
  -- *
  -- * Licensed under the Apache License 2.0 (the "License").  You may not use
  -- * this file except in compliance with the License.  You can obtain a copy
  -- * in the file LICENSE in the source distribution or at
  -- * https://www.openssl.org/source/license.html
  --  

  -- Helper macro for internal use  
  ---
  -- * Strings are special: normally an lhash entry will point to a single
  -- * (somewhat) mutable object. In the case of strings:
  -- *
  -- * a) Instead of a single char, there is an array of chars, NUL-terminated.
  -- * b) The string may have be immutable.
  -- *
  -- * So, they need their own declarations. Especially important for
  -- * type-checking tools, such as Deputy.
  -- *
  -- * In practice, however, it appears to be hard to have a const
  -- * string. For now, I'm settling for dealing with the fact it is a
  -- * string at all.
  --  

   type OPENSSL_STRING is new Interfaces.C.Strings.chars_ptr;  -- /usr/include/openssl/safestack.h:195

   type OPENSSL_CSTRING is new Interfaces.C.Strings.chars_ptr;  -- /usr/include/openssl/safestack.h:196

  ---
  -- * Confusingly, LHASH_OF(STRING) deals with char ** throughout, but
  -- * STACK_OF(STRING) is really more like STACK_OF(char), only, as mentioned
  -- * above, instead of a single char each entry is a NUL-terminated array of
  -- * chars. So, we have to implement STRING specially for STACK_OF. This is
  -- * dealt with in the autogenerated macros below.
  --  

   type stack_st_OPENSSL_STRING is null record;   -- incomplete struct

   type sk_OPENSSL_STRING_compfunc is access function (arg1 : System.Address; arg2 : System.Address) return int
   with Convention => C;  -- /usr/include/openssl/safestack.h:205

   type sk_OPENSSL_STRING_freefunc is access procedure (arg1 : Interfaces.C.Strings.chars_ptr)
   with Convention => C;  -- /usr/include/openssl/safestack.h:205

   type sk_OPENSSL_STRING_copyfunc is access function (arg1 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr
   with Convention => C;  -- /usr/include/openssl/safestack.h:205

   function ossl_check_OPENSSL_STRING_type (ptr : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/safestack.h:205
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_OPENSSL_STRING_type";

   function ossl_check_const_OPENSSL_STRING_sk_type (sk : access constant stack_st_OPENSSL_STRING) return access constant openssl_stack_h.stack_st  -- /usr/include/openssl/safestack.h:205
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_const_OPENSSL_STRING_sk_type";

   function ossl_check_OPENSSL_STRING_sk_type (sk : access stack_st_OPENSSL_STRING) return access openssl_stack_h.stack_st  -- /usr/include/openssl/safestack.h:205
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_OPENSSL_STRING_sk_type";

   function ossl_check_OPENSSL_STRING_compfunc_type (cmp : sk_OPENSSL_STRING_compfunc) return openssl_stack_h.OPENSSL_sk_compfunc  -- /usr/include/openssl/safestack.h:205
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_OPENSSL_STRING_compfunc_type";

   function ossl_check_OPENSSL_STRING_copyfunc_type (cpy : sk_OPENSSL_STRING_copyfunc) return openssl_stack_h.OPENSSL_sk_copyfunc  -- /usr/include/openssl/safestack.h:205
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_OPENSSL_STRING_copyfunc_type";

   function ossl_check_OPENSSL_STRING_freefunc_type (fr : sk_OPENSSL_STRING_freefunc) return openssl_stack_h.OPENSSL_sk_freefunc  -- /usr/include/openssl/safestack.h:205
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_OPENSSL_STRING_freefunc_type";

   type stack_st_OPENSSL_CSTRING is null record;   -- incomplete struct

   type sk_OPENSSL_CSTRING_compfunc is access function (arg1 : System.Address; arg2 : System.Address) return int
   with Convention => C;  -- /usr/include/openssl/safestack.h:231

   type sk_OPENSSL_CSTRING_freefunc is access procedure (arg1 : Interfaces.C.Strings.chars_ptr)
   with Convention => C;  -- /usr/include/openssl/safestack.h:231

   type sk_OPENSSL_CSTRING_copyfunc is access function (arg1 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr
   with Convention => C;  -- /usr/include/openssl/safestack.h:231

   function ossl_check_OPENSSL_CSTRING_type (ptr : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/safestack.h:231
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_OPENSSL_CSTRING_type";

   function ossl_check_const_OPENSSL_CSTRING_sk_type (sk : access constant stack_st_OPENSSL_CSTRING) return access constant openssl_stack_h.stack_st  -- /usr/include/openssl/safestack.h:231
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_const_OPENSSL_CSTRING_sk_type";

   function ossl_check_OPENSSL_CSTRING_sk_type (sk : access stack_st_OPENSSL_CSTRING) return access openssl_stack_h.stack_st  -- /usr/include/openssl/safestack.h:231
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_OPENSSL_CSTRING_sk_type";

   function ossl_check_OPENSSL_CSTRING_compfunc_type (cmp : sk_OPENSSL_CSTRING_compfunc) return openssl_stack_h.OPENSSL_sk_compfunc  -- /usr/include/openssl/safestack.h:231
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_OPENSSL_CSTRING_compfunc_type";

   function ossl_check_OPENSSL_CSTRING_copyfunc_type (cpy : sk_OPENSSL_CSTRING_copyfunc) return openssl_stack_h.OPENSSL_sk_copyfunc  -- /usr/include/openssl/safestack.h:231
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_OPENSSL_CSTRING_copyfunc_type";

   function ossl_check_OPENSSL_CSTRING_freefunc_type (fr : sk_OPENSSL_CSTRING_freefunc) return openssl_stack_h.OPENSSL_sk_freefunc  -- /usr/include/openssl/safestack.h:231
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_OPENSSL_CSTRING_freefunc_type";

  -- * This is not used by OpenSSL.  A block of bytes,  NOT nul-terminated.
  -- * These should also be distinguished from "normal" stacks.
  --  

   type OPENSSL_BLOCK is new System.Address;  -- /usr/include/openssl/safestack.h:264

   type stack_st_OPENSSL_BLOCK is null record;   -- incomplete struct

   type sk_OPENSSL_BLOCK_compfunc is access function (arg1 : System.Address; arg2 : System.Address) return int
   with Convention => C;  -- /usr/include/openssl/safestack.h:265

   type sk_OPENSSL_BLOCK_freefunc is access procedure (arg1 : System.Address)
   with Convention => C;  -- /usr/include/openssl/safestack.h:265

   type sk_OPENSSL_BLOCK_copyfunc is access function (arg1 : System.Address) return System.Address
   with Convention => C;  -- /usr/include/openssl/safestack.h:265

   function ossl_check_OPENSSL_BLOCK_type (ptr : System.Address) return System.Address  -- /usr/include/openssl/safestack.h:265
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_OPENSSL_BLOCK_type";

   function ossl_check_const_OPENSSL_BLOCK_sk_type (sk : access constant stack_st_OPENSSL_BLOCK) return access constant openssl_stack_h.stack_st  -- /usr/include/openssl/safestack.h:265
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_const_OPENSSL_BLOCK_sk_type";

   function ossl_check_OPENSSL_BLOCK_sk_type (sk : access stack_st_OPENSSL_BLOCK) return access openssl_stack_h.stack_st  -- /usr/include/openssl/safestack.h:265
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_OPENSSL_BLOCK_sk_type";

   function ossl_check_OPENSSL_BLOCK_compfunc_type (cmp : sk_OPENSSL_BLOCK_compfunc) return openssl_stack_h.OPENSSL_sk_compfunc  -- /usr/include/openssl/safestack.h:265
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_OPENSSL_BLOCK_compfunc_type";

   function ossl_check_OPENSSL_BLOCK_copyfunc_type (cpy : sk_OPENSSL_BLOCK_copyfunc) return openssl_stack_h.OPENSSL_sk_copyfunc  -- /usr/include/openssl/safestack.h:265
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_OPENSSL_BLOCK_copyfunc_type";

   function ossl_check_OPENSSL_BLOCK_freefunc_type (fr : sk_OPENSSL_BLOCK_freefunc) return openssl_stack_h.OPENSSL_sk_freefunc  -- /usr/include/openssl/safestack.h:265
   with Import => True, 
        Convention => C, 
        External_Name => "ossl_check_OPENSSL_BLOCK_freefunc_type";

end openssl_safestack_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
