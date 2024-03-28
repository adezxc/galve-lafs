pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with stdint_h;

package openssl_e_os2_h is

   --  unsupported macro: OPENSSL_EXPORT extern
   --  unsupported macro: OPENSSL_EXTERN extern
   --  unsupported macro: ossl_ssize_t ssize_t
   --  unsupported macro: OSSL_SSIZE_MAX SSIZE_MAX
   --  unsupported macro: ossl_inline inline
   --  unsupported macro: ossl_noreturn _Noreturn
   --  unsupported macro: ossl_unused __attribute__((unused))
  -- * Copyright 1995-2023 The OpenSSL Project Authors. All Rights Reserved.
  -- *
  -- * Licensed under the Apache License 2.0 (the "License").  You may not use
  -- * this file except in compliance with the License.  You can obtain a copy
  -- * in the file LICENSE in the source distribution or at
  -- * https://www.openssl.org/source/license.html
  --  

  --*****************************************************************************
  -- * Detect operating systems.  This probably needs completing.
  -- * The result is that at least one OPENSSL_SYS_os macro should be defined.
  -- * However, if none is defined, Unix is assumed.
  -- * 

  -- --------------------- Microsoft operating systems ----------------------  
  -- * Note that MSDOS actually denotes 32-bit environments running on top of
  -- * MS-DOS, such as DJGPP one.
  --  

  -- * For 32 bit environment, there seems to be the CygWin environment and then
  -- * all the others that try to do the same thing Microsoft does...
  --  

  -- * UEFI lives here because it might be built with a Microsoft toolchain and
  -- * we need to avoid the false positive match on Windows.
  --  

  -- Anything that tries to look like Microsoft is "Windows"  
  -- * DLL settings.  This part is a bit tough, because it's up to the
  -- * application implementer how he or she will link the application, so it
  -- * requires some macro to be used.
  --  

  -- ------------------------------- OpenVMS --------------------------------  
  -- -------------------------------- Unix ----------------------------------  
  -- -------------------------------- VOS -----------------------------------  
  -- ---------------------------- HP NonStop --------------------------------  
  --*
  -- * That's it for OS-specific stuff
  -- **************************************************************************** 

  ---
  -- * OPENSSL_EXTERN is normally used to declare a symbol with possible extra
  -- * attributes to handle its presence in a shared library.
  -- * OPENSSL_EXPORT is used to define a symbol with extra possible attributes
  -- * to make it visible in a shared library.
  -- * Care needs to be taken when a header file is used both to declare and
  -- * define symbols.  Basically, for any library that exports some global
  -- * variables, the following code must be present in the header file that
  -- * declares them, before OPENSSL_EXTERN is used:
  -- *
  -- * #ifdef SOME_BUILD_FLAG_MACRO
  -- * # undef OPENSSL_EXTERN
  -- * # define OPENSSL_EXTERN OPENSSL_EXPORT
  -- * #endif
  -- *
  -- * The default is to have OPENSSL_EXPORT and OPENSSL_EXTERN
  -- * have some generally sensible values.
  --  

  -- Standard integer types  
  -- Because the specs say that inttypes.h includes stdint.h if present  
  -- * minimally required typdefs for systems not supporting inttypes.h or
  -- * stdint.h: currently just older VC++
  --  

   subtype ossl_intmax_t is stdint_h.intmax_t;  -- /usr/include/openssl/e_os2.h:260

   subtype ossl_uintmax_t is stdint_h.uintmax_t;  -- /usr/include/openssl/e_os2.h:261

  -- Fall back to the largest we know we require and can handle  
  -- ossl_inline: portable inline definition usable in public headers  
  -- just use inline  
  --   * Visual Studio: inline is available in C++ only, however
  --   * __inline is available for C, see
  --   * http://msdn.microsoft.com/en-us/library/z8y1yy88.aspx
  --    

  -- ossl_unused: portable unused attribute for use in public headers  
end openssl_e_os2_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
