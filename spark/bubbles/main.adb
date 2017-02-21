with Ada.Text_IO; use Ada.Text_IO;
with Bubbles; use Bubbles;

procedure Main is
   T : Table (1 .. 5) := (5, 2, 3, 4, 1);
begin
   Sort (T);
   for I in T'Range loop
      Put (Integer'Image (T (I)));
   end loop;
   New_Line;
end Main;
