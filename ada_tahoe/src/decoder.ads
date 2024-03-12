with Uri_Read;              use Uri_Read;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Share;
with Types;
with fec_h;

package Decoder is
   type Share_Name_Array is array (Natural range <>) of Unbounded_String;
   type Share_Number_Array is array (Natural range <>) of aliased Integer;

   procedure Decode_File (File_URI : URI; Share_Names : Share_Name_Array);

   procedure Decode_Block
     (Decoder : access fec_h.fec_t; Shares : in out Share.Share_Access_Array;
      Share_Numbers : in out Share_Number_Array; Primary_Blocks_N : Natural;
      Last          :        Boolean; Needed_Shares : Types.Share_Count);
end Decoder;
