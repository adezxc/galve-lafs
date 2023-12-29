package Uri is
   type URI_Type is (CHK, SSK, SSK-RO, DIR2, DIR2-RO);
   function Get_Storage_Index (URI_String : String) return String;
   function Process_URI (URI_String : String) return String;
end Uri;
