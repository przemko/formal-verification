package body Fibonacci with SPARK_Mode is

   function Comp (N: Fibonacci_Argument_Type) return Natural
   is
      X : Natural := 0;
      Y : Natural := 1;
      Z : Natural := 1;
   begin
      case N is
      when 0 =>
         return 0;
      when 1 =>
         return 1;
      when others =>
         for I in 2 .. N loop
            Z := X + Y;
            pragma Loop_Invariant (X = Fibonacci(I - 2));
            pragma Loop_Invariant (Y = Fibonacci(I - 1));
            pragma Loop_Invariant (Z = Fibonacci(I    ));
            X := Y;
            Y := Z;
         end loop;
         return Z;
      end case;
   end Comp;

end Fibonacci;

