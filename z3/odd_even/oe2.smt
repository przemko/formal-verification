; Zadeklarujmy predykat even : Int -> Bool, który jest spełniony przez parzyste
; liczby naturalne i predykat odd : Int -> Bool, który spełniony jest przez
; nieparzyste liczby naturalne.
;
; O predykatach tych wiemy, że:
; 
; 1. liczba zero jest parzysta
; 2. jeśli liczba n jest nieparzysta, to liczba n+1 jest parzysta
; 3. jeśli liczba n jest parzysta, to liczba n+1 jest nieparzysta
; 4. jeśli liczba n jest parzysta, to liczba n nie jest nieparzysta
; 5. jeśli liczba n jest nieparzysta, to liczba n jest parzysta
;
; Dodajmy do zbioru asercji formułę, że istnieje liczba parzysta n, tż. liczba
; n+1 jest również parzysta.
; 
; Powyższy zbiór formuł jest sprzeczny, zatem negacja ostatniej assercji jest 
; logicznym wnioskiem z wcześniejszych formuł. Nie ma więc dwóch kolejnych
; liczb, które byłyby parzyste.

(declare-fun even (Int) Bool)
(declare-fun odd (Int) Bool)

(assert (even 0))
(assert (forall ((n Int)) (=> (odd n) (even (+ n 1)))))
(assert (forall ((n Int)) (=> (even n) (odd (+ n 1)))))
(assert (forall ((n Int)) (=> (even n) (not (odd n)))))
(assert (forall ((n Int)) (=> (odd n) (not (even n)))))

(assert (exists ((n Int)) (and (even n) (even (+ n 1)))))

(check-sat)

