pragma Ada_2022;

with Ada.Text_IO;
with Ada.Streams.Stream_IO;
package body Types is

   procedure Read_Block_Access
     (Stream  : access Ada.Streams.Root_Stream_Type'Class; Item : Block_Access;
      Padding : Natural)
   is
   begin
      Read_Block (Stream, Item.all, Padding => Padding);
   end Read_Block_Access;

   procedure Read_Block
     (Stream  : access Ada.Streams.Root_Stream_Type'Class; Item : out Block;
      Padding : Natural)
   is
   begin
      for Index in Item'Range loop
         if Index = Item'Last then
            Read_Big_Endian_Word (Stream, Item (Index), Padding);
         else
            Read_Big_Endian_Word (Stream, Item (Index));
         end if;
      end loop;
   end Read_Block;

   function To_Address (BA : Block_Access) return System.Address is
   begin
      return BA (BA'First)'Address;  -- Use 'Address attribute
   end To_Address;

   --  Function to convert all elements of Block_Access_Array to System.Address
   function Convert_To_Address_Array
     (BA_Array : Block_Access_Array) return Block_Address_Array
   is
      Converted_Array : Block_Address_Array (BA_Array'Range);
   begin
      for I in BA_Array'Range loop
         Converted_Array (I) := To_Address (BA_Array (I));
      end loop;
      return Converted_Array;
   end Convert_To_Address_Array;

   procedure Read_Big_Endian_Word
     (Stream : access Ada.Streams.Root_Stream_Type'Class; Item : out Word'Base)
   is
      use Ada.Streams;
      B    : Stream_Element_Array (1 .. 4);
      Last : Stream_Element_Offset := B'Length;
   begin
      Read (Stream.all, B, Last);
      Item :=
        Shift_Left (Word (B (1)), 24) or Shift_Left (Word (B (2)), 16) or
        Shift_Left (Word (B (3)), 8) or Word (B (4));
   end Read_Big_Endian_Word;

   procedure Read_Big_Endian_Word
     (Stream : access Ada.Streams.Root_Stream_Type'Class; Item : out Word'Base;
      Padding : Natural)
   is
      use Ada.Streams;
      B    : Stream_Element_Array (1 .. 4);
      Last : Stream_Element_Offset :=
        B'Length - Stream_Element_Offset (Padding);
   begin

      Read (Stream.all, B (1 .. Last), Last);
      Item :=
        Shift_Left (Word (B (1)), 24) or Shift_Left (Word (B (2)), 16) or
        Shift_Left (Word (B (3)), 8) or Word (B (4));
   end Read_Big_Endian_Word;

   procedure Write_Block
     (Stream  : access Ada.Streams.Root_Stream_Type'Class; Item : Block_Access;
      Padding : Natural)
   is
   begin
      for Word of Item.all loop
         if Word = Item.all (Item.all'Last) then
            Write_Little_Endian_Word (Stream, Word, Padding => Padding);
         else
            Write_Little_Endian_Word (Stream, Word);
         end if;
      end loop;
   end Write_Block;

   procedure Write_Little_Endian_Word
     (Stream  : access Ada.Streams.Root_Stream_Type'Class; Item : Word;
      Padding : Natural := 0)
   is
      use Ada.Streams;
      B    : Stream_Element_Array (1 .. 4);
      Last : constant Stream_Element_Offset :=
        4 - Stream_Element_Offset (Padding);
   begin
      -- Extract individual bytes from the word
      B (4) := Stream_Element (Byte (Shift_Right (Item, 0) and 16#FF#));
      B (3) := Stream_Element (Byte (Shift_Right (Item, 8) and 16#FF#));
      B (2) := Stream_Element (Byte (Shift_Right (Item, 16) and 16#FF#));
      B (1) := Stream_Element (Byte (Shift_Right (Item, 24) and 16#FF#));

      Write (Stream.all, B (1 .. Last));
   end Write_Little_Endian_Word;

   procedure Read_Big_Endian_Word_64
     (Stream :     access Ada.Streams.Root_Stream_Type'Class;
      Item   : out Word_64'Base)
   is
      use Ada.Streams;
      B    : Stream_Element_Array (1 .. 8);
      Last : Stream_Element_Offset := B'Length;
   begin
      Read (Stream.all, B, Last);

      Item :=
        Shift_Left (Word_64 (B (1)), 56) or Shift_Left (Word_64 (B (2)), 48) or
        Shift_Left (Word_64 (B (3)), 40) or Shift_Left (Word_64 (B (4)), 32) or
        Shift_Left (Word_64 (B (5)), 24) or Shift_Left (Word_64 (B (6)), 16) or
        Shift_Left (Word_64 (B (7)), 8) or Word_64 (B (8));

   end Read_Big_Endian_Word_64;
end Types;
