<<<<<<< HEAD
-- $ gnatprove -P automata.gpr --level=1

=======
>>>>>>> 3f5725c7c7ae00a8c24395983427ea6f3cfb78d2
with Ada.Text_IO; use Ada.Text_IO;
with Automata;   use Automata;

procedure Main is
  N : Natural := 1968 * 3 + 1;
  W : String := Natural'Image (N);
  Trans : Trans_Table (0 .. 2, '0' .. '9') := 
    (0 => (0, 1, 2, 0, 1, 2, 0, 1, 2, 0),
     1 => (1, 2, 0, 1, 2, 0, 1, 2, 0, 1),
     2 => (2, 0, 1, 2, 0, 1, 2, 0, 1, 2));
begin
  Put_Line ("   State = " & Natural'Image (Automaton (W (W'First + 1 .. W'Last), Trans)));
  Put_Line ("Reminder = " & Integer'Image (N rem 3));
end Main;

