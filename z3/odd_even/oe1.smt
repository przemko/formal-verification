; Zadeklarujmy predykat even : Int -> Bool, który jest spełniony przez parzyste
; liczby naturalne i predykat odd : Int -> Bool, który spełniony jest przez
; nieparzyste liczby naturalne.
;
; O predykatach tych wiemy, że:
; 
; 1. liczba zero jest parzysta
; 2. jeśli liczba n jest nieparzysta, to liczba n+1 jest parzysta
; 3. jeśli liczba n jest parzysta, to liczba n+1 jest nieparzysta
;
; Dodajmy do zbioru asercji formułę, że istnieje liczba parzysta n, tż. liczba
; n+1 jest również parzysta.
;
; Uruchomienie:
; 
;   $ z3 -smt2 oe1.smt
;   sat
;
; Okazuje się, że powyższa asercja nie jest sprzeczna z wcześniejszymi. 
;
; Po odkomentowaniu w ostatnim wierszu polecenia (get-model) otrzymamy model
; dla zbioru wszystkich formuł:
;
;   $ z3 -smt2 oe1.smt 
;   sat
;   (model 
;     (define-fun n!0 () Int
;       5853)
;     (define-fun even ((x!0 Int)) Bool
;       true)
;    (define-fun odd ((x!0 Int)) Bool
;       true)
;   )
;
; Jak widać, w powyższym modelu przyjęto, że wszystkie liczby są parzyste i
; jednocześnie nieparzyste.
; 
; UWAGA: nasz zbiór asercji tego nie wyklucza!!!

(declare-fun even (Int) Bool)
(declare-fun odd (Int) Bool)

(assert (even 0))
(assert (forall ((n Int)) (=> (odd n) (even (+ n 1)))))
(assert (forall ((n Int)) (=> (even n) (odd (+ n 1)))))

(assert (exists ((n Int)) (and (even n) (even (+ n 1)))))

(check-sat)
;(get-model)

