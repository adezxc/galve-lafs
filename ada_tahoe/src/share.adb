pragma Ada_2022;
with Ada.Text_IO;
with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;
with Ada.Streams;           use Ada.Streams;
with Ada.Strings.Unbounded;
with Types;

package body Share is

   function Next_Block (My_Share : Share_Access) return Block is
      Block : Types.Block (1 .. My_Share.all.Metadata.Block_Size);
   begin
      if My_Share.all.Current_Block < My_Share.all.Metadata.Block_Array_Size
      then
         My_Share.all.Current_Block := My_Share.all.Current_Block + 1;
         Read_Block
           (My_Share.all.Share_Stream, Block,
            My_Share.all.Metadata.Block_Padding);
         return Block;
      else
         declare
            Last_Block :
              Types.Block (1 .. My_Share.all.Metadata.Last_Block_Size);
         begin
            Read_Block
              (My_Share.all.Share_Stream, Last_Block,
               My_Share.all.Metadata.Last_Block_Padding);
            return Last_Block;
         end;
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
      Header              : Share_Header;
      New_Share           : constant Share_Access := new Share;
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
      Open (New_Share.Share_File, In_File, File);
      S := Stream (New_Share.Share_File);
      Share_Header'Read (S, Header);
      Share_Data_Header'Read (S, Data_Header);
      declare
         Current_Index : constant Positive_Count :=
           Index (New_Share.Share_File);
      begin
         Set_Index
           (New_Share.Share_File,
            Count (Data_Header.URI_Extension_Offset + 4));
         Read_URI_Extension_Block (S, URI_Extension_Block);
         --  we set the old index to continue with reading the share file
         Set_Index (New_Share.Share_File, Current_Index);
      end;

      declare
         Block_Size               : constant Positive     :=
           (Positive (URI_Extension_Block.Segment_Size) +
            (Positive (URI_Extension_Block.Needed_Shares) - 1)) /
           Positive (URI_Extension_Block.Needed_Shares);
         Block_Size_In_Words      : constant Positive := (Block_Size + 3) / 4;
         Block_Padding            : Natural;
         Data_Size_In_Words       : constant Natural      :=
           (Integer (Data_Header.Data_Size) + 3) / 4;
         Block_Array_Size         : constant Natural      :=
           ((Data_Size_In_Words - 1) / Block_Size_In_Words);
         Last_Block_Size          : constant Natural      :=
           (Natural (URI_Extension_Block.Tail_Codec_Params.Segment_Size) +
            (Natural (URI_Extension_Block.Needed_Shares) - 1)) /
           Natural (URI_Extension_Block.Needed_Shares);
         Last_Block_Size_In_Words : constant Natural      :=
           (Last_Block_Size + 3) / 4;
         Last_Block               : constant Block_Access :=
           new Block (1 .. Last_Block_Size_In_Words);
         Last_Block_Padding       : Natural;
         Share_Number             : constant Natural      :=
           Natural'Value
             (Ada.Strings.Unbounded.To_String (Get_Basename (File)));
         Metadata                 : Share_Metadata;
      begin
         if Block_Size mod 4 = 0 then
            Block_Padding := 0;
         else
            Block_Padding := (4 - Block_Size mod 4);
         end if;
         if Block_Size mod 4 = 0 then
            Block_Padding := 0;
         else
            Block_Padding := (4 - Block_Size mod 4);
         end if;
         -- Fill in the metadata record
         Metadata.Block_Size         := Block_Size_In_Words;
         Metadata.Data_Size          := Data_Size_In_Words;
         Metadata.Last_Block_Size    := Last_Block_Size_In_Words;
         Metadata.Block_Array_Size   := Block_Array_Size;
         Metadata.Block_Padding      := Block_Padding;
         Metadata.Last_Block_Padding := Last_Block_Padding;

         New_Share.Share_Stream        := S;
         New_Share.Share_Number        := Share_Number;
         New_Share.Header              := Header;
         New_Share.URI_Extension_Block := URI_Extension_Block;
         New_Share.Data_Header         := Data_Header;
         New_Share.Metadata            := Metadata;
         return New_Share;
      end;
   end Read_Share;

   procedure Finalize (S : in out Share) is
   begin
      null;
      if Is_Open (S.Share_File) then
         Close (S.Share_File);
      end if;
   end Finalize;

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
