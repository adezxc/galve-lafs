with Interfaces.C; use Interfaces.C;

package Types is
   type Key is new char_array (1 .. 16);
   type IV is new char_array (1 .. 16);
   type Operation is new Integer range 0 .. 1;
end Types;
