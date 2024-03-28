pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with bits_types_h;
with bits_types_u_fpos_t_h;
limited with bits_types_struct_FILE_h;
with Interfaces.C.Strings;
with System;
with bits_types_cookie_io_functions_t_h;
with stddef_h;

package stdio_h is

   BUFSIZ : constant := 8192;  --  /usr/include/stdio.h:100

   EOF : constant := (-1);  --  /usr/include/stdio.h:105

   SEEK_SET : constant := 0;  --  /usr/include/stdio.h:110
   SEEK_CUR : constant := 1;  --  /usr/include/stdio.h:111
   SEEK_END : constant := 2;  --  /usr/include/stdio.h:112

   P_tmpdir : aliased constant String := "/tmp" & ASCII.NUL;  --  /usr/include/stdio.h:121

   L_tmpnam : constant := 20;  --  /usr/include/stdio.h:124
   TMP_MAX : constant := 238328;  --  /usr/include/stdio.h:125

   L_ctermid : constant := 9;  --  /usr/include/stdio.h:132

   FOPEN_MAX : constant := 16;  --  /usr/include/stdio.h:139
   --  unsupported macro: stdin stdin
   --  unsupported macro: stdout stdout
   --  unsupported macro: stderr stderr

  -- Define ISO C stdio on top of C++ iostreams.
  --   Copyright (C) 1991-2024 Free Software Foundation, Inc.
  --   Copyright The GNU Toolchain Authors.
  --   This file is part of the GNU C Library.
  --   The GNU C Library is free software; you can redistribute it and/or
  --   modify it under the terms of the GNU Lesser General Public
  --   License as published by the Free Software Foundation; either
  --   version 2.1 of the License, or (at your option) any later version.
  --   The GNU C Library is distributed in the hope that it will be useful,
  --   but WITHOUT ANY WARRANTY; without even the implied warranty of
  --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  --   Lesser General Public License for more details.
  --   You should have received a copy of the GNU Lesser General Public
  --   License along with the GNU C Library; if not, see
  --   <https://www.gnu.org/licenses/>.   

  -- *	ISO C99 Standard: 7.19 Input/output	<stdio.h>
  --  

   subtype off_t is bits_types_h.uu_off_t;  -- /usr/include/stdio.h:64

   subtype ssize_t is bits_types_h.uu_ssize_t;  -- /usr/include/stdio.h:78

  -- The type of the second argument to `fgetpos' and `fsetpos'.   
   subtype fpos_t is bits_types_u_fpos_t_h.uu_fpos_t;  -- /usr/include/stdio.h:85

  -- The possibilities for the third argument to `setvbuf'.   
  -- Default buffer size.   
  -- The value returned by fgetc and similar functions to indicate the
  --   end of the file.   

  -- The possibilities for the third argument to `fseek'.
  --   These values should not be changed.   

  -- Default path prefix for `tempnam' and `tmpnam'.   
  -- Get the values:
  --   FILENAME_MAX	Maximum length of a filename.   

  -- Maximum length of printf output for a NaN.   
  -- Standard streams.   
  -- Standard input stream.   
   stdin : access bits_types_struct_FILE_h.u_IO_FILE  -- /usr/include/stdio.h:149
   with Import => True, 
        Convention => C, 
        External_Name => "stdin";

  -- Standard output stream.   
   stdout : access bits_types_struct_FILE_h.u_IO_FILE  -- /usr/include/stdio.h:150
   with Import => True, 
        Convention => C, 
        External_Name => "stdout";

  -- Standard error output stream.   
   stderr : access bits_types_struct_FILE_h.u_IO_FILE  -- /usr/include/stdio.h:151
   with Import => True, 
        Convention => C, 
        External_Name => "stderr";

  -- C89/C99 say they're macros.  Make them happy.   
  -- Remove file FILENAME.   
   function remove (uu_filename : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/stdio.h:158
   with Import => True, 
        Convention => C, 
        External_Name => "remove";

  -- Rename file OLD to NEW.   
   function rename (uu_old : Interfaces.C.Strings.chars_ptr; uu_new : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/stdio.h:160
   with Import => True, 
        Convention => C, 
        External_Name => "rename";

  -- Rename file OLD relative to OLDFD to NEW relative to NEWFD.   
   function renameat
     (uu_oldfd : int;
      uu_old : Interfaces.C.Strings.chars_ptr;
      uu_newfd : int;
      uu_new : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/stdio.h:164
   with Import => True, 
        Convention => C, 
        External_Name => "renameat";

  -- Flags for renameat2.   
  -- Rename file OLD relative to OLDFD to NEW relative to NEWFD, with
  --   additional flags.   

  -- Close STREAM.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function fclose (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return int  -- /usr/include/stdio.h:184
   with Import => True, 
        Convention => C, 
        External_Name => "fclose";

  -- Create a temporary file and open it read/write.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function tmpfile return access bits_types_struct_FILE_h.u_IO_FILE  -- /usr/include/stdio.h:194
   with Import => True, 
        Convention => C, 
        External_Name => "tmpfile";

  -- Generate a temporary filename.   
   function tmpnam (arg1 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/include/stdio.h:211
   with Import => True, 
        Convention => C, 
        External_Name => "tmpnam";

  -- This is the reentrant variant of `tmpnam'.  The only difference is
  --   that it does not allow S to be NULL.   

   function tmpnam_r (uu_s : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/include/stdio.h:216
   with Import => True, 
        Convention => C, 
        External_Name => "tmpnam_r";

  -- Generate a unique temporary filename using up to five characters of PFX
  --   if it is not NULL.  The directory to put this file in is searched for
  --   as follows: First the environment variable "TMPDIR" is checked.
  --   If it contains the name of a writable directory, that directory is used.
  --   If not and if DIR is not NULL, that value is checked.  If that fails,
  --   P_tmpdir is tried and finally "/tmp".  The storage for the filename
  --   is allocated by `malloc'.   

   function tempnam (uu_dir : Interfaces.C.Strings.chars_ptr; uu_pfx : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/include/stdio.h:228
   with Import => True, 
        Convention => C, 
        External_Name => "tempnam";

  -- Flush STREAM, or all streams if STREAM is NULL.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function fflush (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return int  -- /usr/include/stdio.h:236
   with Import => True, 
        Convention => C, 
        External_Name => "fflush";

  -- Faster versions when locking is not required.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function fflush_unlocked (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return int  -- /usr/include/stdio.h:245
   with Import => True, 
        Convention => C, 
        External_Name => "fflush_unlocked";

  -- Close all streams.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

  -- Open a file and create a new stream for it.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function fopen (uu_filename : Interfaces.C.Strings.chars_ptr; uu_modes : Interfaces.C.Strings.chars_ptr) return access bits_types_struct_FILE_h.u_IO_FILE  -- /usr/include/stdio.h:264
   with Import => True, 
        Convention => C, 
        External_Name => "fopen";

  -- Open a file, replacing an existing stream with it.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function freopen
     (uu_filename : Interfaces.C.Strings.chars_ptr;
      uu_modes : Interfaces.C.Strings.chars_ptr;
      uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return access bits_types_struct_FILE_h.u_IO_FILE  -- /usr/include/stdio.h:271
   with Import => True, 
        Convention => C, 
        External_Name => "freopen";

  -- Create a new stream that refers to an existing system file descriptor.   
   function fdopen (uu_fd : int; uu_modes : Interfaces.C.Strings.chars_ptr) return access bits_types_struct_FILE_h.u_IO_FILE  -- /usr/include/stdio.h:299
   with Import => True, 
        Convention => C, 
        External_Name => "fdopen";

  -- Create a new stream that refers to the given magic cookie,
  --   and uses the given functions for input and output.   

   function fopencookie
     (uu_magic_cookie : System.Address;
      uu_modes : Interfaces.C.Strings.chars_ptr;
      uu_io_funcs : bits_types_cookie_io_functions_t_h.cookie_io_functions_t) return access bits_types_struct_FILE_h.u_IO_FILE  -- /usr/include/stdio.h:306
   with Import => True, 
        Convention => C, 
        External_Name => "fopencookie";

  -- Create a new stream that refers to a memory buffer.   
   function fmemopen
     (uu_s : System.Address;
      uu_len : stddef_h.size_t;
      uu_modes : Interfaces.C.Strings.chars_ptr) return access bits_types_struct_FILE_h.u_IO_FILE  -- /usr/include/stdio.h:314
   with Import => True, 
        Convention => C, 
        External_Name => "fmemopen";

  -- Open a stream that writes into a malloc'd buffer that is expanded as
  --   necessary.  *BUFLOC and *SIZELOC are updated with the buffer's location
  --   and the number of characters written on fflush or fclose.   

   function open_memstream (uu_bufloc : System.Address; uu_sizeloc : access stddef_h.size_t) return access bits_types_struct_FILE_h.u_IO_FILE  -- /usr/include/stdio.h:320
   with Import => True, 
        Convention => C, 
        External_Name => "open_memstream";

  -- Like OPEN_MEMSTREAM, but the stream is wide oriented and produces
  --   a wide character string.  Declared here only to add attribute malloc
  --   and only if <wchar.h> has been previously #included.   

  -- If BUF is NULL, make STREAM unbuffered.
  --   Else make it use buffer BUF, of size BUFSIZ.   

   procedure setbuf (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE; uu_buf : Interfaces.C.Strings.chars_ptr)  -- /usr/include/stdio.h:334
   with Import => True, 
        Convention => C, 
        External_Name => "setbuf";

  -- Make STREAM use buffering mode MODE.
  --   If BUF is not NULL, use N bytes of it for buffering;
  --   else allocate an internal buffer N bytes long.   

   function setvbuf
     (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_modes : int;
      uu_n : stddef_h.size_t) return int  -- /usr/include/stdio.h:339
   with Import => True, 
        Convention => C, 
        External_Name => "setvbuf";

  -- If BUF is NULL, make STREAM unbuffered.
  --   Else make it use SIZE bytes of BUF for buffering.   

   procedure setbuffer
     (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_size : stddef_h.size_t)  -- /usr/include/stdio.h:345
   with Import => True, 
        Convention => C, 
        External_Name => "setbuffer";

  -- Make STREAM line-buffered.   
   procedure setlinebuf (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE)  -- /usr/include/stdio.h:349
   with Import => True, 
        Convention => C, 
        External_Name => "setlinebuf";

  -- Write formatted output to STREAM.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function fprintf (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE; uu_format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- /usr/include/stdio.h:357
   with Import => True, 
        Convention => C, 
        External_Name => "fprintf";

  -- Write formatted output to stdout.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function printf (uu_format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- /usr/include/stdio.h:363
   with Import => True, 
        Convention => C, 
        External_Name => "printf";

  -- Write formatted output to S.   
   function sprintf (uu_s : Interfaces.C.Strings.chars_ptr; uu_format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- /usr/include/stdio.h:365
   with Import => True, 
        Convention => C, 
        External_Name => "sprintf";

  -- Write formatted output to S from argument list ARG.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function vfprintf
     (uu_s : access bits_types_struct_FILE_h.u_IO_FILE;
      uu_format : Interfaces.C.Strings.chars_ptr;
      uu_arg : access System.Address) return int  -- /usr/include/stdio.h:372
   with Import => True, 
        Convention => C, 
        External_Name => "vfprintf";

  -- Write formatted output to stdout from argument list ARG.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function vprintf (uu_format : Interfaces.C.Strings.chars_ptr; uu_arg : access System.Address) return int  -- /usr/include/stdio.h:378
   with Import => True, 
        Convention => C, 
        External_Name => "vprintf";

  -- Write formatted output to S from argument list ARG.   
   function vsprintf
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_format : Interfaces.C.Strings.chars_ptr;
      uu_arg : access System.Address) return int  -- /usr/include/stdio.h:380
   with Import => True, 
        Convention => C, 
        External_Name => "vsprintf";

  -- Maximum chars of output to write in MAXLEN.   
   function snprintf
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_maxlen : stddef_h.size_t;
      uu_format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- /usr/include/stdio.h:385
   with Import => True, 
        Convention => C, 
        External_Name => "snprintf";

   function vsnprintf
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_maxlen : stddef_h.size_t;
      uu_format : Interfaces.C.Strings.chars_ptr;
      uu_arg : access System.Address) return int  -- /usr/include/stdio.h:389
   with Import => True, 
        Convention => C, 
        External_Name => "vsnprintf";

  -- Write formatted output to a string dynamically allocated with `malloc'.
  --   Store the address of the string in *PTR.   

   function vasprintf
     (uu_ptr : System.Address;
      uu_f : Interfaces.C.Strings.chars_ptr;
      uu_arg : access System.Address) return int  -- /usr/include/stdio.h:397
   with Import => True, 
        Convention => C, 
        External_Name => "vasprintf";

   --  skipped func __asprintf

   function asprintf (uu_ptr : System.Address; uu_fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- /usr/include/stdio.h:403
   with Import => True, 
        Convention => C, 
        External_Name => "asprintf";

  -- Write formatted output to a file descriptor.   
   function vdprintf
     (uu_fd : int;
      uu_fmt : Interfaces.C.Strings.chars_ptr;
      uu_arg : access System.Address) return int  -- /usr/include/stdio.h:410
   with Import => True, 
        Convention => C, 
        External_Name => "vdprintf";

   function dprintf (uu_fd : int; uu_fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- /usr/include/stdio.h:413
   with Import => True, 
        Convention => C, 
        External_Name => "dprintf";

  -- Read formatted input from STREAM.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

  -- Read formatted input from stdin.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

  -- Read formatted input from S.   
  -- For historical reasons, the C99-compliant versions of the scanf
  --   functions are at alternative names.  When __LDBL_COMPAT or
  --   __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI are in effect, this is handled in
  --   bits/stdio-ldbl.h.   

   function fscanf (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE; uu_format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- /usr/include/stdio.h:463
   with Import => True, 
        Convention => C, 
        External_Name => "__isoc99_fscanf";

   function scanf (uu_format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- /usr/include/stdio.h:466
   with Import => True, 
        Convention => C, 
        External_Name => "__isoc99_scanf";

   function sscanf (uu_s : Interfaces.C.Strings.chars_ptr; uu_format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- /usr/include/stdio.h:468
   with Import => True, 
        Convention => C, 
        External_Name => "__isoc99_sscanf";

  -- Read formatted input from S into argument list ARG.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

  -- Read formatted input from stdin into argument list ARG.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

  -- Read formatted input from S into argument list ARG.   
  -- Same redirection as above for the v*scanf family.   
   function vfscanf
     (uu_s : access bits_types_struct_FILE_h.u_IO_FILE;
      uu_format : Interfaces.C.Strings.chars_ptr;
      uu_arg : access System.Address) return int  -- /usr/include/stdio.h:540
   with Import => True, 
        Convention => C, 
        External_Name => "__isoc99_vfscanf";

   function vscanf (uu_format : Interfaces.C.Strings.chars_ptr; uu_arg : access System.Address) return int  -- /usr/include/stdio.h:545
   with Import => True, 
        Convention => C, 
        External_Name => "__isoc99_vscanf";

   function vsscanf
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_format : Interfaces.C.Strings.chars_ptr;
      uu_arg : access System.Address) return int  -- /usr/include/stdio.h:548
   with Import => True, 
        Convention => C, 
        External_Name => "__isoc99_vsscanf";

  -- Read a character from STREAM.
  --   These functions are possible cancellation points and therefore not
  --   marked with __THROW.   

   function fgetc (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return int  -- /usr/include/stdio.h:575
   with Import => True, 
        Convention => C, 
        External_Name => "fgetc";

   function getc (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return int  -- /usr/include/stdio.h:576
   with Import => True, 
        Convention => C, 
        External_Name => "getc";

  -- Read a character from stdin.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getchar return int  -- /usr/include/stdio.h:582
   with Import => True, 
        Convention => C, 
        External_Name => "getchar";

  -- These are defined in POSIX.1:1996.
  --   These functions are possible cancellation points and therefore not
  --   marked with __THROW.   

   function getc_unlocked (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return int  -- /usr/include/stdio.h:589
   with Import => True, 
        Convention => C, 
        External_Name => "getc_unlocked";

   function getchar_unlocked return int  -- /usr/include/stdio.h:590
   with Import => True, 
        Convention => C, 
        External_Name => "getchar_unlocked";

  -- Faster version when locking is not necessary.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function fgetc_unlocked (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return int  -- /usr/include/stdio.h:600
   with Import => True, 
        Convention => C, 
        External_Name => "fgetc_unlocked";

  -- Write a character to STREAM.
  --   These functions are possible cancellation points and therefore not
  --   marked with __THROW.
  --   These functions is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function fputc (uu_c : int; uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return int  -- /usr/include/stdio.h:611
   with Import => True, 
        Convention => C, 
        External_Name => "fputc";

   function putc (uu_c : int; uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return int  -- /usr/include/stdio.h:612
   with Import => True, 
        Convention => C, 
        External_Name => "putc";

  -- Write a character to stdout.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function putchar (uu_c : int) return int  -- /usr/include/stdio.h:618
   with Import => True, 
        Convention => C, 
        External_Name => "putchar";

  -- Faster version when locking is not necessary.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function fputc_unlocked (uu_c : int; uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return int  -- /usr/include/stdio.h:627
   with Import => True, 
        Convention => C, 
        External_Name => "fputc_unlocked";

  -- These are defined in POSIX.1:1996.
  --   These functions are possible cancellation points and therefore not
  --   marked with __THROW.   

   function putc_unlocked (uu_c : int; uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return int  -- /usr/include/stdio.h:635
   with Import => True, 
        Convention => C, 
        External_Name => "putc_unlocked";

   function putchar_unlocked (uu_c : int) return int  -- /usr/include/stdio.h:636
   with Import => True, 
        Convention => C, 
        External_Name => "putchar_unlocked";

  -- Get a word (int) from STREAM.   
   function getw (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return int  -- /usr/include/stdio.h:643
   with Import => True, 
        Convention => C, 
        External_Name => "getw";

  -- Write a word (int) to STREAM.   
   function putw (uu_w : int; uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return int  -- /usr/include/stdio.h:646
   with Import => True, 
        Convention => C, 
        External_Name => "putw";

  -- Get a newline-terminated string of finite length from STREAM.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function fgets
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_n : int;
      uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return Interfaces.C.Strings.chars_ptr  -- /usr/include/stdio.h:654
   with Import => True, 
        Convention => C, 
        External_Name => "fgets";

  -- Get a newline-terminated string from stdin, removing the newline.
  --   This function is impossible to use safely.  It has been officially
  --   removed from ISO C11 and ISO C++14, and we have also removed it
  --   from the _GNU_SOURCE feature list.  It remains available when
  --   explicitly using an old ISO C, Unix, or POSIX standard.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

  -- This function does the same as `fgets' but does not lock the stream.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

  -- Read up to (and including) a DELIMITER from STREAM into *LINEPTR
  --   (and null-terminate it). *LINEPTR is a pointer returned from malloc (or
  --   NULL), pointing to *N characters of space.  It is realloc'd as
  --   necessary.  Returns the number of characters read (not including the
  --   null terminator), or -1 on error or EOF.
  --   These functions are not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation they are cancellation points and
  --   therefore not marked with __THROW.   

   --  skipped func __getdelim

   function getdelim
     (uu_lineptr : System.Address;
      uu_n : access stddef_h.size_t;
      uu_delimiter : int;
      uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return bits_types_h.uu_ssize_t  -- /usr/include/stdio.h:697
   with Import => True, 
        Convention => C, 
        External_Name => "getdelim";

  -- Like `getdelim', but reads up to a newline.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function getline
     (uu_lineptr : System.Address;
      uu_n : access stddef_h.size_t;
      uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return bits_types_h.uu_ssize_t  -- /usr/include/stdio.h:707
   with Import => True, 
        Convention => C, 
        External_Name => "getline";

  -- Write a string to STREAM.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function fputs (uu_s : Interfaces.C.Strings.chars_ptr; uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return int  -- /usr/include/stdio.h:717
   with Import => True, 
        Convention => C, 
        External_Name => "fputs";

  -- Write a string, followed by a newline, to stdout.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function puts (uu_s : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/stdio.h:724
   with Import => True, 
        Convention => C, 
        External_Name => "puts";

  -- Push a character back onto the input buffer of STREAM.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function ungetc (uu_c : int; uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return int  -- /usr/include/stdio.h:731
   with Import => True, 
        Convention => C, 
        External_Name => "ungetc";

  -- Read chunks of generic data from STREAM.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function fread
     (uu_ptr : System.Address;
      uu_size : stddef_h.size_t;
      uu_n : stddef_h.size_t;
      uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return stddef_h.size_t  -- /usr/include/stdio.h:738
   with Import => True, 
        Convention => C, 
        External_Name => "fread";

  -- Write chunks of generic data to STREAM.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function fwrite
     (uu_ptr : System.Address;
      uu_size : stddef_h.size_t;
      uu_n : stddef_h.size_t;
      uu_s : access bits_types_struct_FILE_h.u_IO_FILE) return stddef_h.size_t  -- /usr/include/stdio.h:745
   with Import => True, 
        Convention => C, 
        External_Name => "fwrite";

  -- This function does the same as `fputs' but does not lock the stream.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

  -- Faster versions when locking is not necessary.
  --   These functions are not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation they are cancellation points and
  --   therefore not marked with __THROW.   

   function fread_unlocked
     (uu_ptr : System.Address;
      uu_size : stddef_h.size_t;
      uu_n : stddef_h.size_t;
      uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return stddef_h.size_t  -- /usr/include/stdio.h:766
   with Import => True, 
        Convention => C, 
        External_Name => "fread_unlocked";

   function fwrite_unlocked
     (uu_ptr : System.Address;
      uu_size : stddef_h.size_t;
      uu_n : stddef_h.size_t;
      uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return stddef_h.size_t  -- /usr/include/stdio.h:769
   with Import => True, 
        Convention => C, 
        External_Name => "fwrite_unlocked";

  -- Seek to a certain position on STREAM.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function fseek
     (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE;
      uu_off : long;
      uu_whence : int) return int  -- /usr/include/stdio.h:779
   with Import => True, 
        Convention => C, 
        External_Name => "fseek";

  -- Return the current position of STREAM.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function ftell (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return long  -- /usr/include/stdio.h:785
   with Import => True, 
        Convention => C, 
        External_Name => "ftell";

  -- Rewind to the beginning of STREAM.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   procedure rewind (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE)  -- /usr/include/stdio.h:790
   with Import => True, 
        Convention => C, 
        External_Name => "rewind";

  -- The Single Unix Specification, Version 2, specifies an alternative,
  --   more adequate interface for the two functions above which deal with
  --   file offset.  `long int' is not the right type.  These definitions
  --   are originally defined in the Large File Support API.   

  -- Seek to a certain position on STREAM.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function fseeko
     (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE;
      uu_off : bits_types_h.uu_off_t;
      uu_whence : int) return int  -- /usr/include/stdio.h:803
   with Import => True, 
        Convention => C, 
        External_Name => "fseeko";

  -- Return the current position of STREAM.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function ftello (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return bits_types_h.uu_off_t  -- /usr/include/stdio.h:809
   with Import => True, 
        Convention => C, 
        External_Name => "ftello";

  -- Get STREAM's position.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function fgetpos (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE; uu_pos : access fpos_t) return int  -- /usr/include/stdio.h:829
   with Import => True, 
        Convention => C, 
        External_Name => "fgetpos";

  -- Set STREAM's position.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function fsetpos (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE; uu_pos : access constant fpos_t) return int  -- /usr/include/stdio.h:835
   with Import => True, 
        Convention => C, 
        External_Name => "fsetpos";

  -- Clear the error and EOF indicators for STREAM.   
   procedure clearerr (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE)  -- /usr/include/stdio.h:860
   with Import => True, 
        Convention => C, 
        External_Name => "clearerr";

  -- Return the EOF indicator for STREAM.   
   function feof (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return int  -- /usr/include/stdio.h:862
   with Import => True, 
        Convention => C, 
        External_Name => "feof";

  -- Return the error indicator for STREAM.   
   function ferror (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return int  -- /usr/include/stdio.h:864
   with Import => True, 
        Convention => C, 
        External_Name => "ferror";

  -- Faster versions when locking is not required.   
   procedure clearerr_unlocked (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE)  -- /usr/include/stdio.h:868
   with Import => True, 
        Convention => C, 
        External_Name => "clearerr_unlocked";

   function feof_unlocked (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return int  -- /usr/include/stdio.h:869
   with Import => True, 
        Convention => C, 
        External_Name => "feof_unlocked";

   function ferror_unlocked (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return int  -- /usr/include/stdio.h:870
   with Import => True, 
        Convention => C, 
        External_Name => "ferror_unlocked";

  -- Print a message describing the meaning of the value of errno.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   procedure perror (uu_s : Interfaces.C.Strings.chars_ptr)  -- /usr/include/stdio.h:878
   with Import => True, 
        Convention => C, 
        External_Name => "perror";

  -- Return the system file descriptor for STREAM.   
   function fileno (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return int  -- /usr/include/stdio.h:883
   with Import => True, 
        Convention => C, 
        External_Name => "fileno";

  -- Faster version when locking is not required.   
   function fileno_unlocked (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return int  -- /usr/include/stdio.h:888
   with Import => True, 
        Convention => C, 
        External_Name => "fileno_unlocked";

  -- Close a stream opened by popen and return the status of its child.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function pclose (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return int  -- /usr/include/stdio.h:897
   with Import => True, 
        Convention => C, 
        External_Name => "pclose";

  -- Create a new stream connected to a pipe running the given command.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function popen (uu_command : Interfaces.C.Strings.chars_ptr; uu_modes : Interfaces.C.Strings.chars_ptr) return access bits_types_struct_FILE_h.u_IO_FILE  -- /usr/include/stdio.h:903
   with Import => True, 
        Convention => C, 
        External_Name => "popen";

  -- Return the name of the controlling terminal.   
   function ctermid (uu_s : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/include/stdio.h:911
   with Import => True, 
        Convention => C, 
        External_Name => "ctermid";

  -- Return the name of the current user.   
  -- See <obstack.h>.   
  -- Write formatted output to an obstack.   
  -- These are defined in POSIX.1:1996.   
  -- Acquire ownership of STREAM.   
   procedure flockfile (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE)  -- /usr/include/stdio.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "flockfile";

  -- Try to acquire ownership of STREAM but do not block if it is not
  --   possible.   

   function ftrylockfile (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE) return int  -- /usr/include/stdio.h:945
   with Import => True, 
        Convention => C, 
        External_Name => "ftrylockfile";

  -- Relinquish the ownership granted for STREAM.   
   procedure funlockfile (uu_stream : access bits_types_struct_FILE_h.u_IO_FILE)  -- /usr/include/stdio.h:948
   with Import => True, 
        Convention => C, 
        External_Name => "funlockfile";

  --  X/Open Issues 1-5 required getopt to be declared in this
  --   header.  It was removed in Issue 6.  GNU follows Issue 6.   

  -- Slow-path routines used by the optimized inline functions in
  --   bits/stdio.h.   

   --  skipped func __uflow

   --  skipped func __overflow

  -- Declare all functions from bits/stdio2-decl.h first.   
  -- The following headers provide asm redirections.  These redirections must
  --   appear before the first usage of these functions, e.g. in bits/stdio.h.   

  -- If we are compiling with optimizing read this file.  It contains
  --   several optimizing inline functions and macros.   

  -- Now include the function definitions and redirects too.   
end stdio_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
