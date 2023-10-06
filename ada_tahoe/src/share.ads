with Interfaces; use Interfaces;
with System;     use System;
with Ada.Streams.Stream_IO;
with Ada.Streams;

package Share is

   -- An Unsigned_32 with big-endian encoding in input streams.
   type Word is new Interfaces.Unsigned_32;
   type Byte is new Interfaces.Unsigned_8;

   type Block is array (Positive range <>) of Word;

   type Block_Access is access Block;

   type Block_Access_Array is array (Positive range <>) of Block_Access;

   type Array_Of_Blocks is
     array (Positive range <>, Positive range <>) of Byte;

   type Block_Array (Block_Size_Discr, Block_Array_Size_Discr : Positive) is
   record
      Values : Block_Access_Array (1 .. Block_Array_Size_Discr) :=
        (others => new Block (1 .. Block_Size_Discr));
   end record;

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

   for Word'Read use Read_Big_Endian_Word;
end Share;