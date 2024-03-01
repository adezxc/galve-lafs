pragma Ada_2022;

with Ada.Text_IO;
with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;
with Ada.Streams;           use Ada.Streams;
with Ada.Strings.Unbounded;
with System;

package body Share is

   function Next_Block (My_Share : in out Share_Access) return Block_Access is
   begin
      if My_Share.all.Blocks.Values'Length + 1 > My_Share.all.Current_Block
      then
         My_Share.all.Current_Block := My_Share.all.Current_Block + 1;
         return My_Share.all.Blocks.Values (My_Share.all.Current_Block - 1);
      else
         Ada.Text_IO.Put_Line ("Last Block was accessed!");
         return My_Share.all.Last_Block;
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
   function Read_Share (File : String) return Share_Access is
      S                   : Stream_Access;
      Share_File          : File_Type;
      Header              : Share_Header;
      Data_Header         : Share_Data_Header;
      URI_Extension_Block : Share_URI_Extension_Block;
      function Get_Basename
        (Path : String) return Ada.Strings.Unbounded.Unbounded_String
      is
         use Ada.Strings.Unbounded;
         Last_Slash : Natural := 0;
      begin
         for I in reverse 1 .. Path'Length loop
            if Path (I) = '/' then
               Last_Slash := I;
               exit;
            end if;
         end loop;
         if Last_Slash = 0 then
            return To_Unbounded_String (Path);
         else
            return To_Unbounded_String (Path (Last_Slash + 1 .. Path'Last));
         end if;
      end Get_Basename;
   begin
      Open (Share_File, In_File, File);
      S := Stream (Share_File);
      Share_Header'Read (S, Header);
      Share_Data_Header'Read (S, Data_Header);
      declare
         Current_Index : Positive_Count := Index (Share_File);
      begin
         Set_Index (Share_File, Count (Data_Header.URI_Extension_Offset + 4));
         Read_URI_Extension_Block (S, URI_Extension_Block);
         --  we set the old index to continue with reading the share file
         Set_Index (Share_File, Current_Index);
      end;

      declare
         Block_Size          : constant Positive :=
           (Positive (URI_Extension_Block.Segment_Size) + (3 - 1)) / 3;
         Block_Size_In_Words : constant Positive := (Block_Size + 3) / 4;
         Data_Size_In_Words  : constant Natural  :=
           (Integer (Data_Header.Data_Size) + 3) / 4;
         Block_Array_Size    : constant Natural  :=
           ((Data_Size_In_Words) / Block_Size_In_Words);
         Share_Blocks : Block_Array (Block_Size_In_Words, Block_Array_Size);
         Last_Block_Size     : constant Natural  :=
           Data_Size_In_Words - (Block_Array_Size * Block_Size_In_Words) - 1;
         Last_Block : Block_Access      := new Block (0 .. Last_Block_Size);
         New_Share           : Share_Access      :=
           new Share (Block_Size_In_Words, Block_Array_Size);
      begin
         for Block of Share_Blocks.Values loop
            Block_Access'Read (S, Block);
         end loop;
         Block_Access'Read (S, Last_Block);
         Close (Share_File);
         New_Share.Share_Number        :=
           Natural'Value
             (Ada.Strings.Unbounded.To_String (Get_Basename (File)));
         New_Share.Header              := Header;
         New_Share.URI_Extension_Block := URI_Extension_Block;
         New_Share.Data_Header         := Data_Header;
         New_Share.Blocks              := Share_Blocks;
         New_Share.Last_Block          := Last_Block;
         return New_Share;
      end;
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
      Item.Data_Offset                := Item.Data_Offset + 12 + 1;
      Item.Plaintext_Hash_Tree_Offset :=
        Item.Plaintext_Hash_Tree_Offset + 12 + 1;
      Item.Crypttext_Hash_Tree_Offset :=
        Item.Crypttext_Hash_Tree_Offset + 12 + 1;
      Item.Block_Hashes_Offset        := Item.Block_Hashes_Offset + 12 + 1;
      Item.Share_Hashes_Offset        := Item.Share_Hashes_Offset + 12 + 1;
      Item.URI_Extension_Offset       := Item.URI_Extension_Offset + 12 + 1;
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

   procedure Sort (Shares : in out Share_Access_Array) is
      Temp    : Share_Access;
      Swapped : Boolean := False;

   begin
      loop
         Swapped := False;
         for I in Shares'First + 1 .. Shares'Last loop
            if Shares (I).all.Share_Number < Shares (I - 1).all.Share_Number
            then
               Temp           := Shares (I);
               Shares (I)     := Shares (I - 1);
               Shares (I - 1) := Temp;
               Swapped        := True;
            end if;
         end loop;
         exit when Swapped = False;
      end loop;

   end Sort;

end Share;
