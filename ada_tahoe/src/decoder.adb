pragma Ada_2022;
with Share;        use Share;
with Types;        use Types;
with fec_h;        use fec_h;
with Ada.Text_IO;  use Ada.Text_IO;
with Interfaces.C; use Interfaces.C;

package body Decoder is
   procedure Decode_File (File_URI : URI; Share_Names : Share_Name_Array) is
      use Interfaces;
      Shares : Share_Access_Array (1 .. Share_Names'Length);

      type Share_Number_Array is
        array (1 .. Share_Names'Length) of aliased Integer;

      Share_Numbers : Share_Number_Array;

      Decoder : constant access fec_t :=
        fec_new
          (Interfaces.C.unsigned_short (File_URI.Needed_Shares),
           Interfaces.C.unsigned_short (File_URI.Total_Shares));

      Primary_Blocks            : Integer := 0;
      Decoding_Blocks           :
        Block_Access_Array (1 .. Integer (File_URI.Needed_Shares));
      Decoding_Blocks_Addresses :
        Block_Address_Array (1 .. Integer (File_URI.Needed_Shares));
      Result_Blocks             :
        Block_Access_Array (1 .. Integer (File_URI.Needed_Shares));
      Result_Block_Addresses    :
        Block_Address_Array (1 .. Integer (File_URI.Needed_Shares));
   begin
      for Index in Share_Names'Range loop
         Shares (Index) := Read_Share (To_String (Share_Names (Index)));
      end loop;
      Share.Sort (Shares);
      Put_Line (Shares (1).Header'Image);
      Put_Line (Shares (1).URI_Extension_Block'Image);
      Put_Line (Shares (1).Data_Header'Image);

      for Index in Shares'Range loop
         Share_Numbers (Index) := Shares (Index).Share_Number;
         if Share_Numbers (Index) < Integer (File_URI.Needed_Shares) then
            Primary_Blocks := Primary_Blocks + 1;
         end if;
      end loop;

      for I in 1 .. Integer (Shares (1).URI_Extension_Block.Segment_Count - 1)
      loop
         for J in 1 .. Integer (File_URI.Needed_Shares) loop
            Decoding_Blocks (J) := Next_Block (Shares (J));
            Result_Blocks (J)   := new Block (1 .. Decoding_Blocks (J)'Length);
         end loop;
         Decoding_Blocks_Addresses :=
           Convert_To_Address_Array (Decoding_Blocks);
         Result_Block_Addresses    := Convert_To_Address_Array (Result_Blocks);
         fec_decode
           (Decoder, Decoding_Blocks_Addresses'Address,
            Result_Block_Addresses'Address,
            Share_Numbers (Share_Numbers'First)'Access,
            size_t
              (Shares (1).URI_Extension_Block.Codec_Params.Segment_Size /
               Interfaces.Unsigned_64
                 (Shares (1).URI_Extension_Block.Codec_Params.Needed_Shares)));
         Result_Blocks (1) := Decoding_Blocks (1);
         Result_Blocks (2) := Decoding_Blocks (2);
         Result_Blocks (3) := Decoding_Blocks (3);

         declare
            use Byte_IO;
            F         : Byte_IO.File_Type;
            File_Name : constant String := "output.dat";
            Temp      : Word            := 0;
            Padding_N : Natural         :=
              Natural
                ((Result_Blocks (1).all'Length * 4) mod
                 Shares (1).Data_Header.Block_Size);
         begin
            Byte_IO.Open (F, Byte_IO.Append_File, File_Name);
            Write_Block (F, Result_Blocks (1), Padding => Padding_N);
            Write_Block (F, Result_Blocks (2), Padding => Padding_N);
            Write_Block (F, Result_Blocks (3), Padding => 0);
            Byte_IO.Close (F);
         end;
      end loop;
      for J in 1 .. Integer (File_URI.Needed_Shares) loop
         Decoding_Blocks (J) := Next_Block (Shares (J));
         Result_Blocks (J)   := new Block (1 .. Decoding_Blocks (J)'Length);
      end loop;
      Decoding_Blocks_Addresses := Convert_To_Address_Array (Decoding_Blocks);
      Result_Block_Addresses    := Convert_To_Address_Array (Result_Blocks);
      fec_decode
        (Decoder, Decoding_Blocks_Addresses'Address,
         Result_Block_Addresses'Address,
         Share_Numbers (Share_Numbers'First)'Access,
         size_t
           (Shares (1).URI_Extension_Block.Tail_Codec_Params.Segment_Size +
            2 /
              Interfaces.Unsigned_64
                (Shares (1).URI_Extension_Block.Tail_Codec_Params
                   .Needed_Shares)));
      Result_Blocks (1) := Decoding_Blocks (1);
      Result_Blocks (2) := Decoding_Blocks (2);
      Result_Blocks (3) := Decoding_Blocks (3);
      --  for Index in 1 .. Primary_Blocks loop
      --     Result_Blocks (Index + 1) := Result_Blocks (Index);
      --     Result_Blocks (Index)     := Decoding_Blocks (Index);
      --  end loop;

      declare
         use Byte_IO;
         F         : Byte_IO.File_Type;
         File_Name : constant String := "output.dat";
         Temp      : Word            := 0;
         Padding_N : Natural         :=
           Natural
             ((Result_Blocks (1).all'Length * 4) mod
              Shares (1).Last_Block.all'Length);
      begin
         Byte_IO.Open (F, Byte_IO.Append_File, File_Name);
         Write_Block (F, Result_Blocks (1), Padding => Padding_N);
         Write_Block (F, Result_Blocks (2), Padding => Padding_N);
         Write_Block (F, Result_Blocks (3), Padding => Padding_N);
         --  for Block of Result_Blocks loop
         --     if Padding_N /= 0 then
         --        Padding_N := Padding_N - 1;
         --        Write_Block (F, Block, Padding => True);
         --     else
         --        Write_Block (F, Block, Padding => True);
         --     end if;
         --  end loop;
         Byte_IO.Close (F);
      end;

   end Decode_File;
end Decoder;
