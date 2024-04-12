with Uri_Read;              use Uri_Read;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Share;
with Types;
with fec_h;
with Ada.Streams;
with Aes;

package Decoder is
   type Share_Name_Array is array (Natural range <>) of Unbounded_String;
   type Share_Number_Array is array (Natural range <>) of aliased Integer;

   type File_Decoder is record
      FEC_Decoder : aliased access fec_h.fec_t;
      Decryptor   : aliased Aes.Decryptor;
   end record;

   function New_File_Decoder (URI : Uri_Read.URI) return File_Decoder;

   procedure Decode_File
     (Decoder : File_Decoder; File_URI : URI; Share_Names : Share_Name_Array;
      Output_Stream : access Ada.Streams.Root_Stream_Type'Class);

   procedure Decode_Segment
     (Decoder       : File_Decoder; Shares : in out Share.Share_Access_Array;
      Share_Numbers : in out Share_Number_Array; Primary_Blocks_N : Natural;
      Last          :        Boolean; Needed_Shares : Types.Share_Count;
      Output_Stream :        access Ada.Streams.Root_Stream_Type'Class);
end Decoder;
