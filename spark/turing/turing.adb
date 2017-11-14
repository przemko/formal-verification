-- test
package body Turing with SPARK_Mode is

   function Comp (N : Natural) return Natural
   is
      Factorial : Natural := 1 with Ghost;
<<<<<<< HEAD
      U : Natural := 1;
      V : Natural;
   begin
      for R in 1 .. N - 1 loop
         Factorial := Factorial * R;
         pragma Loop_Invariant (U = Factorial);
         V := U;
         for S in 1 .. R loop
            U := U + V;
            pragma Loop_Invariant (U = V + S * V);
         end loop;
=======
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
>>>>>>> cded0f1ed72b6c808cd5fa2900291de59bdd8024
      end loop;
      pragma Assert (U = Factorial);
      return U;
   end Comp;

end Turing;
