with Interfaces; use Interfaces;

function Queens (N : Integer) return Natural
is

   function T (A, B, C : Unsigned_32) return Natural
   is
      F : Natural := 1;
      E : Unsigned_32;
      D : Unsigned_32;
   begin
      if A /= 0 then
         E := A and not B  and not C;
         F := 0;
         while E /= 0 loop
            D := E and -E;
            F := F + T (A - D, (B + D) * 2, (C + D) / 2);
            E := E - D;
         end loop;
      end if;
      return F;
   end T;

begin
   return T (not Shift_Left (not 0, N), 0, 0);
end Queens;

