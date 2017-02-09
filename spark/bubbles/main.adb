with Ada.Text_IO; use Ada.Text_IO;
with Bubbles; use Bubbles;

procedure Main is

   T : Table (1 .. 5) := (4, 3, 2, 1, 0);

begin
   Sort (T);
   for I in T'Range loop
      Put (Integer'Image (T (I)));
   end loop;
   New_Line;
end Main;
