with Interfaces; use Interfaces;
with System;     use System;
with Ada.Streams.Stream_IO;

package Share is

   type Byte is new Interfaces.Unsigned_8;
   type Kilobyte is array (Integer range 0 .. 1_023) of Byte;
   type Kilobyte_array is array (Integer range <>) of Kilobyte;

   type Share_Header is record
      Version                    : Unsigned_32;
      Data_Length                : Unsigned_32;
      Lease_number               : Unsigned_32;
      Version_Junk               : Unsigned_32;
      --  unused as it can be calculated from the URI
      Block_Size                 : Unsigned_32;
      Data_Size                  : Unsigned_32;
      Data_Offset                : Unsigned_32;
      Plaintext_Hash_Tree_Offset : Unsigned_32;
      Crypttext_Hash_Tree_Offset : Unsigned_32;
      Block_Hashes_Offset        : Unsigned_32;
      Share_Hashes_Offset        : Unsigned_32;
      URI_Extension_Offset       : Unsigned_32;
   end record;

   for Share_Header use record
      Version at 0 range 0 .. 32;
      --  Data_Length                : Unsigned_32;
      --  Lease_number               : Unsigned_32;
      --  Version_Junk               : Unsigned_32;
      --  --  unused as it can be calculated from the URI
      --  Block_Size                 : Unsigned_32;
      --  Data_Size                  : Unsigned_32;
      --  Data_Offset                : Unsigned_32;
      --  Plaintext_Hash_Tree_Offset : Unsigned_32;
      --  Crypttext_Hash_Tree_Offset : Unsigned_32;
      --  Block_Hashes_Offset        : Unsigned_32;
      --  Share_Hashes_Offset        : Unsigned_32;
      --  URI_Extension_Offset       : Unsigned_32;
   end record;

   for Share_Header'Bit_Order use High_Order_First;
   for Share_Header'Scalar_Storage_Order use High_Order_First;

   procedure Read_Share (Segment_Size : Positive; Required_Shares : Positive);
   procedure Display_Share_Content (My_Share_Header : Share_Header);
   procedure Read_Blocks
     (My_Share_Header : Share_Header;
      Share_File      : Ada.Streams.Stream_IO.File_Type);
end Share;
