pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with bits_types_h;
limited with bits_types_struct_sched_param_h;
limited with bits_types_struct_timespec_h;

package sched_h is

   --  unsupported macro: sched_priority sched_priority
  -- Definitions for POSIX 1003.1b-1993 (aka POSIX.4) scheduling interface.
  --   Copyright (C) 1996-2024 Free Software Foundation, Inc.
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

  -- Get type definitions.   
  -- Get system specific constant and data structure definitions.   
  -- Backward compatibility.   
  -- Set scheduling parameters for a process.   
   function sched_setparam (uu_pid : bits_types_h.uu_pid_t; uu_param : access constant bits_types_struct_sched_param_h.sched_param) return int  -- /usr/include/sched.h:54
   with Import => True, 
        Convention => C, 
        External_Name => "sched_setparam";

  -- Retrieve scheduling parameters for a particular process.   
   function sched_getparam (uu_pid : bits_types_h.uu_pid_t; uu_param : access bits_types_struct_sched_param_h.sched_param) return int  -- /usr/include/sched.h:58
   with Import => True, 
        Convention => C, 
        External_Name => "sched_getparam";

  -- Set scheduling algorithm and/or parameters for a process.   
   function sched_setscheduler
     (uu_pid : bits_types_h.uu_pid_t;
      uu_policy : int;
      uu_param : access constant bits_types_struct_sched_param_h.sched_param) return int  -- /usr/include/sched.h:61
   with Import => True, 
        Convention => C, 
        External_Name => "sched_setscheduler";

  -- Retrieve scheduling algorithm for a particular purpose.   
   function sched_getscheduler (uu_pid : bits_types_h.uu_pid_t) return int  -- /usr/include/sched.h:65
   with Import => True, 
        Convention => C, 
        External_Name => "sched_getscheduler";

  -- Yield the processor.   
   function sched_yield return int  -- /usr/include/sched.h:68
   with Import => True, 
        Convention => C, 
        External_Name => "sched_yield";

  -- Get maximum priority value for a scheduler.   
   function sched_get_priority_max (uu_algorithm : int) return int  -- /usr/include/sched.h:71
   with Import => True, 
        Convention => C, 
        External_Name => "sched_get_priority_max";

  -- Get minimum priority value for a scheduler.   
   function sched_get_priority_min (uu_algorithm : int) return int  -- /usr/include/sched.h:74
   with Import => True, 
        Convention => C, 
        External_Name => "sched_get_priority_min";

  -- Get the SCHED_RR interval for the named process.   
   function sched_rr_get_interval (uu_pid : bits_types_h.uu_pid_t; uu_t : access bits_types_struct_timespec_h.timespec) return int  -- /usr/include/sched.h:78
   with Import => True, 
        Convention => C, 
        External_Name => "sched_rr_get_interval";

  -- Access macros for `cpu_set'.   
  -- Set the CPU affinity for a task  
  -- Get the CPU affinity for a task  
end sched_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
