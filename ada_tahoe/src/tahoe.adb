with Ada.Characters.Handling; use Ada.Characters.Handling;

with Base32;     use Base32;
with Sha256d;    use Sha256d;
with Uint_Types; use Uint_Types;

package body Tahoe is

   function Storage_Index_From_File_Key (H : String) return String is
      Tag                   : constant String   :=
        "43:allmydata_immutable_key_to_storage_index_v1,";
      Decoded_File_Key      : constant String   := Decode (H);
      Decoded_Storage_Index : constant Uint_256 :=
        Tagged_Double_Hash (Tag, Decoded_File_Key);
   begin
      return
        To_Lower (Encode (Uint_256_String (Decoded_Storage_Index))) (1 .. 16);
   end Storage_Index_From_File_Key;
end Tahoe;
