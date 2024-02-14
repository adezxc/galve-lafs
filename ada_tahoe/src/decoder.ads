with Uri_Read;              use Uri_Read;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Decoder is
   type Share_Name_Array is array (Natural range <>) of Unbounded_String;
   procedure Decode_File (File_URI : URI; Share_Names : Share_Name_Array);
end Decoder;
