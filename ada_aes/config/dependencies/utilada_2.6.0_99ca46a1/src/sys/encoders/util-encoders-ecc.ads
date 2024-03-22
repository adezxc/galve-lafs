-----------------------------------------------------------------------
--  util-encoders-ecc -- Error Correction Code
--  Copyright (C) 2019, 2022 Stephane Carrez
--  Written by Stephane Carrez (Stephane.Carrez@gmail.com)
--
--  Licensed under the Apache License, Version 2.0 (the "License");
--  you may not use this file except in compliance with the License.
--  You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
--  Unless required by applicable law or agreed to in writing, software
--  distributed under the License is distributed on an "AS IS" BASIS,
--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--  See the License for the specific language governing permissions and
--  limitations under the License.
-----------------------------------------------------------------------

--  == Error Correction Code ==
--  The `Util.Encoders.ECC` package provides operations to support error correction codes.
--  The error correction works on blocks of 256 or 512 bytes and can detect 2-bit errors
--  and correct 1-bit error.  The ECC uses only three additional bytes.
--  The ECC algorithm implemented by this package is implemented by several NAND Flash
--  memory.  It can be used to increase the robustness of data to bit-tempering when
--  the data is restored from an external storage (note that if the external storage has
--  its own ECC correction, adding another software ECC correction will probably not help).
--
--  The ECC code is generated by using the `Make` procedure that gets a block of 256 or
--  512 bytes and produces the 3 bytes ECC code.  The ECC code must be saved together with
--  the data block.
--
--    Code : Util.Encoders.ECC.ECC_Code;
--    ...
--    Util.Encoders.ECC.Make (Data, Code);
--
--  When reading the data block, you can verify and correct it by running again the
--  `Make` procedure on the data block and then compare the current ECC code with the
--  expected ECC code produced by the first call.  The `Correct` function is then called
--  with the data block, the expected ECC code that was saved with the data block and
--  the computed ECC code.
--
--    New_Code : Util.Encoders.ECC.ECC_Code;
--    ...
--    Util.Encoders.ECC.Make (Data, New_Code);
--    case Util.Encoders.ECC.Correct (Data, Expect_Code, New_Code) is
--       when NO_ERROR | CORRECTABLE_ERROR => ...
--       when others => ...
--    end case;
package Util.Encoders.ECC is

   type ECC_Result is (NO_ERROR, CORRECTABLE_ERROR, UNCORRECTABLE_ERROR, ECC_ERROR);

   subtype ECC_Code is Ada.Streams.Stream_Element_Array (0 .. 2);

   --  Make the 3 bytes ECC code that corresponds to the data array.
   procedure Make (Data : in Ada.Streams.Stream_Element_Array;
                   Code : out ECC_Code) with
     Pre => Data'Length in 256 | 512;

   --  Check and correct the data array according to the expected ECC codes and current codes.
   --  At most one bit can be fixed and two error bits can be detected.
   function Correct (Data         : in out Ada.Streams.Stream_Element_Array;
                     Expect_Code  : in ECC_Code;
                     Current_Code : in ECC_Code) return ECC_Result with
     Pre => Data'Length in 256 | 512;

   --  Check and correct the data array according to the expected ECC codes and current codes.
   --  At most one bit can be fixed and two error bits can be detected.
   function Correct (Data        : in out Ada.Streams.Stream_Element_Array;
                     Expect_Code : in ECC_Code) return ECC_Result with
     Pre => Data'Length in 256 | 512;

end Util.Encoders.ECC;