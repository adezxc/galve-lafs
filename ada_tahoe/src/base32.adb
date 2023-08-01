with Util.Encoders; use Util.Encoders;
with Ada.Characters.Handling; use Ada.Characters.Handling;

package body Base32 is

   function Encode (S : String) return String is
      C : constant Encoder := Util.Encoders.Create ("base32");
   begin
      return C.Encode ((S));
   end Encode;

   function Decode (S : String) return String is
      D : constant Decoder := Util.Encoders.Create ("base32");
   begin
      return D.Decode (To_Upper (S));
   end Decode;

end Base32;
