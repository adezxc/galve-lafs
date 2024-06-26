pragma Ada_2022;

with Text_IO;
package body Types is

   -- Stream_IO optimization found on https://groups.google.com/g/comp.lang.ada/c/1CJv_eIpCww
   procedure Read
     (S :     access Ada.Streams.Root_Stream_Type'Class; B : out Byte_Array;
      Last_Read : out Natural)
   is
      Last      : Stream_Element_Offset := Stream_Element_Offset (B'Last);
      SE_Buffer : Stream_Element_Array (1 .. B'Length);
      for SE_Buffer'Address use B'Address;
   begin
      Read (S.all, SE_Buffer, Last);
      Last_Read := Natural (Last);
   end Read;

   procedure Write
     (S : access Ada.Streams.Root_Stream_Type'Class; B : Byte_Array)
   is
      SE_Buffer : Stream_Element_Array (1 .. B'Length);
      for SE_Buffer'Address use B'Address;
   begin
      Write (S.all, SE_Buffer);
   end Write;

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

   function To_Address (B : Block) return System.Address is
   begin
      return B (B'First)'Address;  -- Use 'Address attribute
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
      B    : Byte_Array (1 .. 4);
      Last : Natural;
   begin
      Read (Stream, B, Last);
      Item :=
        Shift_Left (Word (B (1)), 24) or Shift_Left (Word (B (2)), 16) or
        Shift_Left (Word (B (3)), 8) or Word (B (4));
   end Read_Big_Endian_Word;

   procedure Read_Big_Endian_Word
     (Stream : access Ada.Streams.Root_Stream_Type'Class; Item : out Word'Base;
      Padding : Natural)
   is
      B    : Byte_Array (1 .. 4);
      Last : Natural := B'Length - Padding;
   begin
      Read (Stream, B (1 .. Last), Last);
      Item :=
        Shift_Left (Word (B (1)), 24) or Shift_Left (Word (B (2)), 16) or
        Shift_Left (Word (B (3)), 8) or Word (B (4));
   end Read_Big_Endian_Word;

   procedure Write_Block
     (Stream  : access Ada.Streams.Root_Stream_Type'Class; Item : Block;
      Padding : Natural)
   is
   begin
      for Word of Item loop
         if Word = Item (Item'Last) then
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
      B    : Byte_Array (1 .. 4);
      Last : constant Natural := 4 - Padding;
   begin
      --  Extract individual bytes from the word
      B (4) := Byte (Shift_Right (Item, 0) and 16#FF#);
      B (3) := Byte (Shift_Right (Item, 8) and 16#FF#);
      B (2) := Byte (Shift_Right (Item, 16) and 16#FF#);
      B (1) := Byte (Shift_Right (Item, 24) and 16#FF#);

      Write (Stream, B (1 .. Last));
   end Write_Little_Endian_Word;

   procedure Read_Big_Endian_Word_64
     (Stream :     access Ada.Streams.Root_Stream_Type'Class;
      Item   : out Word_64'Base)
   is
      B    : Byte_Array (1 .. 8);
      Last : Natural;
   begin
      Read (Stream, B, Last);

      Item :=
        Shift_Left (Word_64 (B (1)), 56) or Shift_Left (Word_64 (B (2)), 48) or
        Shift_Left (Word_64 (B (3)), 40) or Shift_Left (Word_64 (B (4)), 32) or
        Shift_Left (Word_64 (B (5)), 24) or Shift_Left (Word_64 (B (6)), 16) or
        Shift_Left (Word_64 (B (7)), 8) or Word_64 (B (8));

   end Read_Big_Endian_Word_64;
end Types;
