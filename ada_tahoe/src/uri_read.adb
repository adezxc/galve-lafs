with Ada.Strings.Fixed;
with Ada.Strings.Maps;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Assertions;        use Ada.Assertions;
with Ada.Characters.Handling;
with Base32;
with Uint_Types;
with Sha256d;

use Ada.Strings;

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
      use Ada.Characters.Handling;
      use Base32;
      use Uint_Types;
      use Sha256d;

      Tag : constant String :=
        "43:allmydata_immutable_key_to_storage_index_v1,";

      Decoded_Key           : constant String   := Decode (URI_Object.Key);
      Decoded_Storage_Index : constant Uint_256 :=
        Tagged_Double_Hash (Tag, Decoded_Key);
   begin
      return
        To_Lower (Encode (Uint_256_String (Decoded_Storage_Index))) (1 .. 16);
   end Get_Storage_Index;

   function Process_URI (URI_String : String) return URI is
      First       : Positive;
      Last        : Natural                     := 0;
      Semicolon   : constant Maps.Character_Set := Maps.To_Set (":");
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
         Type_URI   : constant URI_Type :=
           Uri_Type_From_String (To_String (Ada_Strings (1)));
         Key        : constant String   := To_String (Ada_Strings (2));
         Return_URI : URI (Type_URI);
      begin
         Return_URI.Key := Key;
         case Type_URI is
            when CHK =>
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

   function URI_To_String (Value : URI) return String is
      use Ada.Strings.Fixed;
   begin
      case Value.Option is
         when CHK =>
            return
              "URI:" & Value.Option'Image & ":" & Value.Key & ":" &
              Value.Hash & ":" &
              Trim (Value.Needed_Shares'Image, Ada.Strings.Left) & ":" &
              Trim (Value.Total_Shares'Image, Ada.Strings.Left) & ":" &
              Trim (Value.Size'Image, Ada.Strings.Left);
         when SSK .. DIR2RO =>
            return
              "URI:" & Value.Option'Image & ":" & Value.Key & ":" &
              Value.Fingerprint;
      end case;
   end URI_To_String;
end Uri_Read;
