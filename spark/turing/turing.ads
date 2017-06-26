package Turing with SPARK_Mode is

   function Comp (N : Natural) return Natural
     with
       Pre => N <= 12;

end Turing;
