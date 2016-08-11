package Fibonacci with SPARK_Mode is

   subtype Fibonacci_Argument_Type is Natural range 0 .. 20;

   function Fibonacci (N : Fibonacci_Argument_Type) return Natural is
     (if N = 0 then
         0
      else
        (if N = 1 then
              1
         else
            Fibonacci (N - 1) + Fibonacci (N - 2)))
   with
     Ghost,
     Contract_Cases
       =>
         (N = 0 => Fibonacci'Result = 0,
          N = 1 => Fibonacci'Result = 1,
          others => Fibonacci'Result =  Fibonacci (N - 1) + Fibonacci (N - 2)), 
     Post 
       =>
         Fibonacci'Result <= Natural'Last / 2;

   function Comp (N : Fibonacci_Argument_Type) return Natural
   with
     Post
       =>
         Comp'Result = Fibonacci (N);

end Fibonacci;

