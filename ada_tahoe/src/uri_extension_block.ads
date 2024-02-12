with Interfaces; use Interfaces;
with Ada.Streams;
with Types;      use Types;
with Ada.Containers.Indefinite_Ordered_Maps;

package URI_Extension_Block is

   type Valid_Keys is
     (Codec_Name, Codec_Params, Crypttext_Hash, Crypttext_Root_Hash,
      Needed_Shares, Segment_Count, Share_Root_Hash, Segment_Size, Size,
      Tail_Codec_Params, Total_Shares);

   package Key_Reading is new Ada.Containers.Indefinite_Ordered_Maps
     (String, Valid_Keys);

   Key_Map : Key_Reading.Map;

   type Share_Codec_Params is record
      Segment_Size  : Unsigned_64;
      Needed_Shares : Share_Count;
      Total_Shares  : Share_Count;
   end record;

   type Share_URI_Extension_Block is record
      Codec_Name          : String (1 .. 3);
      Codec_Params        : Share_Codec_Params;
      Crypttext_Hash      : Byte_Array (0 .. 32);
      Crypttext_Root_Hash : Byte_Array (0 .. 32);
      Needed_Shares       : Share_Count;
      Segment_Count       : Unsigned_64;
      Share_Root_Hash     : Byte_Array (0 .. 32);
      Segment_Size        : Unsigned_64;
      Size                : Unsigned_64;
      Tail_Codec_Params   : Share_Codec_Params;
      Total_Shares        : Share_Count;
   end record;

   procedure URI_Extension_Block_To_String
     (URI_Block : in Share_URI_Extension_Block);
   procedure Read_URI_Extension_Block
     (Stream    :     access Ada.Streams.Root_Stream_Type'Class;
      URI_Block : out Share_URI_Extension_Block);
   procedure Read_Codec_Name
     (Stream     :     access Ada.Streams.Root_Stream_Type'Class;
      Codec_Name : out String);
   procedure Read_Codec_Params
     (Stream       :     access Ada.Streams.Root_Stream_Type'Class;
      Codec_Params : out Share_Codec_Params);
   procedure Read_Hash
     (Stream :     access Ada.Streams.Root_Stream_Type'Class;
      Hash   : out Byte_Array);
   procedure Read_Share_Count
     (Stream :     access Ada.Streams.Root_Stream_Type'Class;
      Value  : out Share_Count);
   procedure Read_Unsigned_64
     (Stream :     access Ada.Streams.Root_Stream_Type'Class;
      Value  : out Unsigned_64);
   procedure Read_Junk (Stream : access Ada.Streams.Root_Stream_Type'Class);

   for Share_URI_Extension_Block'Read use Read_URI_Extension_Block;
end URI_Extension_Block;
