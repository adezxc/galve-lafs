with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Tahoe; use Tahoe;

procedure Ada_Tahoe is
begin
   Put_Line (Storage_Index_From_File_Key (Argument (1)));
   return;
end Ada_Tahoe;
