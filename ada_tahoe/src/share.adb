pragma Ada_2022;
with Ada.Text_IO;
with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;
with Ada.Streams;           use Ada.Streams;

package body Share is

   function Next_Block (My_Share : in out Share) return Block_Access is
   begin
      if My_Share.Blocks.Values'Length > My_Share.Current_Block then
         Ada.Text_IO.Put_Line (My_Share.Current_Block'Image);
         My_Share.Current_Block := My_Share.Current_Block + 1;
         Ada.Text_IO.Put_Line (My_Share.Current_Block'Image);
         return My_Share.Blocks.Values (My_Share.Current_Block - 1);
      else
         return My_Share.Last_Block;
      end if;
   end Next_Block;

   --  A share file consists of the following components:
   --  1) A header that contains the share version number, share's size in byte
   --    and number of leases
   --  2) A share data header that contains the share version number, block
   --    size (unused) and offsets of different parts of the file
   --  3) Share data in blocks of set size, last block can be shorter than the
   --  others
   --  4) Hashes of plaintext blocks (Unused)
   --  5) Hashes of crypttext blocks, needed for verifying the share
   --  6) Hashes of blocks
   --  7) Hash of the share
   --  8) URI Extension block that contains more metadata about the file.
   function Read_Share
     (Segment_Size, Required_Shares : Positive; File : String) return Share
   is
      Block_Size          : constant Positive :=
        (Segment_Size + (Required_Shares - 1)) / Required_Shares;
      Block_Size_In_Words : constant Positive := (Block_Size + 3) / 4;

      S           : Stream_Access;
      Share_File  : File_Type;
      Header      : Share_Header;
      Data_Header : Share_Data_Header;
   begin
      Open (Share_File, In_File, File);
      S := Stream (Share_File);
      Share_Header'Read (S, Header);
      Share_Data_Header'Read (S, Data_Header);
      Data_Header.Block_Size := Word_64 (Block_Size);
      declare
         Data_Size_In_Words : constant Natural :=
           (Integer (Data_Header.Data_Size) + 3) / 4;
         Block_Array_Size   : constant Natural :=
           ((Data_Size_In_Words + Block_Size_In_Words - 1) / Block_Size);
         Share_Blocks : Block_Array (Block_Size_In_Words, Block_Array_Size);
         Last_Block_Size    : constant Natural :=
           Data_Size_In_Words - (Block_Array_Size * Block_Size_In_Words);
         Last_Block         : Block_Access := new Block (1 .. Last_Block_Size);
         New_Share          : Share (Block_Size_In_Words, Block_Array_Size);
      begin
         Block_Array'Read (S, Share_Blocks);
         Block_Access'Read (S, Last_Block);
         Close (Share_File);
         New_Share.Header      := Header;
         New_Share.Data_Header := Data_Header;
         New_Share.Blocks      := Share_Blocks;
         New_Share.Last_Block  := Last_Block;
         --  Ada.Text_IO.Put_Line (Last_Block'Image);
         return New_Share;
      end;
      --  Now My_Share contains the values read from the binary file
   end Read_Share;

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

   procedure Display_Share_Headers (My_Share : Share) is
   begin
      Ada.Text_IO.Put_Line
        ("Share version: " & Word'Image (My_Share.Header.Version));
      Ada.Text_IO.Put_Line
        ("Share Data Length: " & Word'Image (My_Share.Header.Data_Length));
      Ada.Text_IO.Put_Line
        ("Lease Number: " & Word'Image (My_Share.Header.Lease_number));
      Ada.Text_IO.Put_Line
        ("Block Size: " & Word_64'Image (My_Share.Data_Header.Block_Size));
      Ada.Text_IO.Put_Line
        ("Data Size: " & Word_64'Image (My_Share.Data_Header.Data_Size));
      Ada.Text_IO.Put_Line
        ("Data offset: " & Word_64'Image (My_Share.Data_Header.Data_Offset));
      Ada.Text_IO.Put_Line
        ("Plaintext hash tree offset: " &
         Word_64'Image (My_Share.Data_Header.Plaintext_Hash_Tree_Offset));
      Ada.Text_IO.Put_Line
        ("Crypttext hash tree offset: " &
         Word_64'Image (My_Share.Data_Header.Crypttext_Hash_Tree_Offset));
      Ada.Text_IO.Put_Line
        ("Block hashes offset: " &
         Word_64'Image (My_Share.Data_Header.Block_Hashes_Offset));
      Ada.Text_IO.Put_Line
        ("Share hashes offset: " &
         Word_64'Image (My_Share.Data_Header.Share_Hashes_Offset));
      Ada.Text_IO.Put_Line
        ("URI Extension Length and URI Extension block offset: " &
         Word_64'Image (My_Share.Data_Header.URI_Extension_Offset));
      Ada.Text_IO.Put_Line ("");
   end Display_Share_Headers;

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

end Share;
