with Interfaces; use Interfaces;
with System;
with Ada.Streams;

package Types is

  --  An Unsigned_32 with big-endian encoding in input streams.
  type Word is new Interfaces.Unsigned_32;

  use Ada.Streams;

  procedure Read_Big_Endian_Word
   (Stream : access Root_Stream_Type'Class; Item : out Word'Base);
  for Word'Read use Read_Big_Endian_Word;

  procedure Read_Big_Endian_Word
   (Stream  : access Root_Stream_Type'Class; Item : out Word'Base;
    Padding : Natural);

  type Word_64 is new Unsigned_64;

  type Byte is new Unsigned_8;

  type Byte_Array is array (Natural range <>) of aliased Byte;

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
  --  Function to convert all elements of Block_Access_Array to System.Address
  function Convert_To_Address_Array
   (BA_Array : Block_Access_Array) return Block_Address_Array;

  procedure Write_Block
   (Stream  : access Root_Stream_Type'Class; Item : Block_Access;
    Padding : Natural);
  procedure Write_Little_Endian_Word
   (Stream  : access Root_Stream_Type'Class; Item : Word;
    Padding : Natural := 0) with
   Pre => Padding <= 4 and Padding >= 0;
  procedure Read_Block
   (Stream  : access Root_Stream_Type'Class; Item : out Block;
    Padding : Natural);
  procedure Read_Block_Access
   (Stream  : access Root_Stream_Type'Class; Item : Block_Access;
    Padding : Natural);
  procedure Read_Big_Endian_Word_64
   (Stream : access Root_Stream_Type'Class; Item : out Word_64'Base);
  procedure Read
   (S         :     access Root_Stream_Type'Class; B : out Byte_Array;
    Last_Read : out Natural);
  procedure Write (S : access Root_Stream_Type'Class; B : Byte_Array);

  for Word_64'Read use Read_Big_Endian_Word_64;
end Types;
