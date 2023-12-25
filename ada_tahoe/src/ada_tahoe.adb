pragma Ada_2022;
with Ada.Text_IO;      use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with fec_h;            use fec_h;
with stddef_h;         use stddef_h;
with Tahoe;            use Tahoe;
with Share;            use Share;
with System;

procedure Ada_Tahoe is
begin
   if Argument_Count = 3 then
      declare
         Segment_Size_Value : constant Integer := 131_072;
         Share1              : Share.Share                       :=
           Share.Read_Share
             (Segment_Size => Segment_Size_Value, Required_Shares => 3,
              File         => Argument (1));
         Share2              : Share.Share                       :=
           Share.Read_Share
             (Segment_Size => Segment_Size_Value, Required_Shares => 3,
              File         => Argument (2));
         Share3              : Share.Share                       :=
           Share.Read_Share
             (Segment_Size => Segment_Size_Value, Required_Shares => 3,
              File         => Argument (3));
         Decoder             : constant access fec_t := fec_new (3, 10);
         Blocks_For_Decoding : Share.Block_Access_Array (0 .. 2) :=
           (Next_Block (Share1), Next_Block (Share2), Next_Block (Share3));
         Indices             : TestArray := (3, 5, 8);
         Blocks_For_Result : Share.Block_Access_Array (0 .. 2) :=
           (new Share.Block (0 .. Integer(Share1.Data_Header.Block_Size / 4) ),
            new Share.Block (0 .. Integer(Share1.Data_Header.Block_Size / 4) ),
            new Share.Block (0 .. Integer(Share1.Data_Header.Block_Size / 4) ));
         Block_Addresses  : Block_Address_Array (0 .. 2) := Share.Convert(Blocks_For_Decoding);
         Block_Addresses_Output : Block_Address_Array (0 .. 2) := Share.Convert(Blocks_For_Result);
      begin
         for B of Blocks_For_Decoding loop
            Put
              (B.all (1 .. (if B.all'Last < 3 then B.all'Last else 3))'Image &
               ", ");
            New_Line;
         end loop;

         fec_decode
           (Decoder, Block_Addresses'Address, Block_Addresses_Output'Address,
            Indices (Indices'First)'Access, size_t (Share1.Data_Header.Block_Size));

         Put_Line ("The first few words of the decoder block:");

         for B of Blocks_For_Result loop
            Put
              (B.all (1 ..  B.all'Last)'Image &
              --  (B.all (1 .. (if B.all'Last < 3 then B.all'Last else 3))'Image &
               ", ");
            New_Line;
         end loop;

      end;
   else
      Put_Line
        (Command_Name & ": " & "Please provide three share files " &
         "as arguments e.g ./ada_tahoe share1 share2 share3");
   end if;
   return;
end Ada_Tahoe;
