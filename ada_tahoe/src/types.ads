with Interfaces; use Interfaces;
with System;
with Ada.Streams;
with Ada.Sequential_IO;

package Types is

   --  An Unsigned_32 with big-endian encoding in input streams.
   type Word is new Interfaces.Unsigned_32;

   procedure Read_Big_Endian_Word
     (Stream :     access Ada.Streams.Root_Stream_Type'Class;
      Item   : out Word'Base);
   for Word'Read use Read_Big_Endian_Word;

   procedure Read_Big_Endian_Word
     (Stream : access Ada.Streams.Root_Stream_Type'Class; Item : out Word'Base;
      Padding : Natural);

   type Word_64 is new Interfaces.Unsigned_64;

   package Word_IO is new Ada.Sequential_IO (Word);

   type Byte is new Interfaces.Unsigned_8;

   type Byte_Array is array (Natural range <>) of aliased Byte;

   package Byte_IO is new Ada.Sequential_IO (Byte);

   type Share_Count is range 1 .. 256;

   type Block is array (Natural range <>) of Word;

   type Block_Access is access Block;

   type Block_Access_Array is array (Natural range <>) of Block_Access;

   type Block_Array (Block_Size_Discr, Block_Array_Size_Discr : Natural) is
   record
      Values : Block_Access_Array (1 .. Block_Array_Size_Discr) :=
        (others => new Block (1 .. Block_Size_Discr));
   end record;

   type Block_Address_Array is array (Natural range <>) of System.Address;

   function To_Address (BA : Block_Access) return System.Address;
   -- Function to convert all elements of Block_Access_Array to System.Address
   function Convert_To_Address_Array
     (BA_Array : Block_Access_Array) return Block_Address_Array;

   procedure Write_Block
     (Stream  : access Ada.Streams.Root_Stream_Type'Class; Item : Block_Access;
      Padding : Natural);
   procedure Write_Little_Endian_Word
     (Stream  : access Ada.Streams.Root_Stream_Type'Class; Item : Word;
      Padding : Natural := 0);
   procedure Read_Block
     (Stream  : access Ada.Streams.Root_Stream_Type'Class; Item : out Block;
      Padding : Natural);
   procedure Read_Block_Access
     (Stream  : access Ada.Streams.Root_Stream_Type'Class; Item : Block_Access;
      Padding : Natural);
   procedure Read_Big_Endian_Word_64
     (Stream :     access Ada.Streams.Root_Stream_Type'Class;
      Item   : out Word_64'Base);

   for Word_64'Read use Read_Big_Endian_Word_64;
end Types;
