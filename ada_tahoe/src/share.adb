pragma Ada_2022;
with Ada.Text_IO;
with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;
with Ada.Streams;           use Ada.Streams;

package body Share is

   function Read_Share (Segment_Size, Required_Shares : Positive) return Share
   is
      Block_Size          : constant Positive :=
        (Segment_Size + (Required_Shares - 1)) / Required_Shares;
      Block_Size_In_Words : constant Positive := (Block_Size + 3) / 4;

      S           : Stream_Access;
      Share_File  : File_Type;
      Header      : Share_Header;
      Data_Header : Share_Data_Header;

   begin
      Open (Share_File, In_File, "../go-tahoe/3");
      S := Stream (Share_File);
      Share_Header'Read (S, Header);
      Share_Data_Header'Read (S, Data_Header);
      Data_Header.Block_Size := Word_64 (Block_Size);
      Ada.Text_IO.Put_Line (Header'Image);
      Ada.Text_IO.Put_Line (Data_Header'Image);
      declare
         Data_Size_In_Words : constant Positive :=
           (Integer (Data_Header.Data_Size) + 3) / 4;
         Block_Array_Size   : constant Positive :=
           ((Data_Size_In_Words + Block_Size_In_Words - 1) / Block_Size) - 1;
         Share_Blocks : Block_Array (Block_Size_In_Words, Block_Array_Size);
         Last_Block_Size    : constant Positive :=
           Data_Size_In_Words - (Block_Array_Size * Block_Size_In_Words);
         Last_Block         : Block (1 .. Last_Block_Size);
         New_Share          :
           Share (Block_Size_In_Words, Block_Array_Size, Last_Block_Size);
      begin
         Ada.Text_IO.Put_Line (Data_Size_In_Words'Image);
         Block_Array'Read (S, Share_Blocks);
         Block'Read (S, Last_Block);
         Close (Share_File);
         New_Share.Header      := Header;
         New_Share.Data_Header := Data_Header;
         New_Share.Blocks      := Share_Blocks;
         New_Share.Last_Block  := Last_Block;
         --  Ada.Text_IO.Put_Line (Last_Block'Image);
         return New_Share;
      end;

      --  Read_Blocks (My_Share_Header, Share_File);

      --  Now My_Share contains the values read from the binary file
   end Read_Share;

   procedure Read_Share_Data_Header
     (Stream :     access Ada.Streams.Root_Stream_Type'Class;
      Item   : out Share_Data_Header)
   is
      Temp_Variable_For_Casting : Word;
   begin
      Word'Read (Stream, Item.Version);
      if Item.Version = 1 then
         Word'Read (Stream, Temp_Variable_For_Casting);
         Item.Block_Size := Word_64 (Temp_Variable_For_Casting);
         Word'Read (Stream, Temp_Variable_For_Casting);
         Item.Data_Size := Word_64 (Temp_Variable_For_Casting);
         Word'Read (Stream, Temp_Variable_For_Casting);
         Item.Data_Offset := Word_64 (Temp_Variable_For_Casting);
         Word'Read (Stream, Temp_Variable_For_Casting);
         Item.Plaintext_Hash_Tree_Offset :=
           Word_64 (Temp_Variable_For_Casting);
         Word'Read (Stream, Temp_Variable_For_Casting);
         Item.Crypttext_Hash_Tree_Offset :=
           Word_64 (Temp_Variable_For_Casting);
         Word'Read (Stream, Temp_Variable_For_Casting);
         Item.Block_Hashes_Offset := Word_64 (Temp_Variable_For_Casting);
         Word'Read (Stream, Temp_Variable_For_Casting);
         Item.Share_Hashes_Offset := Word_64 (Temp_Variable_For_Casting);
         Word'Read (Stream, Temp_Variable_For_Casting);
         Item.URI_Extension_Offset := Word_64 (Temp_Variable_For_Casting);
      elsif Item.Version = 2 then
         Word_64'Read (Stream, Item.Block_Size);
         Word_64'Read (Stream, Item.Data_Size);
         Word_64'Read (Stream, Item.Data_Offset);
         Word_64'Read (Stream, Item.Plaintext_Hash_Tree_Offset);
         Word_64'Read (Stream, Item.Crypttext_Hash_Tree_Offset);
         Word_64'Read (Stream, Item.Block_Hashes_Offset);
         Word_64'Read (Stream, Item.Share_Hashes_Offset);
         Word_64'Read (Stream, Item.URI_Extension_Offset);
      end if;
      Item.Data_Offset                := Item.Data_Offset + 12;
      Item.Plaintext_Hash_Tree_Offset := Item.Plaintext_Hash_Tree_Offset + 12;
      Item.Crypttext_Hash_Tree_Offset := Item.Crypttext_Hash_Tree_Offset + 12;
      Item.Block_Hashes_Offset        := Item.Block_Hashes_Offset + 12;
      Item.Share_Hashes_Offset        := Item.Share_Hashes_Offset + 12;
      Item.URI_Extension_Offset       := Item.URI_Extension_Offset + 12;
   end Read_Share_Data_Header;

   procedure Read_Block_Array
     (Stream :     access Ada.Streams.Root_Stream_Type'Class;
      Item   : out Block_Array)
   is
   begin
      for I in 1 .. Item.Values'Length loop
         Block'Read (Stream, Item.Values (I).all);
      end loop;
   end Read_Block_Array;

   procedure Read_Big_Endian_Word
     (Stream : access Ada.Streams.Root_Stream_Type'Class; Item : out Word'Base)
   is
      B1, B2, B3, B4 : Byte;
   begin
      Byte'Read (Stream, B1);
      Byte'Read (Stream, B2);
      Byte'Read (Stream, B3);
      Byte'Read (Stream, B4);

      Item :=
        Shift_Left (Word (B1), 24) or Shift_Left (Word (B2), 16) or
        Shift_Left (Word (B3), 8) or Word (B4);

   end Read_Big_Endian_Word;

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

   --  procedure Display_Share_Header (My_Share_Header : Share_Header) is
   --  begin
   --    Ada.Text_IO.Put_Line
   --      ("Share version: " & Word'Image (My_Share_Header.Version));
   --    Ada.Text_IO.Put_Line
   --      ("Share Data Length: " & Word'Image (My_Share_Header.Data_Length));
   --    Ada.Text_IO.Put_Line
   --      ("Lease Number: " & Word'Image (My_Share_Header.Lease_number));
   --    Ada.Text_IO.Put_Line
   --      ("Share version: " & Word'Image (My_Share_Header.Version));
   --    Ada.Text_IO.Put_Line
   --      ("Block Size: " & Word'Image (My_Share_Header.Block_Size));
   --    Ada.Text_IO.Put_Line
   --      ("Data Size: " & Word'Image (My_Share_Header.Data_Size));
   --    Ada.Text_IO.Put_Line
   --      ("Data offset: " & Word'Image (My_Share_Header.Data_Offset));
   --    Ada.Text_IO.Put_Line
   --      ("Plaintext hash tree offset: " &
   --       Word'Image (My_Share_Header.Plaintext_Hash_Tree_Offset));
   --    Ada.Text_IO.Put_Line
   --      ("Crypttext hash tree offset: " &
   --       Word'Image (My_Share_Header.Crypttext_Hash_Tree_Offset));
   --    Ada.Text_IO.Put_Line
   --      ("Block hashes offset: " &
   --       Word'Image (My_Share_Header.Block_Hashes_Offset));
   --    Ada.Text_IO.Put_Line
   --      ("Share hashes offset: " &
   --       Word'Image (My_Share_Header.Share_Hashes_Offset));
   --    Ada.Text_IO.Put_Line
   --      ("URI Extension Length and URI Extension block offset: " &
   --       Word'Image (My_Share_Header.URI_Extension_Offset));
   --  end Display_Share_Header;

end Share;
