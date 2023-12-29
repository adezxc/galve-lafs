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
        ((new Share.Block (0 .. Blocks_For_Decoding (0)'Length)),
         (new Share.Block (0 .. Blocks_For_Decoding (0)'Length)),
         (new Share.Block (0 .. Blocks_For_Decoding (0)'Length)));
      Block_Addresses        : Block_Address_Array (0 .. 2)      :=
        Share.Convert (Blocks_For_Decoding);
      Block_Addresses_Output : Block_Address_Array (0 .. 2)      :=
        Share.Convert (Blocks_For_Result);
   begin
      Put_Line (Blocks_For_Decoding (0)'Length'Image);
      fec_decode
        (Decoder, Block_Addresses'Address, Block_Addresses_Output'Address,
         Indices (Indices'First)'Access,
         size_t (((Blocks_For_Decoding (0)'Length) * 4)));
      Blocks_For_Result (2) := Blocks_For_Decoding (0);
      for B of Blocks_For_Decoding loop
         Put (B.all (1 .. (if B.all'Last < 3 then B.all'Last else 3))'Image);
         -- (B.all (1 .. B.all'Last)'Image & ", ");
         New_Line;
      end loop;
      Ada.Text_IO.Put_Line ("The first few words of the decoder block:");
      for B of Blocks_For_Result loop
         Put (B.all (1 .. (if B.all'Last < 3 then B.all'Last else 3))'Image);
         -- (B.all (1 .. B.all'Last)'Image & ", ");
         New_Line;
      end loop;
      declare
         package Word_IO is new Ada.Sequential_IO (Share.Word);
         use Word_IO;
         F         : Word_IO.File_Type;
         File_Name : constant String := "output.dat";
      begin
         Create (F, Out_File, File_Name);
         for Word of Blocks_For_Result (0).all loop
            Write (F, Word);
         end loop;
         for Word of Blocks_For_Result (1).all loop
            Write (F, Word);
         end loop;
         for Word of Blocks_For_Result (2).all loop
            Write (F, Word);
         end loop;
         -- for B of Blocks_For_Result loop
         --    for Word of B.all loop
         --       Write (F, Word);
         --    end loop;
         -- end loop;
         Close (F);
      end;
   end Decode_File;
end Decoder;
