with Interfaces; use Interfaces;

package Uint_Types with
  SPARK_Mode
is

   type Uint_8 is new Unsigned_8;
   type Uint_32 is new Unsigned_32;
   type Uint_256 is array (1 .. 32) of Uint_8;

   Uint_256_0 : constant Uint_256 := (others => 0);

   subtype Two_Char is String (1 .. 2);
   procedure Uint_8_Hex (S : out Two_Char; X : Uint_8);
   function Uint_8_from_Hex (S : String) return Uint_8;

   function Uint_32_Hex (X : Uint_32) return String;
   function Uint_32_from_Hex (S : String) return Uint_32;

   function Uint_256_Hex (U : Uint_256) return String;
   function Uint256_from_Hex (S : String) return Uint_256;

   function Uint_256_String (U : Uint_256) return String;
   function Uint256_from_String (S : String) return Uint_256;

end Uint_Types;
