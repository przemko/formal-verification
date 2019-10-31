-- test
function Turing (N : Natural) return Natural
  with
    SPARK_Mode,
    Pre => N > 0 and N <= 12
is
   Factorial : Natural := 1 with Ghost;
   U         : Natural := 1;
begin
   for R in 1 .. N - 1 loop
      pragma Loop_Invariant (U = Factorial);
      declare
         V : Natural := U;
      begin
         for S in 1 .. R loop
            U := U + V;
            pragma Loop_Invariant (U = V + S * V);
         end loop;
      end;
      Factorial := Factorial * (R + 1);
   end loop;
   pragma Assert (U = Factorial);
   return U;
end Turing;
