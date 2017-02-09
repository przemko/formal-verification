package body Bubbles with SPARK_Mode is

   procedure Sort (T : in out Table) is
   begin
      for I in reverse T'First .. T'Last loop

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

      end loop;
   end Sort;

end Bubbles;
