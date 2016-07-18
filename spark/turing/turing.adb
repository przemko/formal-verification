package body Turing with SPARK_Mode is

   function Comp (N : Natural) return Natural
   is
      U : Natural := 1;
      V : Natural;
   begin
      for R in 1 .. N - 1 loop
         pragma Loop_Invariant (U = Factorial (R));
         V := U;
         for S in 1 .. R loop
            U := U + V;
            pragma Loop_Invariant (U = V + S * V);
         end loop;
      end loop;
      return U;
   end Comp;

end Turing;
