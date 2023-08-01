with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Tahoe; use Tahoe;

procedure Ada_Tahoe is
begin
   if Argument_Count > 0 then
      Put_Line (Storage_Index_From_File_Key (Argument (1)));
   else
      Put_Line (Command_Name & ": " & 
                  "Please provide a Tahoe-LAFS third " &
                  "capability component (read key) as an argument");
   end if;
   return;
end Ada_Tahoe;
