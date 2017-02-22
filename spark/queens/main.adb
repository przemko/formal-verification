with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Queens;

procedure Main is
   N : Integer;
begin
   loop
      Put_Line ("Podaj rozmiar planszy (zero aby zakonczyc): ");
      Get (N);
      exit when N = 0;
      Put_Line ("Liczba ustawien hetmanow = " & Natural'Image (Queens (N)));
   end loop;
end Main;
