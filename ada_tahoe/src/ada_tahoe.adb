with Ada.Text_IO;      use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
--  with Tahoe;            use Tahoe;
with Share;

procedure Ada_Tahoe is
begin
   if Argument_Count = 3 then
      declare
         Share1 : constant Share.Share :=
           Share.Read_Share
             (Segment_Size => 131_072, Required_Shares => 3,
              File         => Argument (1));
         Share2 : constant Share.Share :=
           Share.Read_Share
             (Segment_Size => 131_072, Required_Shares => 3,
              File         => Argument (2));
         Share3 : constant Share.Share :=
           Share.Read_Share
             (Segment_Size => 131_072, Required_Shares => 3,
              File         => Argument (3));
      begin
         Share.Display_Share_Headers (Share1);
         Share.Display_Share_Headers (Share2);
         Share.Display_Share_Headers (Share3);
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
