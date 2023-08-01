pragma Ada_2022;
with Ada.Text_IO; use Ada.Text_IO;

package body Uint_Types with
  SPARK_Mode
is
   ---------------------
   -- Uint_8_from_Hex --
   ---------------------

   function Uint_8_from_Hex (S : String) return Uint_8 is
   begin
      return Uint_8'Value ("16#" & S & "#");
   end Uint_8_from_Hex;

   ----------------
   -- Uint_8_Hex --
   ----------------

   procedure Uint_8_Hex (S : out Two_Char; X : Uint_8) is
      package Unsigned_8_IO is new Ada.Text_IO.Modular_IO (Uint_8);

      Tmp : String (1 .. 6);
   begin
      Unsigned_8_IO.Put (To => Tmp, Item => X, Base => 16);
      if X < 16 then
         S := [1 => '0', 2 => Tmp (5)];
      else
         S := Tmp (4 .. 5);
      end if;
   end Uint_8_Hex;

   ----------------------
   -- Uint_32_from_Hex --
   ----------------------

   function Uint_32_from_Hex (S : String) return Uint_32 is
   begin
      return Uint_32'Value ("16#" & S & "#");
   end Uint_32_from_Hex;

   -----------------
   -- Uint_32_Hex --
   -----------------

   function Uint_32_Hex (X : Uint_32) return String is
      package Unsigned_32_IO is new Ada.Text_IO.Modular_IO (Uint_32);

      Tmp        : String (1 .. 12);
      Lead_Zeros : Natural := 0;
   begin
      Unsigned_32_IO.Put (To => Tmp, Item => X, Base => 16);
      for I in Tmp'Range loop
         exit when Tmp (I) /= ' ';
         Lead_Zeros := Lead_Zeros + 1;
      end loop;
      return String'(1 .. Lead_Zeros => '0') & Tmp (Lead_Zeros + 4 .. 11);
   end Uint_32_Hex;

   ----------------------
   -- Uint256_from_Hex --
   ----------------------

   function Uint256_from_Hex (S : String) return Uint_256 is
      B : Uint_256;
   begin
      for I in B'Range loop
         B (I) :=
           Uint_8_from_Hex (S (64 - 2 * (I - 1) - 1 .. 64 - 2 * (I - 1)));
      end loop;
      return B;
   end Uint256_from_Hex;

   ------------------
   -- Uint_256_Hex --
   ------------------

   function Uint_256_Hex (U : Uint_256) return String is
      Result : String (1 .. 64);
   begin
      for I in U'Range loop
         Uint_8_Hex (Result (64 - 2 * (I - 1) - 1 .. 64 - 2 * (I - 1)), U (I));
      end loop;
      return Result;
   end Uint_256_Hex;

   function Uint256_from_String (S : String) return Uint_256 is
      B : Uint_256;
   begin
      for I in B'Range loop
         B (I) :=
           Uint_8_from_Hex (S (64 - 2 * (I - 1) - 1 .. 64 - 2 * (I - 1)));
      end loop;
      return B;
   end Uint256_from_String;

   function Uint_256_String (U : Uint_256) return String is
      Result : String (1 .. U'Length);
   begin
      for I in U'Range loop
         Result (I) := Character'Val (U (I));
      end loop;
      return Result;
   end Uint_256_String;
end Uint_Types;
