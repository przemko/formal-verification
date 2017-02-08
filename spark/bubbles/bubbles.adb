package body Bubbles with SPARK_Mode is

   procedure Sort (T : in out Table) is
   begin
      for I in reverse T'First .. T'Last - 1 loop
         pragma Loop_Invariant (Is_Sorted (T (I + 1 .. T'Last)));
         for J in T'First .. I loop
            if T (J) > T (J + 1) then
               declare
                  Temp : Integer := T (J);
               begin
                  T (J) := T (J + 1);
                  T (J + 1) := Temp;
               end;
            end if;
            pragma Loop_Invariant (Is_Maximum (T (T'First .. I), T (I)));
         end loop;
      end loop;
   end Sort;

end Bubbles;
