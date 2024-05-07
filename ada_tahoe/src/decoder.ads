with Uri_Read;              use Uri_Read;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Share;
with Types;
with fec_h;
with Ada.Streams;
with Aes;
with Memory_Streams;

package Decoder is
  type Share_Number_Array is array (Natural range <>) of aliased Integer;

  type Share_Name_Array is array (Natural range <>) of Unbounded_String;

  procedure Decode_File
   (File_URI      : URI; Share_Names : Share_Name_Array;
    Output_Stream : access Ada.Streams.Root_Stream_Type'Class);

  procedure Decode_Segment
   (AES_Decryptor :        Aes.Decryptor; FEC_Decoder : access fec_h.fec_t;
    Shares        : in out Share.Share_Access_Array;
    Share_Numbers : in out Share_Number_Array; Primary_Blocks_N : Natural;
    Last          :        Boolean; Needed_Shares : Types.Share_Count;
    Output_Stream :        access Ada.Streams.Root_Stream_Type'Class;
    Padding       :        Natural; Last_Segment_Padding : Natural := 0;
    Block_Size    :        Natural; Segment_Size : Natural);
end Decoder;
