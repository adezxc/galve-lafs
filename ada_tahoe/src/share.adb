pragma Ada_2022;
with Ada.Text_IO;
with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;
with Ada.Streams;           use Ada.Streams;

package body Share is

   procedure Read_Share (Segment_Size : Positive; Required_Shares : Positive)
   is
      Block_Size : constant Positive :=
        (Segment_Size + (Required_Shares - 1)) / Required_Shares;

      S               : Stream_Access;
      Share_File      : File_Type;
      My_Share_Header : Share_Header;

   begin
      Open (Share_File, In_File, "../go-tahoe/3");
      S := Stream (Share_File);
      Share_Header'Read (S, My_Share_Header);
      My_Share_Header.Block_Size := Word (Block_Size);
      Display_Share_Header (My_Share_Header);
      declare
         Block_Array_Size : constant Positive      :=
           (Integer (My_Share_Header.Data_Size) + (Block_Size - 1)) /
           Block_Size;
         Share_Blocks     : Block_Array (Block_Size, Block_Array_Size);
         AoB              : access Array_Of_Blocks :=
           new Array_Of_Blocks
             (1 .. Block_Array_Size - 1, 1 .. Block_Size / 4);
      begin
         Ada.Text_IO.Put_Line (Block_Size'Image);
         Array_Of_Blocks'Read (S, AoB.all);
         Ada.Text_IO.Put_Line (AoB.all'Image);
         null;
      end;

      Close (Share_File);
      --  Read_Blocks (My_Share_Header, Share_File);

      --  Now My_Share contains the values read from the binary file
   end Read_Share;

   procedure Read_Block_Array
     (Stream :     access Ada.Streams.Root_Stream_Type'Class;
      Item   : out Block_Array)
   is
   begin
      for I in 1 .. 10 loop
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

   procedure Display_Share_Header (My_Share_Header : Share_Header) is
   begin
      Ada.Text_IO.Put_Line
        ("Share version: " & Word'Image (My_Share_Header.Version));
      Ada.Text_IO.Put_Line
        ("Share Data Length: " & Word'Image (My_Share_Header.Data_Length));
      Ada.Text_IO.Put_Line
        ("Lease Number: " & Word'Image (My_Share_Header.Lease_number));
      Ada.Text_IO.Put_Line
        ("Share version: " & Word'Image (My_Share_Header.Version));
      Ada.Text_IO.Put_Line
        ("Block Size: " & Word'Image (My_Share_Header.Block_Size));
      Ada.Text_IO.Put_Line
        ("Data Size: " & Word'Image (My_Share_Header.Data_Size));
      Ada.Text_IO.Put_Line
        ("Data offset: " & Word'Image (My_Share_Header.Data_Offset));
      Ada.Text_IO.Put_Line
        ("Plaintext hash tree offset: " &
         Word'Image (My_Share_Header.Plaintext_Hash_Tree_Offset));
      Ada.Text_IO.Put_Line
        ("Crypttext hash tree offset: " &
         Word'Image (My_Share_Header.Crypttext_Hash_Tree_Offset));
      Ada.Text_IO.Put_Line
        ("Block hashes offset: " &
         Word'Image (My_Share_Header.Block_Hashes_Offset));
      Ada.Text_IO.Put_Line
        ("Share hashes offset: " &
         Word'Image (My_Share_Header.Share_Hashes_Offset));
      Ada.Text_IO.Put_Line
        ("URI Extension Length and URI Extension block offset: " &
         Word'Image (My_Share_Header.URI_Extension_Offset));
   end Display_Share_Header;

end Share;
