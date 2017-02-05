-- $ gnatprove -P fibonacci.gpr --prover=z3

with Ada.Text_IO; use Ada.Text_IO;
with Fibonacci;   use Fibonacci;

procedure Main is

   package Natural_IO is new Ada.Text_IO.Integer_IO (Natural);
   use Natural_IO;

   N : Natural;

begin
   Put_Line ("podaj argument N dla funkcji Fibonacci: ");
   Get (N);
   Put_Line ("Fibonacci ("
             & Natural'Image (N)
             & ") = "
             & Natural'Image (Comp (N)));
end Main;
