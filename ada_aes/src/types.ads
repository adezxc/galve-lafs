with Interfaces.C;

package Types is
   subtype Operation is Integer range 0 .. 1;

   Encrypt : Operation := 1;
   Decrypt : Operation := 0;

   package C renames Interfaces.C;
   type Byte is new C.unsigned_char;
   type Byte_Array is array (Natural range <>) of aliased Byte;

   EVP_MAX_BLOCK_LENGTH : constant Integer := 32;
   BUFSIZE              : constant Integer := 4_096;
end Types;
