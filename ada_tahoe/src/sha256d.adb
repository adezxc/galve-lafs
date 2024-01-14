with GNAT.SHA256;             use GNAT.SHA256;
with Ada.Unchecked_Conversion;
with Ada.Characters.Handling; use Ada.Characters.Handling;

package body Sha256d is

   function Double_Hash (S : String) return Uint_256 is
      D : Binary_Message_Digest := Digest (S);
      T : String (1 .. 32);
      for T'Address use D'Address;
      D2 : constant Binary_Message_Digest := Digest (T);

      function To_Uint_256 is new Ada.Unchecked_Conversion
        (Source => Binary_Message_Digest, Target => Uint_256);
   begin
      return To_Uint_256 (D2);
   end Double_Hash;

   function Tagged_Double_Hash (Tag, S : String) return Uint_256 is
   begin
      return Double_Hash (Tag & S);
   end Tagged_Double_Hash;

   ---------------
   -- Same_Hash --
   ---------------

   function Same_Hash (S1, S2 : String) return Boolean is
   begin
      return To_Lower (S1) = To_Lower (S2);
   end Same_Hash;

end Sha256d;
