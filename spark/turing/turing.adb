package body Turing with SPARK_Mode is

   function Comp (N : Natural) return Natural
   is
      FactorialR : Natural := 1 with Ghost;
      U : Natural := 1;
      V : Natural;
   begin
      for R in 0 .. N - 1 loop
         -- FactorialR = R!
         pragma Loop_Invariant (U = FactorialR);
         V := U;
         for S in 1 .. R loop
            U := U + V;
            pragma Loop_Invariant (U = V + S * V);
         end loop;
         FactorialR := FactorialR * (R + 1);
      end loop;
      -- FactorialR = 1 * 1 * 2 * ... * N = N!
      pragma Assert (U = FactorialR);
      return U;
   end Comp;

end Turing;
