package body Bubbles with SPARK_Mode is

   procedure Sort (T : in out Table) is

      T_Last : Table (T'Range) with Ghost;

   begin
      for I in reverse T'First .. T'Last loop

         T_Last := T;

         pragma Loop_Invariant (Is_Sorted (T (I  .. T'Last)));

         for J in T'First .. I - 1 loop

            if T (J) > T (J + 1) then
               declare
                  Temp : Integer := T (J);
               begin
                  T (J) := T (J + 1);
                  T (J + 1) := Temp;
               end;
            end if;

            pragma Loop_Invariant (Is_Maximum (T (T'First .. J + 1), T (J + 1)));

         end loop;

         pragma Assert (for all J in I + 1 .. T'Last => T (J) = T_Last (J));

      end loop;
   end Sort;

end Bubbles;
