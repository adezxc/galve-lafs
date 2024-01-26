with Ada.Strings.Fixed, Ada.Strings.Maps.Constants, Ada.Text_IO;
use Ada.Text_IO, Ada.Strings;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Assertions;        use Ada.Assertions;

package body Uri_Read is
   function Uri_Type_From_String (Uri_Type_String : String) return URI_Type is
   begin
      case URI_Type'Value (Uri_Type_String) is
         when CHK =>
            return CHK;
         when SSK =>
            return SSK;
         when SSKRO =>
            return SSKRO;
         when DIR2 =>
            return DIR2;
         when DIR2RO =>
            return DIR2RO;
      end case;
   exception
      when Constraint_Error =>
         raise Constraint_Error
           with "There is no " & Uri_Type_String & "URI Type";
   end Uri_Type_From_String;

   function Get_Storage_Index (URI_Object : URI) return String is
   begin
      return "";
   end Get_Storage_Index;

   function Process_URI (URI_String : String) return URI is
      First       : Positive;
      Last        : Natural            := 0;
      Semicolon   : Maps.Character_Set := Maps.To_Set (":");
      Ada_Strings :
        array (0 .. Fixed.Count (URI_String, Semicolon)) of Unbounded_String;
   begin
      for I in Ada_Strings'First .. Ada_Strings'Last loop
         declare
            Buffer : constant String :=
              URI_String (Last + 1 .. URI_String'Last);
         begin
            Fixed.Find_Token
              (Source => Buffer, Set => Semicolon, Test => Outside,
               First  => First, Last => Last);
            Ada_Strings (I) := To_Unbounded_String (Buffer (First .. Last));
         end;
      end loop;
      Assert (Ada_Strings (0) = "URI");
      declare
         Type_URI   : URI_Type :=
           Uri_Type_From_String (To_String (Ada_Strings (1)));
         Key        : String   := To_String (Ada_Strings (2));
         Return_URI : URI (Type_URI);
      begin
         case Type_URI is
            when CHK =>
               Put (To_String (Ada_Strings (3))'Length'Image);
               Return_URI.Hash          := To_String (Ada_Strings (3));
               Return_URI.Needed_Shares :=
                 Share_Count'Value (To_String (Ada_Strings (4)));
               Return_URI.Total_Shares  :=
                 Share_Count'Value (To_String (Ada_Strings (5)));
               Return_URI.Size := Word_64'Value (To_String (Ada_Strings (6)));
            when SSK .. DIR2RO =>
               Return_URI.Fingerprint := To_String (Ada_Strings (3));
         end case;
         return Return_URI;
      end;
   end Process_URI;

   procedure Put_URI_Image
     (Output : in out Ada.Strings.Text_Buffers.Root_Buffer_Type'Class;
      Value  :        URI)
   is
   begin
      case Value.Option is
         when CHK =>
            Output.Put
              ("URI:" & Value.Option'Image & ":" & Value.Key & ":" &
               Value.Hash & ":" & Value.Needed_Shares'Image & ":" &
               Value.Total_Shares'Image & Value.Size'Image);
         when SSK .. DIR2RO =>
            Output.Put
              ("URI:" & Value.Option'Image & ":" & Value.Key & ":" &
               Value.Fingerprint);
      end case;
   end Put_URI_Image;
end Uri_Read;
