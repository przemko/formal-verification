with Ada.Text_IO; use Ada.Text_IO;
with Split;

procedure Main is

   V : Integer := 5;
   T : Split.Data (1..10) := (4, 2, 3, 6, 7, 1, 4, 8, 4, 6);
   B1, B2 : Integer;

begin
   Put ("T:");
   for I in T'Range loop
      Put (Integer'Image (T(I)));
   end loop;
   New_Line;
   Put_Line ("V:" & Integer'Image (V));
   Split.Split (V, T, B1, B2);
   Put ("S:");
   for I in T'First .. B1 - 1 loop
      Put (Integer'Image (T(I)));
   end loop;
   Put (" |");
   for I in B1 .. B2 loop
      Put (Integer'Image (T(I)));
   end loop;
   Put (" |");
   for I in B2 + 1 .. T'Last loop
      Put(Integer'Image (T(I)));
   end loop;
   New_Line;
end Main;
