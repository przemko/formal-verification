-- $ gnatprove -P turing.gpr --prover=z3 --steps=250

with Ada.Text_IO; use Ada.Text_IO;
with Turing; use Turing;

procedure Main is
begin
   Put_Line( Natural'Image (Comp (12)));
end Main;
