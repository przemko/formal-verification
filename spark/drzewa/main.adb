pragma SPARK_Mode;

with Ada.Text_IO; use Ada.Text_IO;
with Drzewo;

procedure Main is

   package Drzewko1 is new Drzewo(Rozmiar_Pamieci => 4);
   use Drzewko1;
   package Drzewko2 is new Drzewo(Rozmiar_Pamieci => 8);
   use Drzewko1;

   Korzen1 : Drzewko1.Adres := Drzewko1.Puste;
   Korzen2 : Drzewko2.Adres := Drzewko2.Puste;

begin
   Drzewko1.Wstaw (Korzen1, 5);
   Drzewko1.Wstaw (Korzen1, 2);
   Drzewko1.Wstaw (Korzen1, 7);
   Drzewko1.Wstaw (Korzen1, 6);
   Drzewko1.Drukuj (Korzen1);
   New_Line;
   Drzewko1.Usun (Korzen1);

   Drzewko2.Wstaw (Korzen2, 5);
   Drzewko2.Wstaw (Korzen2, 2);
   Drzewko2.Wstaw (Korzen2, 7);
   Drzewko2.Wstaw (Korzen2, 6);
   Drzewko2.Wstaw (Korzen2, 1);
   Drzewko2.Wstaw (Korzen2, 3);
   Drzewko2.Wstaw (Korzen2, 9);
   Drzewko2.Wstaw (Korzen2, 8);
   Drzewko2.Drukuj (Korzen2);
   New_Line;
   Drzewko2.Usun (Korzen2);
end Main;

