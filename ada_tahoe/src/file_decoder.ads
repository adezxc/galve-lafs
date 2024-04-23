with fec_h;
with Aes;
with Ada.Finalization;
with Uri_Read;
with Ada.Strings.Unbounded;
with Ada.Streams;

package File_Decoder is
   type Argument_Index_Array is array (Natural range <>) of Integer;

   type Unbounded_String_Array is
     array (Positive range <>) of Ada.Strings.Unbounded.Unbounded_String;

   subtype Share_Name_Array is Unbounded_String_Array;

   type File_Decoder is new Ada.Finalization.Controlled with private;

   function New_File_Decoder
     (URI           : Uri_Read.URI; Share_Files : Unbounded_String_Array;
      Buffer_Size   : Positive;
      Output_Stream : access Ada.Streams.Root_Stream_Type'Class)
      return File_Decoder;

   procedure Finalize (FD : in out File_Decoder);
private
   type File_Decoder is new Ada.Finalization.Controlled with record
      URI         : Uri_Read.URI;
      FEC_Decoder : aliased access fec_h.fec_t;
      Decryptor   : aliased Aes.Decryptor;
      Output      : access Ada.Streams.Root_Stream_Type'Class;
   end record;
end File_Decoder;
