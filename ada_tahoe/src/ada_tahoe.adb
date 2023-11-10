pragma Ada_2022;
with Ada.Text_IO;      use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with fec_h;            use fec_h;
with stddef_h;         use stddef_h;
--  with Tahoe;            use Tahoe;
with Share;
with System;

procedure Ada_Tahoe is
begin
   if Argument_Count = 3 then
      declare
         Share1              : constant Share.Share              :=
           Share.Read_Share
             (Segment_Size => 131_072, Required_Shares => 3,
              File         => Argument (1));
         Share2              : constant Share.Share              :=
           Share.Read_Share
             (Segment_Size => 131_072, Required_Shares => 3,
              File         => Argument (2));
         Share3              : constant Share.Share              :=
           Share.Read_Share
             (Segment_Size => 131_072, Required_Shares => 3,
              File         => Argument (3));
         Decoder             : access fec_t := fec_new (3, 10);
         Blocks_For_Decoding : Share.Block_Access_Array (1 .. 3) :=
           (Share1.Blocks.Values (1), Share2.Blocks.Values (1),
            Share3.Blocks.Values (1));
         Indices             : TestArray                         := (3, 5, 6);
      begin
         Ada.Text_IO.Put_Line (Indices (0)'Address'Image);
         Ada.Text_IO.Put_Line (Indices (1)'Address'Image);
         Ada.Text_IO.Put_Line (Indices (2)'Image);
         fec_decode
           (Decoder, Blocks_For_Decoding'Address, Blocks_For_Decoding'Address,
            Indices (0)'Access, size_t (Share1.Data_Header.Block_Size));
      end;
   else
      Put_Line
        (Command_Name & ": " & "Please provide three share files " &
         "as arguments e.g ./ada_tahoe share1 share2 share3");
   end if;
   --  if Argument_Count > 0 then
   --     Put_Line (Storage_Index_From_File_Key (Argument (1)));
   --  else
   --     Put_Line
   --       (Command_Name & ": " & "Please provide a Tahoe-LAFS third " &
   --        "capability component (read key) as an argument");
   --  end if;
   return;
end Ada_Tahoe;
