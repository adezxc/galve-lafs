pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
limited with openssl_types_h;
with System;
with Interfaces.C.Strings;
limited with bits_types_struct_FILE_h;
with stddef_h;

package openssl_bn_h is

   --  unsupported macro: BN_ULONG unsigned long
   BN_BYTES : constant := 8;  --  /usr/include/openssl/bn.h:38
   --  unsupported macro: BN_BITS2 (BN_BYTES * 8)
   --  unsupported macro: BN_BITS (BN_BITS2 * 2)
   --  unsupported macro: BN_TBIT ((BN_ULONG)1 << (BN_BITS2 - 1))

   BN_FLG_MALLOCED : constant := 16#01#;  --  /usr/include/openssl/bn.h:58
   BN_FLG_STATIC_DATA : constant := 16#02#;  --  /usr/include/openssl/bn.h:59

   BN_FLG_CONSTTIME : constant := 16#04#;  --  /usr/include/openssl/bn.h:67
   BN_FLG_SECURE : constant := 16#08#;  --  /usr/include/openssl/bn.h:68
   --  unsupported macro: BN_FLG_EXP_CONSTTIME BN_FLG_CONSTTIME

   BN_FLG_FREE : constant := 16#8000#;  --  /usr/include/openssl/bn.h:73

   BN_RAND_TOP_ANY : constant := -1;  --  /usr/include/openssl/bn.h:80
   BN_RAND_TOP_ONE : constant := 0;  --  /usr/include/openssl/bn.h:81
   BN_RAND_TOP_TWO : constant := 1;  --  /usr/include/openssl/bn.h:82

   BN_RAND_BOTTOM_ANY : constant := 0;  --  /usr/include/openssl/bn.h:85
   BN_RAND_BOTTOM_ODD : constant := 1;  --  /usr/include/openssl/bn.h:86

   BN_prime_checks : constant := 0;  --  /usr/include/openssl/bn.h:113
   --  arg-macro: function BN_prime_checks_for_size (b)
   --    return (b) >= 3747 ? 3 : (b) >= 1345 ? 4 : (b) >= 476 ? 5 : (b) >= 400 ? 6 : (b) >= 347 ? 7 : (b) >= 308 ? 8 : (b) >= 55 ? 27 : 34;
   --  arg-macro: function BN_num_bytes (a)
   --    return (BN_num_bits(a)+7)/8;
   --  arg-macro: function BN_one (a)
   --    return BN_set_word((a),1);
   --  arg-macro: procedure BN_zero (a)
   --    BN_zero_ex(a)
   --  arg-macro: procedure BN_mod (rem, m, d, ctx)
   --    BN_div(NULL,(rem),(m),(d),(ctx))

   BN_BLINDING_NO_UPDATE : constant := 16#00000001#;  --  /usr/include/openssl/bn.h:422
   BN_BLINDING_NO_RECREATE : constant := 16#00000002#;  --  /usr/include/openssl/bn.h:423
   --  arg-macro: procedure BN_GF2m_sub (r, a, b)
   --    BN_GF2m_add(r, a, b)
   --  arg-macro: procedure BN_GF2m_cmp (a, b)
   --    BN_ucmp((a), (b))
   --  unsupported macro: get_rfc2409_prime_768 BN_get_rfc2409_prime_768
   --  unsupported macro: get_rfc2409_prime_1024 BN_get_rfc2409_prime_1024
   --  unsupported macro: get_rfc3526_prime_1536 BN_get_rfc3526_prime_1536
   --  unsupported macro: get_rfc3526_prime_2048 BN_get_rfc3526_prime_2048
   --  unsupported macro: get_rfc3526_prime_3072 BN_get_rfc3526_prime_3072
   --  unsupported macro: get_rfc3526_prime_4096 BN_get_rfc3526_prime_4096
   --  unsupported macro: get_rfc3526_prime_6144 BN_get_rfc3526_prime_6144
   --  unsupported macro: get_rfc3526_prime_8192 BN_get_rfc3526_prime_8192

  -- * Copyright 1995-2022 The OpenSSL Project Authors. All Rights Reserved.
  -- * Copyright (c) 2002, Oracle and/or its affiliates. All rights reserved
  -- *
  -- * Licensed under the Apache License 2.0 (the "License").  You may not use
  -- * this file except in compliance with the License.  You can obtain a copy
  -- * in the file LICENSE in the source distribution or at
  -- * https://www.openssl.org/source/license.html
  --  

  -- * 64-bit processor with LP64 ABI
  --  

  -- * 64-bit processor other than LP64 ABI
  --  

  -- * avoid leaking exponent information through timing,
  -- * BN_mod_exp_mont() will call BN_mod_exp_mont_consttime,
  -- * BN_div() will call BN_div_no_branch,
  -- * BN_mod_inverse() will call bn_mod_inverse_no_branch.
  --  

  -- deprecated name for the flag  
   procedure BN_set_flags (b : access openssl_types_h.bignum_st; n : int)  -- /usr/include/openssl/bn.h:76
   with Import => True, 
        Convention => C, 
        External_Name => "BN_set_flags";

   function BN_get_flags (b : access constant openssl_types_h.bignum_st; n : int) return int  -- /usr/include/openssl/bn.h:77
   with Import => True, 
        Convention => C, 
        External_Name => "BN_get_flags";

  -- Values for |top| in BN_rand()  
  -- Values for |bottom| in BN_rand()  
  -- * get a clone of a BIGNUM with changed flags, for *temporary* use only (the
  -- * two BIGNUMs cannot be used in parallel!). Also only for *read only* use. The
  -- * value |dest| should be a newly allocated BIGNUM obtained via BN_new() that
  -- * has not been otherwise initialised or used.
  --  

   procedure BN_with_flags
     (dest : access openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st;
      flags : int)  -- /usr/include/openssl/bn.h:94
   with Import => True, 
        Convention => C, 
        External_Name => "BN_with_flags";

  -- Wrapper function to make using BN_GENCB easier  
   function BN_GENCB_call
     (cb : access openssl_types_h.bn_gencb_st;
      a : int;
      b : int) return int  -- /usr/include/openssl/bn.h:97
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GENCB_call";

   function BN_GENCB_new return access openssl_types_h.bn_gencb_st  -- /usr/include/openssl/bn.h:99
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GENCB_new";

   procedure BN_GENCB_free (cb : access openssl_types_h.bn_gencb_st)  -- /usr/include/openssl/bn.h:100
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GENCB_free";

  -- Populate a BN_GENCB structure with an "old"-style callback  
   procedure BN_GENCB_set_old
     (gencb : access openssl_types_h.bn_gencb_st;
      callback : access procedure
        (arg1 : int;
         arg2 : int;
         arg3 : System.Address);
      cb_arg : System.Address)  -- /usr/include/openssl/bn.h:103
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GENCB_set_old";

  -- Populate a BN_GENCB structure with a "new"-style callback  
   procedure BN_GENCB_set
     (gencb : access openssl_types_h.bn_gencb_st;
      callback : access function
        (arg1 : int;
         arg2 : int;
         arg3 : access openssl_types_h.bn_gencb_st) return int;
      cb_arg : System.Address)  -- /usr/include/openssl/bn.h:107
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GENCB_set";

   function BN_GENCB_get_arg (cb : access openssl_types_h.bn_gencb_st) return System.Address  -- /usr/include/openssl/bn.h:110
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GENCB_get_arg";

  -- * BN_prime_checks_for_size() returns the number of Miller-Rabin iterations
  -- * that will be done for checking that a random number is probably prime. The
  -- * error rate for accepting a composite number as prime depends on the size of
  -- * the prime |b|. The error rates used are for calculating an RSA key with 2 primes,
  -- * and so the level is what you would expect for a key of double the size of the
  -- * prime.
  -- *
  -- * This table is generated using the algorithm of FIPS PUB 186-4
  -- * Digital Signature Standard (DSS), section F.1, page 117.
  -- * (https://dx.doi.org/10.6028/NIST.FIPS.186-4)
  -- *
  -- * The following magma script was used to generate the output:
  -- * securitybits:=125;
  -- * k:=1024;
  -- * for t:=1 to 65 do
  -- *   for M:=3 to Floor(2*Sqrt(k-1)-1) do
  -- *     S:=0;
  -- *     // Sum over m
  -- *     for m:=3 to M do
  -- *       s:=0;
  -- *       // Sum over j
  -- *       for j:=2 to m do
  -- *         s+:=(RealField(32)!2)^-(j+(k-1)/j);
  -- *       end for;
  -- *       S+:=2^(m-(m-1)*t)*s;
  -- *     end for;
  -- *     A:=2^(k-2-M*t);
  -- *     B:=8*(Pi(RealField(32))^2-6)/3*2^(k-2)*S;
  -- *     pkt:=2.00743*Log(2)*k*2^-k*(A+B);
  -- *     seclevel:=Floor(-Log(2,pkt));
  -- *     if seclevel ge securitybits then
  -- *       printf "k: %5o, security: %o bits  (t: %o, M: %o)\n",k,seclevel,t,M;
  -- *       break;
  -- *     end if;
  -- *   end for;
  -- *   if seclevel ge securitybits then break; end if;
  -- * end for;
  -- *
  -- * It can be run online at:
  -- * http://magma.maths.usyd.edu.au/calc
  -- *
  -- * And will output:
  -- * k:  1024, security: 129 bits  (t: 6, M: 23)
  -- *
  -- * k is the number of bits of the prime, securitybits is the level we want to
  -- * reach.
  -- *
  -- * prime length | RSA key size | # MR tests | security level
  -- * -------------+--------------|------------+---------------
  -- *  (b) >= 6394 |     >= 12788 |          3 |        256 bit
  -- *  (b) >= 3747 |     >=  7494 |          3 |        192 bit
  -- *  (b) >= 1345 |     >=  2690 |          4 |        128 bit
  -- *  (b) >= 1080 |     >=  2160 |          5 |        128 bit
  -- *  (b) >=  852 |     >=  1704 |          5 |        112 bit
  -- *  (b) >=  476 |     >=   952 |          5 |         80 bit
  -- *  (b) >=  400 |     >=   800 |          6 |         80 bit
  -- *  (b) >=  347 |     >=   694 |          7 |         80 bit
  -- *  (b) >=  308 |     >=   616 |          8 |         80 bit
  -- *  (b) >=   55 |     >=   110 |         27 |         64 bit
  -- *  (b) >=    6 |     >=    12 |         34 |         64 bit
  --  

   function BN_abs_is_word (a : access constant openssl_types_h.bignum_st; w : unsigned_long) return int  -- /usr/include/openssl/bn.h:191
   with Import => True, 
        Convention => C, 
        External_Name => "BN_abs_is_word";

   function BN_is_zero (a : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:192
   with Import => True, 
        Convention => C, 
        External_Name => "BN_is_zero";

   function BN_is_one (a : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:193
   with Import => True, 
        Convention => C, 
        External_Name => "BN_is_one";

   function BN_is_word (a : access constant openssl_types_h.bignum_st; w : unsigned_long) return int  -- /usr/include/openssl/bn.h:194
   with Import => True, 
        Convention => C, 
        External_Name => "BN_is_word";

   function BN_is_odd (a : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:195
   with Import => True, 
        Convention => C, 
        External_Name => "BN_is_odd";

   procedure BN_zero_ex (a : access openssl_types_h.bignum_st)  -- /usr/include/openssl/bn.h:199
   with Import => True, 
        Convention => C, 
        External_Name => "BN_zero_ex";

   function BN_value_one return access constant openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:207
   with Import => True, 
        Convention => C, 
        External_Name => "BN_value_one";

   function BN_options return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/bn.h:208
   with Import => True, 
        Convention => C, 
        External_Name => "BN_options";

   function BN_CTX_new_ex (ctx : access openssl_types_h.ossl_lib_ctx_st) return access openssl_types_h.bignum_ctx  -- /usr/include/openssl/bn.h:209
   with Import => True, 
        Convention => C, 
        External_Name => "BN_CTX_new_ex";

   function BN_CTX_new return access openssl_types_h.bignum_ctx  -- /usr/include/openssl/bn.h:210
   with Import => True, 
        Convention => C, 
        External_Name => "BN_CTX_new";

   function BN_CTX_secure_new_ex (ctx : access openssl_types_h.ossl_lib_ctx_st) return access openssl_types_h.bignum_ctx  -- /usr/include/openssl/bn.h:211
   with Import => True, 
        Convention => C, 
        External_Name => "BN_CTX_secure_new_ex";

   function BN_CTX_secure_new return access openssl_types_h.bignum_ctx  -- /usr/include/openssl/bn.h:212
   with Import => True, 
        Convention => C, 
        External_Name => "BN_CTX_secure_new";

   procedure BN_CTX_free (c : access openssl_types_h.bignum_ctx)  -- /usr/include/openssl/bn.h:213
   with Import => True, 
        Convention => C, 
        External_Name => "BN_CTX_free";

   procedure BN_CTX_start (ctx : access openssl_types_h.bignum_ctx)  -- /usr/include/openssl/bn.h:214
   with Import => True, 
        Convention => C, 
        External_Name => "BN_CTX_start";

   function BN_CTX_get (ctx : access openssl_types_h.bignum_ctx) return access openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:215
   with Import => True, 
        Convention => C, 
        External_Name => "BN_CTX_get";

   procedure BN_CTX_end (ctx : access openssl_types_h.bignum_ctx)  -- /usr/include/openssl/bn.h:216
   with Import => True, 
        Convention => C, 
        External_Name => "BN_CTX_end";

   function BN_rand_ex
     (rnd : access openssl_types_h.bignum_st;
      bits : int;
      top : int;
      bottom : int;
      strength : unsigned;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:217
   with Import => True, 
        Convention => C, 
        External_Name => "BN_rand_ex";

   function BN_rand
     (rnd : access openssl_types_h.bignum_st;
      bits : int;
      top : int;
      bottom : int) return int  -- /usr/include/openssl/bn.h:219
   with Import => True, 
        Convention => C, 
        External_Name => "BN_rand";

   function BN_priv_rand_ex
     (rnd : access openssl_types_h.bignum_st;
      bits : int;
      top : int;
      bottom : int;
      strength : unsigned;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:220
   with Import => True, 
        Convention => C, 
        External_Name => "BN_priv_rand_ex";

   function BN_priv_rand
     (rnd : access openssl_types_h.bignum_st;
      bits : int;
      top : int;
      bottom : int) return int  -- /usr/include/openssl/bn.h:222
   with Import => True, 
        Convention => C, 
        External_Name => "BN_priv_rand";

   function BN_rand_range_ex
     (r : access openssl_types_h.bignum_st;
      c_range : access constant openssl_types_h.bignum_st;
      strength : unsigned;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:223
   with Import => True, 
        Convention => C, 
        External_Name => "BN_rand_range_ex";

   function BN_rand_range (rnd : access openssl_types_h.bignum_st; c_range : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:225
   with Import => True, 
        Convention => C, 
        External_Name => "BN_rand_range";

   function BN_priv_rand_range_ex
     (r : access openssl_types_h.bignum_st;
      c_range : access constant openssl_types_h.bignum_st;
      strength : unsigned;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:226
   with Import => True, 
        Convention => C, 
        External_Name => "BN_priv_rand_range_ex";

   function BN_priv_rand_range (rnd : access openssl_types_h.bignum_st; c_range : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:228
   with Import => True, 
        Convention => C, 
        External_Name => "BN_priv_rand_range";

   function BN_pseudo_rand
     (rnd : access openssl_types_h.bignum_st;
      bits : int;
      top : int;
      bottom : int) return int  -- /usr/include/openssl/bn.h:231
   with Import => True, 
        Convention => C, 
        External_Name => "BN_pseudo_rand";

   function BN_pseudo_rand_range (rnd : access openssl_types_h.bignum_st; c_range : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:233
   with Import => True, 
        Convention => C, 
        External_Name => "BN_pseudo_rand_range";

   function BN_num_bits (a : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:235
   with Import => True, 
        Convention => C, 
        External_Name => "BN_num_bits";

   function BN_num_bits_word (l : unsigned_long) return int  -- /usr/include/openssl/bn.h:236
   with Import => True, 
        Convention => C, 
        External_Name => "BN_num_bits_word";

   function BN_security_bits (L : int; N : int) return int  -- /usr/include/openssl/bn.h:237
   with Import => True, 
        Convention => C, 
        External_Name => "BN_security_bits";

   function BN_new return access openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:238
   with Import => True, 
        Convention => C, 
        External_Name => "BN_new";

   function BN_secure_new return access openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:239
   with Import => True, 
        Convention => C, 
        External_Name => "BN_secure_new";

   procedure BN_clear_free (a : access openssl_types_h.bignum_st)  -- /usr/include/openssl/bn.h:240
   with Import => True, 
        Convention => C, 
        External_Name => "BN_clear_free";

   function BN_copy (a : access openssl_types_h.bignum_st; b : access constant openssl_types_h.bignum_st) return access openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:241
   with Import => True, 
        Convention => C, 
        External_Name => "BN_copy";

   procedure BN_swap (a : access openssl_types_h.bignum_st; b : access openssl_types_h.bignum_st)  -- /usr/include/openssl/bn.h:242
   with Import => True, 
        Convention => C, 
        External_Name => "BN_swap";

   function BN_bin2bn
     (s : access unsigned_char;
      len : int;
      ret : access openssl_types_h.bignum_st) return access openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:243
   with Import => True, 
        Convention => C, 
        External_Name => "BN_bin2bn";

   function BN_signed_bin2bn
     (s : access unsigned_char;
      len : int;
      ret : access openssl_types_h.bignum_st) return access openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:244
   with Import => True, 
        Convention => C, 
        External_Name => "BN_signed_bin2bn";

   function BN_bn2bin (a : access constant openssl_types_h.bignum_st; to : access unsigned_char) return int  -- /usr/include/openssl/bn.h:245
   with Import => True, 
        Convention => C, 
        External_Name => "BN_bn2bin";

   function BN_bn2binpad
     (a : access constant openssl_types_h.bignum_st;
      to : access unsigned_char;
      tolen : int) return int  -- /usr/include/openssl/bn.h:246
   with Import => True, 
        Convention => C, 
        External_Name => "BN_bn2binpad";

   function BN_signed_bn2bin
     (a : access constant openssl_types_h.bignum_st;
      to : access unsigned_char;
      tolen : int) return int  -- /usr/include/openssl/bn.h:247
   with Import => True, 
        Convention => C, 
        External_Name => "BN_signed_bn2bin";

   function BN_lebin2bn
     (s : access unsigned_char;
      len : int;
      ret : access openssl_types_h.bignum_st) return access openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:248
   with Import => True, 
        Convention => C, 
        External_Name => "BN_lebin2bn";

   function BN_signed_lebin2bn
     (s : access unsigned_char;
      len : int;
      ret : access openssl_types_h.bignum_st) return access openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:249
   with Import => True, 
        Convention => C, 
        External_Name => "BN_signed_lebin2bn";

   function BN_bn2lebinpad
     (a : access constant openssl_types_h.bignum_st;
      to : access unsigned_char;
      tolen : int) return int  -- /usr/include/openssl/bn.h:250
   with Import => True, 
        Convention => C, 
        External_Name => "BN_bn2lebinpad";

   function BN_signed_bn2lebin
     (a : access constant openssl_types_h.bignum_st;
      to : access unsigned_char;
      tolen : int) return int  -- /usr/include/openssl/bn.h:251
   with Import => True, 
        Convention => C, 
        External_Name => "BN_signed_bn2lebin";

   function BN_native2bn
     (s : access unsigned_char;
      len : int;
      ret : access openssl_types_h.bignum_st) return access openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:252
   with Import => True, 
        Convention => C, 
        External_Name => "BN_native2bn";

   function BN_signed_native2bn
     (s : access unsigned_char;
      len : int;
      ret : access openssl_types_h.bignum_st) return access openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:253
   with Import => True, 
        Convention => C, 
        External_Name => "BN_signed_native2bn";

   function BN_bn2nativepad
     (a : access constant openssl_types_h.bignum_st;
      to : access unsigned_char;
      tolen : int) return int  -- /usr/include/openssl/bn.h:254
   with Import => True, 
        Convention => C, 
        External_Name => "BN_bn2nativepad";

   function BN_signed_bn2native
     (a : access constant openssl_types_h.bignum_st;
      to : access unsigned_char;
      tolen : int) return int  -- /usr/include/openssl/bn.h:255
   with Import => True, 
        Convention => C, 
        External_Name => "BN_signed_bn2native";

   function BN_mpi2bn
     (s : access unsigned_char;
      len : int;
      ret : access openssl_types_h.bignum_st) return access openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:256
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mpi2bn";

   function BN_bn2mpi (a : access constant openssl_types_h.bignum_st; to : access unsigned_char) return int  -- /usr/include/openssl/bn.h:257
   with Import => True, 
        Convention => C, 
        External_Name => "BN_bn2mpi";

   function BN_sub
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:258
   with Import => True, 
        Convention => C, 
        External_Name => "BN_sub";

   function BN_usub
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:259
   with Import => True, 
        Convention => C, 
        External_Name => "BN_usub";

   function BN_uadd
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:260
   with Import => True, 
        Convention => C, 
        External_Name => "BN_uadd";

   function BN_add
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:261
   with Import => True, 
        Convention => C, 
        External_Name => "BN_add";

   function BN_mul
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:262
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mul";

   function BN_sqr
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:263
   with Import => True, 
        Convention => C, 
        External_Name => "BN_sqr";

  --* BN_set_negative sets sign of a BIGNUM
  -- * \param  b  pointer to the BIGNUM object
  -- * \param  n  0 if the BIGNUM b should be positive and a value != 0 otherwise
  --  

   procedure BN_set_negative (b : access openssl_types_h.bignum_st; n : int)  -- /usr/include/openssl/bn.h:268
   with Import => True, 
        Convention => C, 
        External_Name => "BN_set_negative";

  --* BN_is_negative returns 1 if the BIGNUM is negative
  -- * \param  b  pointer to the BIGNUM object
  -- * \return 1 if a < 0 and 0 otherwise
  --  

   function BN_is_negative (b : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:273
   with Import => True, 
        Convention => C, 
        External_Name => "BN_is_negative";

   function BN_div
     (dv : access openssl_types_h.bignum_st;
      c_rem : access openssl_types_h.bignum_st;
      m : access constant openssl_types_h.bignum_st;
      d : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:275
   with Import => True, 
        Convention => C, 
        External_Name => "BN_div";

   function BN_nnmod
     (r : access openssl_types_h.bignum_st;
      m : access constant openssl_types_h.bignum_st;
      d : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:278
   with Import => True, 
        Convention => C, 
        External_Name => "BN_nnmod";

   function BN_mod_add
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st;
      m : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:279
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mod_add";

   function BN_mod_add_quick
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st;
      m : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:281
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mod_add_quick";

   function BN_mod_sub
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st;
      m : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:283
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mod_sub";

   function BN_mod_sub_quick
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st;
      m : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:285
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mod_sub_quick";

   function BN_mod_mul
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st;
      m : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:287
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mod_mul";

   function BN_mod_sqr
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      m : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:289
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mod_sqr";

   function BN_mod_lshift1
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      m : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:290
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mod_lshift1";

   function BN_mod_lshift1_quick
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      m : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:291
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mod_lshift1_quick";

   function BN_mod_lshift
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      n : int;
      m : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:292
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mod_lshift";

   function BN_mod_lshift_quick
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      n : int;
      m : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:294
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mod_lshift_quick";

   function BN_mod_word (a : access constant openssl_types_h.bignum_st; w : unsigned_long) return unsigned_long  -- /usr/include/openssl/bn.h:296
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mod_word";

   function BN_div_word (a : access openssl_types_h.bignum_st; w : unsigned_long) return unsigned_long  -- /usr/include/openssl/bn.h:297
   with Import => True, 
        Convention => C, 
        External_Name => "BN_div_word";

   function BN_mul_word (a : access openssl_types_h.bignum_st; w : unsigned_long) return int  -- /usr/include/openssl/bn.h:298
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mul_word";

   function BN_add_word (a : access openssl_types_h.bignum_st; w : unsigned_long) return int  -- /usr/include/openssl/bn.h:299
   with Import => True, 
        Convention => C, 
        External_Name => "BN_add_word";

   function BN_sub_word (a : access openssl_types_h.bignum_st; w : unsigned_long) return int  -- /usr/include/openssl/bn.h:300
   with Import => True, 
        Convention => C, 
        External_Name => "BN_sub_word";

   function BN_set_word (a : access openssl_types_h.bignum_st; w : unsigned_long) return int  -- /usr/include/openssl/bn.h:301
   with Import => True, 
        Convention => C, 
        External_Name => "BN_set_word";

   function BN_get_word (a : access constant openssl_types_h.bignum_st) return unsigned_long  -- /usr/include/openssl/bn.h:302
   with Import => True, 
        Convention => C, 
        External_Name => "BN_get_word";

   function BN_cmp (a : access constant openssl_types_h.bignum_st; b : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:304
   with Import => True, 
        Convention => C, 
        External_Name => "BN_cmp";

   procedure BN_free (a : access openssl_types_h.bignum_st)  -- /usr/include/openssl/bn.h:305
   with Import => True, 
        Convention => C, 
        External_Name => "BN_free";

   function BN_is_bit_set (a : access constant openssl_types_h.bignum_st; n : int) return int  -- /usr/include/openssl/bn.h:306
   with Import => True, 
        Convention => C, 
        External_Name => "BN_is_bit_set";

   function BN_lshift
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      n : int) return int  -- /usr/include/openssl/bn.h:307
   with Import => True, 
        Convention => C, 
        External_Name => "BN_lshift";

   function BN_lshift1 (r : access openssl_types_h.bignum_st; a : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:308
   with Import => True, 
        Convention => C, 
        External_Name => "BN_lshift1";

   function BN_exp
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      p : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:309
   with Import => True, 
        Convention => C, 
        External_Name => "BN_exp";

   function BN_mod_exp
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      p : access constant openssl_types_h.bignum_st;
      m : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:311
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mod_exp";

   function BN_mod_exp_mont
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      p : access constant openssl_types_h.bignum_st;
      m : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx;
      m_ctx : access openssl_types_h.bn_mont_ctx_st) return int  -- /usr/include/openssl/bn.h:313
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mod_exp_mont";

   function BN_mod_exp_mont_consttime
     (rr : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      p : access constant openssl_types_h.bignum_st;
      m : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx;
      in_mont : access openssl_types_h.bn_mont_ctx_st) return int  -- /usr/include/openssl/bn.h:315
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mod_exp_mont_consttime";

   function BN_mod_exp_mont_word
     (r : access openssl_types_h.bignum_st;
      a : unsigned_long;
      p : access constant openssl_types_h.bignum_st;
      m : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx;
      m_ctx : access openssl_types_h.bn_mont_ctx_st) return int  -- /usr/include/openssl/bn.h:318
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mod_exp_mont_word";

   function BN_mod_exp2_mont
     (r : access openssl_types_h.bignum_st;
      a1 : access constant openssl_types_h.bignum_st;
      p1 : access constant openssl_types_h.bignum_st;
      a2 : access constant openssl_types_h.bignum_st;
      p2 : access constant openssl_types_h.bignum_st;
      m : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx;
      m_ctx : access openssl_types_h.bn_mont_ctx_st) return int  -- /usr/include/openssl/bn.h:320
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mod_exp2_mont";

   function BN_mod_exp_simple
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      p : access constant openssl_types_h.bignum_st;
      m : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:323
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mod_exp_simple";

   function BN_mod_exp_mont_consttime_x2
     (rr1 : access openssl_types_h.bignum_st;
      a1 : access constant openssl_types_h.bignum_st;
      p1 : access constant openssl_types_h.bignum_st;
      m1 : access constant openssl_types_h.bignum_st;
      in_mont1 : access openssl_types_h.bn_mont_ctx_st;
      rr2 : access openssl_types_h.bignum_st;
      a2 : access constant openssl_types_h.bignum_st;
      p2 : access constant openssl_types_h.bignum_st;
      m2 : access constant openssl_types_h.bignum_st;
      in_mont2 : access openssl_types_h.bn_mont_ctx_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:325
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mod_exp_mont_consttime_x2";

   function BN_mask_bits (a : access openssl_types_h.bignum_st; n : int) return int  -- /usr/include/openssl/bn.h:331
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mask_bits";

   function BN_print_fp (fp : access bits_types_struct_FILE_h.u_IO_FILE; a : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:333
   with Import => True, 
        Convention => C, 
        External_Name => "BN_print_fp";

   function BN_print (the_bio : access openssl_types_h.bio_st; a : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:335
   with Import => True, 
        Convention => C, 
        External_Name => "BN_print";

   function BN_reciprocal
     (r : access openssl_types_h.bignum_st;
      m : access constant openssl_types_h.bignum_st;
      len : int;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:336
   with Import => True, 
        Convention => C, 
        External_Name => "BN_reciprocal";

   function BN_rshift
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      n : int) return int  -- /usr/include/openssl/bn.h:337
   with Import => True, 
        Convention => C, 
        External_Name => "BN_rshift";

   function BN_rshift1 (r : access openssl_types_h.bignum_st; a : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:338
   with Import => True, 
        Convention => C, 
        External_Name => "BN_rshift1";

   procedure BN_clear (a : access openssl_types_h.bignum_st)  -- /usr/include/openssl/bn.h:339
   with Import => True, 
        Convention => C, 
        External_Name => "BN_clear";

   function BN_dup (a : access constant openssl_types_h.bignum_st) return access openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:340
   with Import => True, 
        Convention => C, 
        External_Name => "BN_dup";

   function BN_ucmp (a : access constant openssl_types_h.bignum_st; b : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:341
   with Import => True, 
        Convention => C, 
        External_Name => "BN_ucmp";

   function BN_set_bit (a : access openssl_types_h.bignum_st; n : int) return int  -- /usr/include/openssl/bn.h:342
   with Import => True, 
        Convention => C, 
        External_Name => "BN_set_bit";

   function BN_clear_bit (a : access openssl_types_h.bignum_st; n : int) return int  -- /usr/include/openssl/bn.h:343
   with Import => True, 
        Convention => C, 
        External_Name => "BN_clear_bit";

   function BN_bn2hex (a : access constant openssl_types_h.bignum_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/bn.h:344
   with Import => True, 
        Convention => C, 
        External_Name => "BN_bn2hex";

   function BN_bn2dec (a : access constant openssl_types_h.bignum_st) return Interfaces.C.Strings.chars_ptr  -- /usr/include/openssl/bn.h:345
   with Import => True, 
        Convention => C, 
        External_Name => "BN_bn2dec";

   function BN_hex2bn (a : System.Address; str : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/bn.h:346
   with Import => True, 
        Convention => C, 
        External_Name => "BN_hex2bn";

   function BN_dec2bn (a : System.Address; str : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/bn.h:347
   with Import => True, 
        Convention => C, 
        External_Name => "BN_dec2bn";

   function BN_asc2bn (a : System.Address; str : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/openssl/bn.h:348
   with Import => True, 
        Convention => C, 
        External_Name => "BN_asc2bn";

   function BN_gcd
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:349
   with Import => True, 
        Convention => C, 
        External_Name => "BN_gcd";

  -- returns
  --                                                                  * -2 for
  --                                                                  * error  

   function BN_kronecker
     (a : access constant openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:350
   with Import => True, 
        Convention => C, 
        External_Name => "BN_kronecker";

   function BN_are_coprime
     (a : access openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:353
   with Import => True, 
        Convention => C, 
        External_Name => "BN_are_coprime";

   function BN_mod_inverse
     (ret : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      n : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return access openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:354
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mod_inverse";

   function BN_mod_sqrt
     (ret : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      n : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return access openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:356
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mod_sqrt";

   procedure BN_consttime_swap
     (swap : unsigned_long;
      a : access openssl_types_h.bignum_st;
      b : access openssl_types_h.bignum_st;
      nwords : int)  -- /usr/include/openssl/bn.h:359
   with Import => True, 
        Convention => C, 
        External_Name => "BN_consttime_swap";

  -- Deprecated versions  
   function BN_generate_prime
     (ret : access openssl_types_h.bignum_st;
      bits : int;
      safe : int;
      add : access constant openssl_types_h.bignum_st;
      c_rem : access constant openssl_types_h.bignum_st;
      callback : access procedure
        (arg1 : int;
         arg2 : int;
         arg3 : System.Address);
      cb_arg : System.Address) return access openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:364
   with Import => True, 
        Convention => C, 
        External_Name => "BN_generate_prime";

   function BN_is_prime
     (p : access constant openssl_types_h.bignum_st;
      nchecks : int;
      callback : access procedure
        (arg1 : int;
         arg2 : int;
         arg3 : System.Address);
      ctx : access openssl_types_h.bignum_ctx;
      cb_arg : System.Address) return int  -- /usr/include/openssl/bn.h:369
   with Import => True, 
        Convention => C, 
        External_Name => "BN_is_prime";

   function BN_is_prime_fasttest
     (p : access constant openssl_types_h.bignum_st;
      nchecks : int;
      callback : access procedure
        (arg1 : int;
         arg2 : int;
         arg3 : System.Address);
      ctx : access openssl_types_h.bignum_ctx;
      cb_arg : System.Address;
      do_trial_division : int) return int  -- /usr/include/openssl/bn.h:373
   with Import => True, 
        Convention => C, 
        External_Name => "BN_is_prime_fasttest";

   function BN_is_prime_ex
     (p : access constant openssl_types_h.bignum_st;
      nchecks : int;
      ctx : access openssl_types_h.bignum_ctx;
      cb : access openssl_types_h.bn_gencb_st) return int  -- /usr/include/openssl/bn.h:380
   with Import => True, 
        Convention => C, 
        External_Name => "BN_is_prime_ex";

   function BN_is_prime_fasttest_ex
     (p : access constant openssl_types_h.bignum_st;
      nchecks : int;
      ctx : access openssl_types_h.bignum_ctx;
      do_trial_division : int;
      cb : access openssl_types_h.bn_gencb_st) return int  -- /usr/include/openssl/bn.h:382
   with Import => True, 
        Convention => C, 
        External_Name => "BN_is_prime_fasttest_ex";

  -- Newer versions  
   function BN_generate_prime_ex2
     (ret : access openssl_types_h.bignum_st;
      bits : int;
      safe : int;
      add : access constant openssl_types_h.bignum_st;
      c_rem : access constant openssl_types_h.bignum_st;
      cb : access openssl_types_h.bn_gencb_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:386
   with Import => True, 
        Convention => C, 
        External_Name => "BN_generate_prime_ex2";

   function BN_generate_prime_ex
     (ret : access openssl_types_h.bignum_st;
      bits : int;
      safe : int;
      add : access constant openssl_types_h.bignum_st;
      c_rem : access constant openssl_types_h.bignum_st;
      cb : access openssl_types_h.bn_gencb_st) return int  -- /usr/include/openssl/bn.h:389
   with Import => True, 
        Convention => C, 
        External_Name => "BN_generate_prime_ex";

   function BN_check_prime
     (p : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx;
      cb : access openssl_types_h.bn_gencb_st) return int  -- /usr/include/openssl/bn.h:391
   with Import => True, 
        Convention => C, 
        External_Name => "BN_check_prime";

   function BN_X931_generate_Xpq
     (Xp : access openssl_types_h.bignum_st;
      Xq : access openssl_types_h.bignum_st;
      nbits : int;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:395
   with Import => True, 
        Convention => C, 
        External_Name => "BN_X931_generate_Xpq";

   function BN_X931_derive_prime_ex
     (p : access openssl_types_h.bignum_st;
      p1 : access openssl_types_h.bignum_st;
      p2 : access openssl_types_h.bignum_st;
      Xp : access constant openssl_types_h.bignum_st;
      Xp1 : access constant openssl_types_h.bignum_st;
      Xp2 : access constant openssl_types_h.bignum_st;
      e : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx;
      cb : access openssl_types_h.bn_gencb_st) return int  -- /usr/include/openssl/bn.h:398
   with Import => True, 
        Convention => C, 
        External_Name => "BN_X931_derive_prime_ex";

   function BN_X931_generate_prime_ex
     (p : access openssl_types_h.bignum_st;
      p1 : access openssl_types_h.bignum_st;
      p2 : access openssl_types_h.bignum_st;
      Xp1 : access openssl_types_h.bignum_st;
      Xp2 : access openssl_types_h.bignum_st;
      Xp : access constant openssl_types_h.bignum_st;
      e : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx;
      cb : access openssl_types_h.bn_gencb_st) return int  -- /usr/include/openssl/bn.h:403
   with Import => True, 
        Convention => C, 
        External_Name => "BN_X931_generate_prime_ex";

   function BN_MONT_CTX_new return access openssl_types_h.bn_mont_ctx_st  -- /usr/include/openssl/bn.h:408
   with Import => True, 
        Convention => C, 
        External_Name => "BN_MONT_CTX_new";

   function BN_mod_mul_montgomery
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st;
      mont : access openssl_types_h.bn_mont_ctx_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:409
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mod_mul_montgomery";

   function BN_to_montgomery
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      mont : access openssl_types_h.bn_mont_ctx_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:411
   with Import => True, 
        Convention => C, 
        External_Name => "BN_to_montgomery";

   function BN_from_montgomery
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      mont : access openssl_types_h.bn_mont_ctx_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:413
   with Import => True, 
        Convention => C, 
        External_Name => "BN_from_montgomery";

   procedure BN_MONT_CTX_free (mont : access openssl_types_h.bn_mont_ctx_st)  -- /usr/include/openssl/bn.h:415
   with Import => True, 
        Convention => C, 
        External_Name => "BN_MONT_CTX_free";

   function BN_MONT_CTX_set
     (mont : access openssl_types_h.bn_mont_ctx_st;
      c_mod : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:416
   with Import => True, 
        Convention => C, 
        External_Name => "BN_MONT_CTX_set";

   function BN_MONT_CTX_copy (to : access openssl_types_h.bn_mont_ctx_st; from : access openssl_types_h.bn_mont_ctx_st) return access openssl_types_h.bn_mont_ctx_st  -- /usr/include/openssl/bn.h:417
   with Import => True, 
        Convention => C, 
        External_Name => "BN_MONT_CTX_copy";

   function BN_MONT_CTX_set_locked
     (pmont : System.Address;
      lock : System.Address;
      c_mod : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return access openssl_types_h.bn_mont_ctx_st  -- /usr/include/openssl/bn.h:418
   with Import => True, 
        Convention => C, 
        External_Name => "BN_MONT_CTX_set_locked";

  -- BN_BLINDING flags  
   function BN_BLINDING_new
     (A : access constant openssl_types_h.bignum_st;
      Ai : access constant openssl_types_h.bignum_st;
      c_mod : access openssl_types_h.bignum_st) return access openssl_types_h.bn_blinding_st  -- /usr/include/openssl/bn.h:425
   with Import => True, 
        Convention => C, 
        External_Name => "BN_BLINDING_new";

   procedure BN_BLINDING_free (b : access openssl_types_h.bn_blinding_st)  -- /usr/include/openssl/bn.h:426
   with Import => True, 
        Convention => C, 
        External_Name => "BN_BLINDING_free";

   function BN_BLINDING_update (b : access openssl_types_h.bn_blinding_st; ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:427
   with Import => True, 
        Convention => C, 
        External_Name => "BN_BLINDING_update";

   function BN_BLINDING_convert
     (n : access openssl_types_h.bignum_st;
      b : access openssl_types_h.bn_blinding_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:428
   with Import => True, 
        Convention => C, 
        External_Name => "BN_BLINDING_convert";

   function BN_BLINDING_invert
     (n : access openssl_types_h.bignum_st;
      b : access openssl_types_h.bn_blinding_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:429
   with Import => True, 
        Convention => C, 
        External_Name => "BN_BLINDING_invert";

   function BN_BLINDING_convert_ex
     (n : access openssl_types_h.bignum_st;
      r : access openssl_types_h.bignum_st;
      b : access openssl_types_h.bn_blinding_st;
      arg4 : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:430
   with Import => True, 
        Convention => C, 
        External_Name => "BN_BLINDING_convert_ex";

   function BN_BLINDING_invert_ex
     (n : access openssl_types_h.bignum_st;
      r : access constant openssl_types_h.bignum_st;
      b : access openssl_types_h.bn_blinding_st;
      arg4 : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:431
   with Import => True, 
        Convention => C, 
        External_Name => "BN_BLINDING_invert_ex";

   function BN_BLINDING_is_current_thread (b : access openssl_types_h.bn_blinding_st) return int  -- /usr/include/openssl/bn.h:434
   with Import => True, 
        Convention => C, 
        External_Name => "BN_BLINDING_is_current_thread";

   procedure BN_BLINDING_set_current_thread (b : access openssl_types_h.bn_blinding_st)  -- /usr/include/openssl/bn.h:435
   with Import => True, 
        Convention => C, 
        External_Name => "BN_BLINDING_set_current_thread";

   function BN_BLINDING_lock (b : access openssl_types_h.bn_blinding_st) return int  -- /usr/include/openssl/bn.h:436
   with Import => True, 
        Convention => C, 
        External_Name => "BN_BLINDING_lock";

   function BN_BLINDING_unlock (b : access openssl_types_h.bn_blinding_st) return int  -- /usr/include/openssl/bn.h:437
   with Import => True, 
        Convention => C, 
        External_Name => "BN_BLINDING_unlock";

   function BN_BLINDING_get_flags (arg1 : access constant openssl_types_h.bn_blinding_st) return unsigned_long  -- /usr/include/openssl/bn.h:439
   with Import => True, 
        Convention => C, 
        External_Name => "BN_BLINDING_get_flags";

   procedure BN_BLINDING_set_flags (arg1 : access openssl_types_h.bn_blinding_st; arg2 : unsigned_long)  -- /usr/include/openssl/bn.h:440
   with Import => True, 
        Convention => C, 
        External_Name => "BN_BLINDING_set_flags";

   function BN_BLINDING_create_param
     (b : access openssl_types_h.bn_blinding_st;
      e : access constant openssl_types_h.bignum_st;
      m : access openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx;
      bn_mod_exp : access function
        (arg1 : access openssl_types_h.bignum_st;
         arg2 : access constant openssl_types_h.bignum_st;
         arg3 : access constant openssl_types_h.bignum_st;
         arg4 : access constant openssl_types_h.bignum_st;
         arg5 : access openssl_types_h.bignum_ctx;
         arg6 : access openssl_types_h.bn_mont_ctx_st) return int;
      m_ctx : access openssl_types_h.bn_mont_ctx_st) return access openssl_types_h.bn_blinding_st  -- /usr/include/openssl/bn.h:441
   with Import => True, 
        Convention => C, 
        External_Name => "BN_BLINDING_create_param";

   procedure BN_set_params
     (mul : int;
      high : int;
      low : int;
      mont : int)  -- /usr/include/openssl/bn.h:452
   with Import => True, 
        Convention => C, 
        External_Name => "BN_set_params";

  -- 0, mul, 1 high, 2 low, 3 mont  
   function BN_get_params (which : int) return int  -- /usr/include/openssl/bn.h:454
   with Import => True, 
        Convention => C, 
        External_Name => "BN_get_params";

   function BN_RECP_CTX_new return access openssl_types_h.bn_recp_ctx_st  -- /usr/include/openssl/bn.h:457
   with Import => True, 
        Convention => C, 
        External_Name => "BN_RECP_CTX_new";

   procedure BN_RECP_CTX_free (recp : access openssl_types_h.bn_recp_ctx_st)  -- /usr/include/openssl/bn.h:458
   with Import => True, 
        Convention => C, 
        External_Name => "BN_RECP_CTX_free";

   function BN_RECP_CTX_set
     (recp : access openssl_types_h.bn_recp_ctx_st;
      rdiv : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:459
   with Import => True, 
        Convention => C, 
        External_Name => "BN_RECP_CTX_set";

   function BN_mod_mul_reciprocal
     (r : access openssl_types_h.bignum_st;
      x : access constant openssl_types_h.bignum_st;
      y : access constant openssl_types_h.bignum_st;
      recp : access openssl_types_h.bn_recp_ctx_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:460
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mod_mul_reciprocal";

   function BN_mod_exp_recp
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      p : access constant openssl_types_h.bignum_st;
      m : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:462
   with Import => True, 
        Convention => C, 
        External_Name => "BN_mod_exp_recp";

   function BN_div_recp
     (dv : access openssl_types_h.bignum_st;
      c_rem : access openssl_types_h.bignum_st;
      m : access constant openssl_types_h.bignum_st;
      recp : access openssl_types_h.bn_recp_ctx_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:464
   with Import => True, 
        Convention => C, 
        External_Name => "BN_div_recp";

  -- * Functions for arithmetic over binary polynomials represented by BIGNUMs.
  -- * The BIGNUM::neg property of BIGNUMs representing binary polynomials is
  -- * ignored. Note that input arguments are not const so that their bit arrays
  -- * can be expanded to the appropriate size if needed.
  --  

  -- * r = a + b
  --  

   function BN_GF2m_add
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:479
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GF2m_add";

  -- * r=a mod p
  --  

   function BN_GF2m_mod
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      p : access constant openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:484
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GF2m_mod";

  -- r = (a * b) mod p  
   function BN_GF2m_mod_mul
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st;
      p : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:486
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GF2m_mod_mul";

  -- r = (a * a) mod p  
   function BN_GF2m_mod_sqr
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      p : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:489
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GF2m_mod_sqr";

  -- r = (1 / b) mod p  
   function BN_GF2m_mod_inv
     (r : access openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st;
      p : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:491
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GF2m_mod_inv";

  -- r = (a / b) mod p  
   function BN_GF2m_mod_div
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st;
      p : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:493
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GF2m_mod_div";

  -- r = (a ^ b) mod p  
   function BN_GF2m_mod_exp
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st;
      p : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:496
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GF2m_mod_exp";

  -- r = sqrt(a) mod p  
   function BN_GF2m_mod_sqrt
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      p : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:499
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GF2m_mod_sqrt";

  -- r^2 + r = a mod p  
   function BN_GF2m_mod_solve_quad
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      p : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:502
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GF2m_mod_solve_quad";

  ---
  -- * Some functions allow for representation of the irreducible polynomials
  -- * as an unsigned int[], say p.  The irreducible f(t) is then of the form:
  -- *     t^p[0] + t^p[1] + ... + t^p[k]
  -- * where m = p[0] > p[1] > ... > p[k] = 0.
  --  

  -- r = a mod p  
   function BN_GF2m_mod_arr
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      p : access int) return int  -- /usr/include/openssl/bn.h:512
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GF2m_mod_arr";

  -- r = (a * b) mod p  
   function BN_GF2m_mod_mul_arr
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st;
      p : access int;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:514
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GF2m_mod_mul_arr";

  -- r = (a * a) mod p  
   function BN_GF2m_mod_sqr_arr
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      p : access int;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:517
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GF2m_mod_sqr_arr";

  -- r = (1 / b) mod p  
   function BN_GF2m_mod_inv_arr
     (r : access openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st;
      p : access int;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:520
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GF2m_mod_inv_arr";

  -- r = (a / b) mod p  
   function BN_GF2m_mod_div_arr
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st;
      p : access int;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:523
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GF2m_mod_div_arr";

  -- r = (a ^ b) mod p  
   function BN_GF2m_mod_exp_arr
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      b : access constant openssl_types_h.bignum_st;
      p : access int;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:526
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GF2m_mod_exp_arr";

  -- r = sqrt(a) mod p  
   function BN_GF2m_mod_sqrt_arr
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      p : access int;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:529
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GF2m_mod_sqrt_arr";

  -- r^2 + r = a mod p  
   function BN_GF2m_mod_solve_quad_arr
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      p : access int;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:532
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GF2m_mod_solve_quad_arr";

   function BN_GF2m_poly2arr
     (a : access constant openssl_types_h.bignum_st;
      p : access int;
      max : int) return int  -- /usr/include/openssl/bn.h:534
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GF2m_poly2arr";

   function BN_GF2m_arr2poly (p : access int; a : access openssl_types_h.bignum_st) return int  -- /usr/include/openssl/bn.h:535
   with Import => True, 
        Convention => C, 
        External_Name => "BN_GF2m_arr2poly";

  -- * faster mod functions for the 'NIST primes' 0 <= a < p^2
  --  

   function BN_nist_mod_192
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      p : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:542
   with Import => True, 
        Convention => C, 
        External_Name => "BN_nist_mod_192";

   function BN_nist_mod_224
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      p : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:543
   with Import => True, 
        Convention => C, 
        External_Name => "BN_nist_mod_224";

   function BN_nist_mod_256
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      p : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:544
   with Import => True, 
        Convention => C, 
        External_Name => "BN_nist_mod_256";

   function BN_nist_mod_384
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      p : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:545
   with Import => True, 
        Convention => C, 
        External_Name => "BN_nist_mod_384";

   function BN_nist_mod_521
     (r : access openssl_types_h.bignum_st;
      a : access constant openssl_types_h.bignum_st;
      p : access constant openssl_types_h.bignum_st;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:546
   with Import => True, 
        Convention => C, 
        External_Name => "BN_nist_mod_521";

   function BN_get0_nist_prime_192 return access constant openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:548
   with Import => True, 
        Convention => C, 
        External_Name => "BN_get0_nist_prime_192";

   function BN_get0_nist_prime_224 return access constant openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:549
   with Import => True, 
        Convention => C, 
        External_Name => "BN_get0_nist_prime_224";

   function BN_get0_nist_prime_256 return access constant openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:550
   with Import => True, 
        Convention => C, 
        External_Name => "BN_get0_nist_prime_256";

   function BN_get0_nist_prime_384 return access constant openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:551
   with Import => True, 
        Convention => C, 
        External_Name => "BN_get0_nist_prime_384";

   function BN_get0_nist_prime_521 return access constant openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:552
   with Import => True, 
        Convention => C, 
        External_Name => "BN_get0_nist_prime_521";

   function BN_nist_mod_func (p : access constant openssl_types_h.bignum_st) return access function
        (arg1 : access openssl_types_h.bignum_st;
         arg2 : access constant openssl_types_h.bignum_st;
         arg3 : access constant openssl_types_h.bignum_st;
         arg4 : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:554
   with Import => True, 
        Convention => C, 
        External_Name => "BN_nist_mod_func";

   function BN_generate_dsa_nonce
     (c_out : access openssl_types_h.bignum_st;
      c_range : access constant openssl_types_h.bignum_st;
      priv : access constant openssl_types_h.bignum_st;
      message : access unsigned_char;
      message_len : stddef_h.size_t;
      ctx : access openssl_types_h.bignum_ctx) return int  -- /usr/include/openssl/bn.h:557
   with Import => True, 
        Convention => C, 
        External_Name => "BN_generate_dsa_nonce";

  -- Primes from RFC 2409  
   function BN_get_rfc2409_prime_768 (bn : access openssl_types_h.bignum_st) return access openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:562
   with Import => True, 
        Convention => C, 
        External_Name => "BN_get_rfc2409_prime_768";

   function BN_get_rfc2409_prime_1024 (bn : access openssl_types_h.bignum_st) return access openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:563
   with Import => True, 
        Convention => C, 
        External_Name => "BN_get_rfc2409_prime_1024";

  -- Primes from RFC 3526  
   function BN_get_rfc3526_prime_1536 (bn : access openssl_types_h.bignum_st) return access openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:566
   with Import => True, 
        Convention => C, 
        External_Name => "BN_get_rfc3526_prime_1536";

   function BN_get_rfc3526_prime_2048 (bn : access openssl_types_h.bignum_st) return access openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:567
   with Import => True, 
        Convention => C, 
        External_Name => "BN_get_rfc3526_prime_2048";

   function BN_get_rfc3526_prime_3072 (bn : access openssl_types_h.bignum_st) return access openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:568
   with Import => True, 
        Convention => C, 
        External_Name => "BN_get_rfc3526_prime_3072";

   function BN_get_rfc3526_prime_4096 (bn : access openssl_types_h.bignum_st) return access openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:569
   with Import => True, 
        Convention => C, 
        External_Name => "BN_get_rfc3526_prime_4096";

   function BN_get_rfc3526_prime_6144 (bn : access openssl_types_h.bignum_st) return access openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:570
   with Import => True, 
        Convention => C, 
        External_Name => "BN_get_rfc3526_prime_6144";

   function BN_get_rfc3526_prime_8192 (bn : access openssl_types_h.bignum_st) return access openssl_types_h.bignum_st  -- /usr/include/openssl/bn.h:571
   with Import => True, 
        Convention => C, 
        External_Name => "BN_get_rfc3526_prime_8192";

   function BN_bntest_rand
     (rnd : access openssl_types_h.bignum_st;
      bits : int;
      top : int;
      bottom : int) return int  -- /usr/include/openssl/bn.h:584
   with Import => True, 
        Convention => C, 
        External_Name => "BN_bntest_rand";

end openssl_bn_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
