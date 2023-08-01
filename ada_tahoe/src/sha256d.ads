with Uint_Types; use Uint_Types;

package Sha256d is

   function Same_Hash (S1, S2 : String) return Boolean;

   function Double_Hash (S : String) return Uint_256;

   function Tagged_Double_Hash (Tag, S : String) return Uint_256;

end Sha256d;
