with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;           use Ada.Text_IO;

package body URI_Extension_Block is

   procedure Read_URI_Extension_Block
     (Stream    :     access Ada.Streams.Root_Stream_Type'Class;
      URI_Block : out Share_URI_Extension_Block)
   is
      Letter        : String (1 .. 1);
      Current_Value : Unbounded_String;
      Value_Count   : Integer := 0;
   begin
      --  We read through the whole URI extension block letter by letter. If
      --  we find one of the keys, we initiate it's reading, in all cases
      --  key, length of the value and the value itself are separated by
      --  semicolons, and the key-values by commas so
      --  we just discard them by reading them to a Junk_Variable and then
      --  actually parse the things we need.
      --  Detailed example is described in Read_Codec_Name
      while Value_Count < 11 loop
         String'Read (Stream, Letter);
         Current_Value := Current_Value & Letter;
         if Key_Map.Contains (To_String (Current_Value)) then
            case Key_Map (To_String (Current_Value)) is
               when Codec_Name =>
                  Read_Codec_Name (Stream, URI_Block.Codec_Name);
                  String'Read (Stream, Letter);
               when Codec_Params =>
                  Read_Codec_Params (Stream, URI_Block.Codec_Params);
               when Crypttext_Hash =>
                  Read_Hash (Stream, URI_Block.Crypttext_Hash);
               when Crypttext_Root_Hash =>
                  Read_Hash (Stream, URI_Block.Crypttext_Root_Hash);
               when Needed_Shares =>
                  Read_Share_Count (Stream, URI_Block.Needed_Shares);
               when Segment_Count =>
                  Read_Unsigned_64 (Stream, URI_Block.Segment_Count);
               when Share_Root_Hash =>
                  Read_Hash (Stream, URI_Block.Share_Root_Hash);
               when Segment_Size =>
                  Read_Unsigned_64 (Stream, URI_Block.Segment_Size);
               when Size =>
                  Read_Unsigned_64 (Stream, URI_Block.Size);
               when Tail_Codec_Params =>
                  Read_Codec_Params (Stream, URI_Block.Tail_Codec_Params);
               when Total_Shares =>
                  Read_Share_Count (Stream, URI_Block.Total_Shares);
            end case;
            Current_Value := To_Unbounded_String ("");
            Value_Count   := Value_Count + 1;
         end if;
      end loop;
   end Read_URI_Extension_Block;

   procedure URI_Extension_Block_To_String
     (URI_Block : in Share_URI_Extension_Block)
   is
   begin
      Put_Line ("Codec Name" & URI_Block.Codec_Name);
      Put_Line ("Total_Shares" & URI_Block.Total_Shares'Image);
   end URI_Extension_Block_To_String;

   procedure Read_Codec_Name
     (Stream     :     access Ada.Streams.Root_Stream_Type'Class;
      Codec_Name : out String)
   is
   begin
      Read_Junk (Stream);
      -- Read the needed value
      String'Read (Stream, Codec_Name);
   end Read_Codec_Name;

   procedure Read_Codec_Params
     (Stream       :     access Ada.Streams.Root_Stream_Type'Class;
      Codec_Params : out Share_Codec_Params)
   is
      Current_Value : Unbounded_String;
      Current_Char  : Character;
   begin
      Read_Junk (Stream);

      loop
         Character'Read (Stream, Current_Char);
         if Current_Char = '-' then
            exit;
         end if;
         Current_Value := Current_Value & Current_Char;
      end loop;
      Codec_Params.Segment_Size :=
        Unsigned_64'Value (To_String (Current_Value));
      Current_Value             := To_Unbounded_String ("");
      loop
         Character'Read (Stream, Current_Char);
         if Current_Char = '-' then
            exit;
         end if;
         Current_Value := Current_Value & Current_Char;
      end loop;
      Codec_Params.Needed_Shares :=
        Share_Count'Value (To_String (Current_Value));
      Current_Value              := To_Unbounded_String ("");
      loop
         Character'Read (Stream, Current_Char);
         if Current_Char = ',' then
            exit;
         end if;
         Current_Value := Current_Value & Current_Char;
      end loop;
      Codec_Params.Total_Shares :=
        Share_Count'Value (To_String (Current_Value));
   end Read_Codec_Params;

   procedure Read_Hash
     (Stream :     access Ada.Streams.Root_Stream_Type'Class;
      Hash   : out Byte_Array)
   is
   begin
      Read_Junk (Stream);

      Byte_Array'Read (Stream, Hash);
   end Read_Hash;

   procedure Read_Share_Count
     (Stream :     access Ada.Streams.Root_Stream_Type'Class;
      Value  : out Share_Count)
   is
      Current_Value : Unbounded_String;
      Current_Char  : Character;
   begin
      Read_Junk (Stream);
      loop
         Character'Read (Stream, Current_Char);
         if Current_Char = ',' then
            exit;
         end if;
         Current_Value := Current_Value & Current_Char;
      end loop;
      Value := Share_Count'Value (To_String (Current_Value));
   end Read_Share_Count;

   procedure Read_Unsigned_64
     (Stream :     access Ada.Streams.Root_Stream_Type'Class;
      Value  : out Unsigned_64)
   is
      Current_Value : Unbounded_String;
      Current_Char  : Character;
   begin
      Read_Junk (Stream);
      loop
         Character'Read (Stream, Current_Char);
         if Current_Char = ',' then
            exit;
         end if;
         Current_Value := Current_Value & Current_Char;
      end loop;
      Value := Unsigned_64'Value (To_String (Current_Value));
   end Read_Unsigned_64;

   procedure Read_Junk (Stream : access Ada.Streams.Root_Stream_Type'Class) is
      Junk_String     : Character;
      Semicolon_Count : Integer := 0;
   begin
      while Semicolon_Count /= 2 loop
         Character'Read (Stream, Junk_String);
         if Junk_String = ':' then
            Semicolon_Count := Semicolon_Count + 1;
         end if;
      end loop;
   end Read_Junk;
begin
   Key_Map.Insert ("codec_name", Codec_Name);
   Key_Map.Insert ("codec_params", Codec_Params);
   Key_Map.Insert ("crypttext_hash", Crypttext_Hash);
   Key_Map.Insert ("crypttext_root_hash", Crypttext_Root_Hash);
   Key_Map.Insert ("needed_shares", Needed_Shares);
   Key_Map.Insert ("num_segments", Segment_Count);
   Key_Map.Insert ("share_root_hash", Share_Root_Hash);
   Key_Map.Insert ("segment_size", Segment_Size);
   Key_Map.Insert ("size", Size);
   Key_Map.Insert ("tail_codec_params", Tail_Codec_Params);
   Key_Map.Insert ("total_shares", Total_Shares);
end URI_Extension_Block;
