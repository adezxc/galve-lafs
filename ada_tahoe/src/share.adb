with Ada.Text_IO;
with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;

package body Share is

   procedure Read_Share (Segment_Size : Positive; Required_Shares : Positive)
   is
      --  Ceiling function
      Block_Size : constant Positive :=
        (Segment_Size + (Required_Shares - 1)) / Required_Shares;
      type Block is array (Integer range 0 .. Block_Size) of Byte;
      type Block_Array is array (Integer range <>) of Block;

      S               : Stream_Access;
      Share_File      : File_Type;
      My_Share_Header : Share_Header;
   begin
      Open (Share_File, In_File, "../go-tahoe/3");
      S := Stream (Share_File);
      Share_Header'Read (S, My_Share_Header);
      My_Share_Header.Block_Size := Unsigned_32 (Block_Size);
      Display_Share_Content (My_Share_Header);

      Close (Share_File);
      --  Read_Blocks (My_Share_Header, Share_File);

      --  Now My_Share contains the values read from the binary file
   end Read_Share;

   procedure Display_Share_Content (My_Share_Header : Share_Header) is
   begin
      Ada.Text_IO.Put_Line
        ("Share version: " &
         Interfaces.Unsigned_32'Image (My_Share_Header.Version));
      Ada.Text_IO.Put_Line
        ("Share Data Length: " &
         Interfaces.Unsigned_32'Image (My_Share_Header.Data_Length));
      Ada.Text_IO.Put_Line
        ("Lease Number: " &
         Interfaces.Unsigned_32'Image (My_Share_Header.Lease_number));
      Ada.Text_IO.Put_Line
        ("Share version: " &
         Interfaces.Unsigned_32'Image (My_Share_Header.Version));
      Ada.Text_IO.Put_Line
        ("Block Size: " &
         Interfaces.Unsigned_32'Image (My_Share_Header.Block_Size));
      Ada.Text_IO.Put_Line
        ("Data Size: " &
         Interfaces.Unsigned_32'Image (My_Share_Header.Data_Size));
      Ada.Text_IO.Put_Line
        ("Data offset: " &
         Interfaces.Unsigned_32'Image (My_Share_Header.Data_Offset));
      Ada.Text_IO.Put_Line
        ("Plaintext hash tree offset: " &
         Interfaces.Unsigned_32'Image
           (My_Share_Header.Plaintext_Hash_Tree_Offset));
      Ada.Text_IO.Put_Line
        ("Crypttext hash tree offset: " &
         Interfaces.Unsigned_32'Image
           (My_Share_Header.Crypttext_Hash_Tree_Offset));
      Ada.Text_IO.Put_Line
        ("Block hashes offset: " &
         Interfaces.Unsigned_32'Image (My_Share_Header.Block_Hashes_Offset));
      Ada.Text_IO.Put_Line
        ("Share hashes offset: " &
         Interfaces.Unsigned_32'Image (My_Share_Header.Share_Hashes_Offset));
      Ada.Text_IO.Put_Line
        ("URI Extension Length and URI Extension block offset: " &
         Interfaces.Unsigned_32'Image (My_Share_Header.URI_Extension_Offset));
   end Display_Share_Content;

   procedure Read_Blocks
     (My_Share_Header : Share_Header; Share_File : File_Type)
   is
      Total_Blocks : Interfaces.Unsigned_32 := My_Share_Header.Data_Size;
   begin
      Ada.Text_IO.Put ("");

   end Read_Blocks;
end Share;
