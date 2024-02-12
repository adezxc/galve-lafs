with Ada.Streams;
with Types;               use Types;
with URI_Extension_Block; use URI_Extension_Block;

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

   type Share (Block_Size_Discr, Block_Array_Size_Discr : Natural) is record
      Header              : Share_Header;
      Data_Header         : Share_Data_Header;
      Blocks : Block_Array (Block_Size_Discr, Block_Array_Size_Discr);
      Last_Block          : Block_Access;
      URI_Extension_Block : Share_URI_Extension_Block;
      Current_Block       : Natural := 1;
      Share_Number        : Natural;
   end record;

   procedure Read_Share_Data_Header
     (Stream :     access Ada.Streams.Root_Stream_Type'Class;
      Item   : out Share_Data_Header);
   function Read_Share (File : String) return Share;
   procedure Display_Share_Headers (My_Share : Share);
   function Next_Block (My_Share : in out Share) return Block_Access;

   for Share_Data_Header'Read use Read_Share_Data_Header;
end Share;
