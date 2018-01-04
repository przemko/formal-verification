pragma SPARK_Mode;

with Ada.Text_IO; use Ada.Text_IO;

package body Drzewo is

   procedure Zarezerwuj (Miejsce : out Adres)
   is
   begin
      Miejsce := Szczyt_Stosu;
      if Szczyt_Stosu /= Puste then
         Szczyt_Stosu := Stos_Wolnych_Miejsc (Indeks(Szczyt_Stosu));
      end if;
   end Zarezerwuj;

   procedure Zwolnij (Miejsce : in out Adres)
   is
   begin
      pragma Assert (Miejsce /= Puste);
      Stos_Wolnych_Miejsc (Indeks(Miejsce)) := Szczyt_Stosu;
      Szczyt_Stosu := Miejsce;
      Miejsce := Puste;
   end Zwolnij;


   procedure Wstaw (Korzen : in out Adres; N : Integer)
   is
      Nowy : Adres;
      Biezacy, Poprzedni : Adres;
      W_Lewo : Boolean;
   begin
      Zarezerwuj (Nowy);
      if Nowy = Puste then
         raise Brak_Wolnej_Pamieci;
      end if;
      pragma Assert (Nowy /= Puste);
      Wartosc (Indeks(Nowy)) := N;
      Lewy (Indeks(Nowy)) := Puste;
      Prawy (Indeks(Nowy)) := Puste;
      if Korzen = Puste then
         Korzen := Nowy;
      else
         Poprzedni := Puste;
         Biezacy := Korzen;
         pragma Assert (Biezacy /= Puste);
         while Biezacy /= Puste loop
            Poprzedni := Biezacy;
            if N < Wartosc (Indeks(Biezacy)) then
               Biezacy := Lewy (Indeks(Biezacy));
               W_Lewo := True;
            else
               Biezacy := Prawy (Indeks(Biezacy));
               W_Lewo := False;
            end if;
         end loop;
         if W_Lewo then
            Lewy (Indeks(Poprzedni)) := Nowy;
         else
            Prawy (Indeks(Poprzedni)) := Nowy;
         end if;
      end if;
   end Wstaw;

   procedure Usun (Korzen : in out Adres)
   is
      Biezacy : Adres := Korzen;
      Tmp : Adres;
   begin
      pragma Assert (Biezacy = Korzen);
      while Korzen /= Puste loop
         pragma Loop_Invariant (Biezacy /= Puste);
         if Lewy (Indeks(Biezacy)) /= Puste then
            Biezacy := Lewy (Indeks(Biezacy));
         else
            Lewy (Indeks(Biezacy)) := Prawy (Indeks(Korzen));
            pragma Assert (Korzen /= Puste);
            Tmp := Lewy (Indeks(Korzen));
            if Biezacy = Korzen then
               Biezacy := Lewy (Indeks(Biezacy));
            end if;
            Zwolnij (Korzen);
            Korzen := Tmp;
         end if;
         pragma Assert (Biezacy /= Puste or Korzen = Puste);
      end loop;
   end Usun;

   procedure Drukuj (Korzen : Adres)
   is
   begin
      if Korzen = Puste then
         Put ("nil");
      else
         Put ("(");
         Drukuj (Lewy (Indeks(Korzen)));
         Put (" " & Integer'Image (Wartosc (Indeks(Korzen))) & " ");
         Drukuj (Prawy (Indeks(Korzen)));
         Put (")");
      end if;
   end Drukuj;

begin
   for I in Indeks range Stos_Wolnych_Miejsc'First .. Stos_Wolnych_Miejsc'Last - 1 loop
      Stos_Wolnych_Miejsc (I) := Adres(I + 1);
   end loop;
   Stos_Wolnych_Miejsc (Stos_Wolnych_Miejsc'Last) := Puste;
   Szczyt_Stosu := Adres(Stos_Wolnych_Miejsc'First);
end Drzewo;
