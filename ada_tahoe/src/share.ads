with Interfaces; use Interfaces;
with Ada.Streams;

package Share is

   --  An Unsigned_32 with big-endian encoding in input streams.
   type Word is new Interfaces.Unsigned_32;
   --  An Unsigned_64 with big-endian encoding in input streams.
   type Word_64 is new Interfaces.Unsigned_64;

   type Byte is new Interfaces.Unsigned_8;

   type Block is array (Positive range <>) of Word;

   type Block_Access is access Block;

   type Block_Access_Array is array (Positive range <>) of Block_Access;

   type Block_Array (Block_Size_Discr, Block_Array_Size_Discr : Positive) is
   record
      Values : Block_Access_Array (1 .. Block_Array_Size_Discr) :=
        (others => new Block (1 .. Block_Size_Discr));
   end record;

   type Share_Header is record
      Version      : Word;
      Data_Length  : Word;
      Lease_number : Word;
   end record;

   type Share_Data_Header is record
      Version                    : Word;
      Block_Size                 : Word_64;
      Data_Size                  : Word_64;
      Data_Offset                : Word_64;
      Plaintext_Hash_Tree_Offset : Word_64;
      Crypttext_Hash_Tree_Offset : Word_64;
      Block_Hashes_Offset        : Word_64;
      Share_Hashes_Offset        : Word_64;
      URI_Extension_Offset       : Word_64;
   end record;

   type Share
     (Block_Size_Discr, Block_Array_Size_Discr, Last_Block_Size : Positive) is
   record
      Header      : Share_Header;
      Data_Header : Share_Data_Header;
      Blocks      : Block_Array (Block_Size_Discr, Block_Array_Size_Discr);
      Last_Block  : Block (1 .. Last_Block_Size);
   end record;

   procedure Read_Block_Array
     (Stream :     access Ada.Streams.Root_Stream_Type'Class;
      Item   : out Block_Array);
   procedure Read_Share_Data_Header
     (Stream :     access Ada.Streams.Root_Stream_Type'Class;
      Item   : out Share_Data_Header);
   procedure Read_Big_Endian_Word
     (Stream :     access Ada.Streams.Root_Stream_Type'Class;
      Item   : out Word'Base);
   procedure Read_Big_Endian_Word_64
     (Stream :     access Ada.Streams.Root_Stream_Type'Class;
      Item   : out Word_64'Base);
   function Read_Share
     (Segment_Size : Positive; Required_Shares : Positive) return Share;
   --  procedure Display_Share_Header (My_Share_Header : Share_Header);

   for Word'Read use Read_Big_Endian_Word;
   for Word_64'Read use Read_Big_Endian_Word_64;
   for Block_Array'Read use Read_Block_Array;
   for Share_Data_Header'Read use Read_Share_Data_Header;
end Share;
