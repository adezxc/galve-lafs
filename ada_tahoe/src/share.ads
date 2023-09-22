with Interfaces; use Interfaces;
with System;     use System;
with Ada.Streams.Stream_IO;

package Share is

   -- An Unsigned_32 with big-endian encoding in input streams.
   type Word is new Interfaces.Unsigned_32;
   type Byte is new Interfaces.Unsigned_8;

   type Share_Header is record
      Version                    : Word;
      Data_Length                : Word;
      Lease_number               : Word;
      --  unused as it can be calculated from the URI
      Version_Junk               : Word;
      Block_Size                 : Word;
      Data_Size                  : Word;
      Data_Offset                : Word;
      Plaintext_Hash_Tree_Offset : Word;
      Crypttext_Hash_Tree_Offset : Word;
      Block_Hashes_Offset        : Word;
      Share_Hashes_Offset        : Word;
      URI_Extension_Offset       : Word;
   end record;

   procedure Read_Big_Endian_Word
     (Stream :     access Ada.Streams.Root_Stream_Type'Class;
      Item   : out Word'Base);
   procedure Read_Share (Segment_Size : Positive; Required_Shares : Positive);
   procedure Display_Share_Header (My_Share_Header : Share_Header);
   procedure Read_Blocks
     (My_Share_Header : Share_Header;
      Share_File      : Ada.Streams.Stream_IO.File_Type);

   for Word'Read use Read_Big_Endian_Word;
end Share;
