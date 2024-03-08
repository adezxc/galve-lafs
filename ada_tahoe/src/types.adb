with Ada.Text_IO; use Ada.Text_IO;

package body types is
   procedure Read_Block_Array
     (Stream :     access Ada.Streams.Root_Stream_Type'Class;
      Item   : out Block_Array)
   is
   begin
      for I in 1 .. Item.Values'Length loop
         Block'Read (Stream, Item.Values (I).all);
      end loop;
   end Read_Block_Array;

   procedure Read_Block_Access
     (Stream :     access Ada.Streams.Root_Stream_Type'Class;
      Item   : out Block_Access)
   is
   begin
      Block'Read (Stream, Item.all);
   end Read_Block_Access;

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
      Ada.Text_IO.Put_Line (BA_Array'First'Image & BA_Array'Last'Image);
      for I in BA_Array'Range loop
         Converted_Array (I) := To_Address (BA_Array (I));
      end loop;
      return Converted_Array;
   end Convert_To_Address_Array;

   procedure Read_Big_Endian_Word
     (Stream : access Ada.Streams.Root_Stream_Type'Class; Item : out Word'Base)
   is
      B1, B2, B3, B4 : Byte;
   begin
      Ada.Text_IO.Put_Line ("TEST");
      Byte'Read (Stream, B1);
      Byte'Read (Stream, B2);
      Byte'Read (Stream, B3);
      Byte'Read (Stream, B4);

      Item :=
        Shift_Left (Word (B1), 24) or Shift_Left (Word (B2), 16) or
        Shift_Left (Word (B3), 8) or Word (B4);
   end Read_Big_Endian_Word;

   procedure Write_Block
     (F : Byte_IO.File_Type; Item : in out Block_Access; Padding : Boolean)
   is
   -- Padding_Count : Natural                         := Item.all'Length mod 4;
   -- Padding_Array : Byte_Array (1 .. Padding_Count) := (others => 0);
   begin
      for Word of Item.all loop
         if Word = Item.all (Item.all'Last) and Padding then
            Write_Little_Endian_Word (F, Word, Padding => True);
         else
            Write_Little_Endian_Word (F, Word, Padding => False);
         end if;
      end loop;
      --  for Byte of Padding_Array loop
      --     Byte_IO.Write (F, Byte);
      --  end loop;
   end Write_Block;

   procedure Write_Little_Endian_Word
     (F : Byte_IO.File_Type; Item : in out Word'Base; Padding : Boolean)
   is
      B1, B2, B3, B4 : Byte;
   begin
      -- Extract individual bytes from the word
      B1 := Byte (Shift_Right (Item, 0) and 16#FF#);
      B2 := Byte (Shift_Right (Item, 8) and 16#FF#);
      B3 := Byte (Shift_Right (Item, 16) and 16#FF#);
      B4 := Byte (Shift_Right (Item, 24) and 16#FF#);

      Byte_IO.Write (F, B4);
      Byte_IO.Write (F, B3);
      Byte_IO.Write (F, B2);
      if not Padding then
         Byte_IO.Write (F, B1);
      end if;
   end Write_Little_Endian_Word;

   procedure Read_Big_Endian_Word_64
     (Stream :     access Ada.Streams.Root_Stream_Type'Class;
      Item   : out Word_64'Base)
   is
      B1, B2, B3, B4, B5, B6, B7, B8 : Byte;
   begin
      Byte'Read (Stream, B1);
      Byte'Read (Stream, B2);
      Byte'Read (Stream, B3);
      Byte'Read (Stream, B4);
      Byte'Read (Stream, B5);
      Byte'Read (Stream, B6);
      Byte'Read (Stream, B7);
      Byte'Read (Stream, B8);

      Item :=
        Shift_Left (Word_64 (B1), 56) or Shift_Left (Word_64 (B2), 48) or
        Shift_Left (Word_64 (B3), 40) or Shift_Left (Word_64 (B4), 32) or
        Shift_Left (Word_64 (B5), 24) or Shift_Left (Word_64 (B6), 16) or
        Shift_Left (Word_64 (B7), 8) or Word_64 (B8);

   end Read_Big_Endian_Word_64;
end types;
