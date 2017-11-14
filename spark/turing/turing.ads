package Turing with SPARK_Mode is

   function Comp (N : Natural) return Natural
     with
<<<<<<< HEAD
       Pre => N <= 12;

=======
     Pre => N > 0 and N <= 12;
   
>>>>>>> cded0f1ed72b6c808cd5fa2900291de59bdd8024
end Turing;
