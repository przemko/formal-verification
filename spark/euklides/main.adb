-- $ gnatprove -P euklides.gpr --level=2

with Ada.Text_IO; use Ada.Text_IO;
with Solve;

procedure Main is

   package Positive_IO is new Ada.Text_IO.Integer_IO (Positive);
   use Positive_IO;
   
   A, B : Positive;
   X, Y : Integer; 
   Z : Positive;

begin
   Put_Line ("Rozwiązywanie równania Ax + By = z w zbiorze liczb całkowitych.");
   Put_Line ("Podaj A: ");
   Get (A);
   Put_Line ("Podaj B: ");
   Get (B);
   Solve (A, B, X, Y, Z);
   Put_Line (Natural'Image (A) & " * (" & Integer'Image (X) & 
             ") + " & Natural'Image (B) & " * (" & Integer'Image (Y) & ")" & " = (" &
             Positive'Image (Z) & ")");
end Main;
