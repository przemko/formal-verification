pragma SPARK_Mode;

generic
   Rozmiar_Pamieci : Positive;
package Drzewo is

   type Adres is new Natural range 0 .. Rozmiar_Pamieci;

   Brak_Wolnej_Pamieci : exception;

   Puste : constant Adres := 0;

   procedure Wstaw (Korzen : in out Adres; N : Integer);

   procedure Usun (Korzen : in out Adres)
     with
       Post => Korzen = Puste;

   procedure Drukuj (Korzen : Adres);

private

   type Indeks is new Adres range 1 .. Adres(Rozmiar_Pamieci);

   Stos_Wolnych_Miejsc : array (Indeks) of Adres := (others => Puste);
   Szczyt_Stosu        : Adres;
   Wartosc             : array (Indeks) of Integer;
   Lewy                : array (Indeks) of Adres := (others => Puste);
   Prawy               : array (Indeks) of Adres := (others => Puste);

   procedure Zarezerwuj (Miejsce : out Adres)
     with
       Global => (In_Out => (Szczyt_Stosu, Stos_Wolnych_Miejsc)),
       Depends => (Szczyt_Stosu => Szczyt_Stosu,
                   Miejsce => Szczyt_Stosu,
                   Stos_Wolnych_Miejsc => Stos_Wolnych_Miejsc);

   procedure Zwolnij (Miejsce : in out Adres)
     with
       Global => (In_Out => Stos_Wolnych_Miejsc,
                  Output => Szczyt_Stosu),
     Depends => (Szczyt_Stosu => Miejsce,
                 Miejsce => Miejsce,
                 Stos_Wolnych_Miejsc => (Miejsce, Stos_Wolnych_Miejsc)),
     Pre => Miejsce /= Puste,
     Post => Miejsce = Puste;

end Drzewo;
