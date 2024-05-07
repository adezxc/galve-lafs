with Ada.Streams;
with Ada.Streams.Stream_IO;
with Types;               use Types;
with URI_Extension_Block; use URI_Extension_Block;
with Ada.Finalization;

package Share is

   type Share_Header is record
      Version      : Word;
      Data_Length  : Word;
      Lease_number : Word;
   end record;

   type Share_Data_Header is record
      Version                    : Word;
      Block_Size                 : Word_64;
      Data_Size                  : Word_64;
      Data_Offset                : Word_64;
      Plaintext_Hash_Tree_Offset : Word_64;
      Crypttext_Hash_Tree_Offset : Word_64;
      Block_Hashes_Offset        : Word_64;
      Share_Hashes_Offset        : Word_64;
      URI_Extension_Offset       : Word_64;
   end record;

   -- Helper record to store size of blocks and what not in Words, not bytes
   type Share_Metadata is record
      Data_Size          : Natural;
      Block_Size         : Natural;
      Last_Block_Size    : Natural;
      Block_Array_Size   : Natural;
      Block_Padding      : Natural;
      Last_Block_Padding : Natural;
   end record;

   type Share is new Ada.Finalization.Limited_Controlled with record
      Share_Number        : Natural;
      Header              : Share_Header;
      Data_Header         : Share_Data_Header;
      Metadata            : Share_Metadata;
      URI_Extension_Block : Share_URI_Extension_Block;
      Current_Block       : Natural := 0;

      -- Opened share file, as we want to get the blocks sequentially and not read the full file into memory
      Share_File   : Ada.Streams.Stream_IO.File_Type;
      Share_Stream : Ada.Streams.Stream_IO.Stream_Access;
   end record;

   overriding procedure Finalize (S : in out Share);

   type Share_Access is access Share;

   type Share_Access_Array is array (Integer range <>) of Share_Access;

   procedure Sort (Shares : in out Share_Access_Array);

   procedure Read_Share_Data_Header
     (Stream :     access Ada.Streams.Root_Stream_Type'Class;
      Item   : out Share_Data_Header);
   function Read_Share (File : String) return Share_Access;
   procedure Display_Share_Headers (My_Share : Share);
   function Next_Block (My_Share : Share_Access) return Block;

   for Share_Data_Header'Read use Read_Share_Data_Header;

end Share;
