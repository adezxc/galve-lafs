pragma Ada_2022;
with Share;       use Share;
with fec_h;       use fec_h;
with stddef_h;    use stddef_h;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Sequential_IO;

package body Decoder is
   procedure Decode_File (Share_Name1, Share_Name2, Share_Name3 : String) is
      Segment_Size_Value : constant Integer := 131_072;
      Share1             : Share.Share      :=
        Read_Share
          (Segment_Size => Segment_Size_Value, Required_Shares => 3,
           File         => Share_Name1);
      Share2             : Share.Share      :=
        Read_Share
          (Segment_Size => Segment_Size_Value, Required_Shares => 3,
           File         => Share_Name2);
      Share3             : Share.Share      :=
        Read_Share
          (Segment_Size => Segment_Size_Value, Required_Shares => 3,
           File         => Share_Name3);

      Decoder                : constant access fec_t := fec_new (3, 10);
      Blocks_For_Decoding    : Share.Block_Access_Array (0 .. 2) :=
        (Next_Block (Share1), Next_Block (Share2), Next_Block (Share3));
      Indices                : TestArray                         := (0, 4, 7);
      Blocks_For_Result      : Share.Block_Access_Array (0 .. 2) :=
        ((new Share.Block (1 .. Blocks_For_Decoding (0)'Length)),
         (new Share.Block (1 .. Blocks_For_Decoding (1)'Length)),
         (new Share.Block (1 .. Blocks_For_Decoding (2)'Length)));
      Block_Addresses        : Block_Address_Array (0 .. 2)      :=
        Share.Convert (Blocks_For_Decoding);
      Block_Addresses_Output : Block_Address_Array (0 .. 2)      :=
        Share.Convert (Blocks_For_Result);
   begin
      -- Put_Line (Blocks_For_Decoding (0)'Length'Image);
      Put_Line (Blocks_For_Decoding (0)'Length'Image);
      fec_decode
        (Decoder, Block_Addresses'Address, Block_Addresses_Output'Address,
         Indices (Indices'First)'Access,
         size_t (((Blocks_For_Decoding (0)'Length) * 4)));
      for B of Blocks_For_Decoding loop
         Put (B.all (1 .. (if B.all'Last < 3 then B.all'Last else 3))'Image);
         -- (B.all (1 .. B.all'Last)'Image & ", ");
         New_Line;
      end loop;
      Blocks_For_Result (2) := Blocks_For_Result (1);
      Blocks_For_Result (1) := Blocks_For_Result (0);
      Blocks_For_Result (0) := Blocks_For_Decoding (0);
      Ada.Text_IO.Put_Line ("The first few words of the decoder block:");
      for B of Blocks_For_Result loop
         Put (B.all (1 .. (if B.all'Last < 3 then B.all'Last else 3))'Image);
         Put (B.all'Last'Image);
         New_Line;
      end loop;
      declare
         use Share.Word_IO;
         F         : Share.Word_IO.File_Type;
         Byte_F    : Share.Byte_IO.File_Type;
         File_Name : constant String := "output.dat";
         Temp      : Word            := 0;
      begin
         Create (F, Out_File, File_Name);
         for Word in
           Blocks_For_Result (0).all'First ..
             Blocks_For_Result (0).all'Last - 1
         loop
            Write_Little_Endian_Word (F, Blocks_For_Result (0).all (Word));
         end loop;
         Close (F);
         Share.Byte_IO.Open (Byte_F, Share.Byte_IO.Append_File, File_Name);
         Write_Little_Endian_Word_Without_Padding
           (Byte_F,
            Blocks_For_Result (0).all (Blocks_For_Result (0).all'Last));
         Share.Byte_IO.Close (Byte_F);
         Open (F, Append_File, File_Name);
         for Word in
           Blocks_For_Result (1).all'First ..
             Blocks_For_Result (1).all'Last - 1
         loop
            Write_Little_Endian_Word (F, Blocks_For_Result (1).all (Word));
         end loop;
         Close (F);
         Share.Byte_IO.Open (Byte_F, Share.Byte_IO.Append_File, File_Name);
         Write_Little_Endian_Word_Without_Padding
           (Byte_F,
            Blocks_For_Result (1).all (Blocks_For_Result (1).all'Last));
         Share.Byte_IO.Close (Byte_F);
         Open (F, Append_File, File_Name);
         for Word in
           Blocks_For_Result (2).all'First .. Blocks_For_Result (2).all'Last
         loop
            Write_Little_Endian_Word (F, Blocks_For_Result (2).all (Word));
         end loop;
         Write_Little_Endian_Word (F, Temp);
         Write_Little_Endian_Word (F, Temp);
         Close (F);
         -- Share.Byte_IO.Open (Byte_F, Share.Byte_IO.Append_File, File_Name);
         -- Write_Little_Endian_Word_Without_Padding
         --   (Byte_F,
         --    Blocks_For_Result (2).all (Blocks_For_Result (2).all'Last - 1));
         -- Share.Byte_IO.Close (Byte_F);
      end;
   end Decode_File;
end Decoder;
