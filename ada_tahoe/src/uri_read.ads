pragma Ada_2022;

with Ada.Strings.Text_Buffers;
with Share; use Share;

package Uri_Read is

   type URI_Type is (CHK, SSK, SSKRO, DIR2, DIR2RO);

   type URI (Option : URI_Type := CHK) is record
      Key : String (1 .. 26);
      case Option is
         when CHK =>
            Hash          : String (1 .. 52);
            Needed_Shares : Share_Count;
            Total_Shares  : Share_Count;
            Size          : Word_64;
         when SSK .. DIR2RO =>
            Fingerprint : String (1 .. 32);

      end case;
   end record with
     Put_Image => Put_URI_Image;

   procedure Put_URI_Image
     (Output : in out Ada.Strings.Text_Buffers.Root_Buffer_Type'Class;
      Value  :        URI);

   function Get_Storage_Index (URI_Object : URI) return String;
   function Process_URI (URI_String : String) return URI;

end Uri_Read;
