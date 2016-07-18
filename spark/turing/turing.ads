package Turing with SPARK_Mode is

   function Factorial (N : Natural) return Natural
   is
     (if N = 0 then 1 else N * Factorial (N - 1))
   with
   Ghost,
   Pre => N <= 12,
   Contract_Cases =>
     (
      N = 0 => Factorial'Result = 1,
      others => Factorial'Result = N * Factorial (N - 1)
     );

   function Comp (N : Natural) return Natural
     with
       Pre => N <= 12,
       Post => Comp'Result = Factorial (N);

end Turing;
