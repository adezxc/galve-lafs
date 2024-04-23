with Interfaces.C;

package body File_Decoder is
   function New_File_Decoder
     (URI           : Uri_Read.URI; Share_Files : Unbounded_String_Array;
      Buffer_Size   : Positive;
      Output_Stream : access Ada.Streams.Root_Stream_Type'Class)
      return File_Decoder
   is

      FD : File_Decoder;
      IV : constant Aes.IV := (others => Character'Val (0));

      K : constant Interfaces.C.unsigned_short :=
        Interfaces.C.unsigned_short (URI.Needed_Shares);
      M : constant Interfaces.C.unsigned_short :=
        Interfaces.C.unsigned_short (URI.Total_Shares);
   begin
      FD.URI := URI;

      FD.FEC_Decoder := fec_h.fec_new (K, M);
      FD.Decryptor   := Aes.New_Decryptor (FD.URI.Key, IV, Buffer_Size);

      FD.Output := Output_Stream;

      return FD;
   end New_File_Decoder;

   procedure Finalize (FD : in out File_Decoder) is

   begin
      fec_h.fec_free (FD.FEC_Decoder);
      Aes.Finalize (FD.Decryptor);
   end Finalize;

end File_Decoder;
