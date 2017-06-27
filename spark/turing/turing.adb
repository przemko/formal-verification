package body Turing with SPARK_Mode is

   function Comp (N : Natural) return Natural
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
   end Comp;

end Turing;
