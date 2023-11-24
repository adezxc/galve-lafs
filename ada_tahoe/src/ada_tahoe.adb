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
         Indices             : TestArray                         := (1, 2, 3);

         Blocks_For_Result : Share.Block_Access_Array (1 .. 3) :=
           (new Share.Block (1 .. Segment_Size_Value / 3 + 1),
            new Share.Block (1 .. Segment_Size_Value / 3 + 1),
            new Share.Block (1 .. Segment_Size_Value / 3 + 1));
      begin
         for B of Blocks_For_Result loop
            B.all := (others => 0);
         end loop;

         for B of Blocks_For_Result loop
            Put
              (B.all (1 .. (if B.all'Last < 3 then B.all'Last else 3))'Image &
               ", ");
            New_Line;
         end loop;

         fec_decode
           (Decoder, Blocks_For_Decoding'Address, Blocks_For_Result'Address,
            Indices (0)'Access, size_t (Share1.Data_Header.Block_Size));

         Put_Line ("The first few words of the decoder block:");

         for B of Blocks_For_Result loop
            Put
              (B.all (1 .. (if B.all'Last < 3 then B.all'Last else 3))'Image &
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
