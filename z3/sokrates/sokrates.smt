; Pokażemy, że warunek smiertelny(sokrates) jest logiczną konsekwencją
; zbioru formuł {forall x czlowiek(x) => smiertelny(x), czlowiek(sokrates)}.
;
; Uruchomienie:
;
;   $ z3 -smt2 sokrates.smt
;   unsat
;
; Zbiór formuł {forall x czlowiek(x) => smiertelny(x), czlowiek(sokrates),
; not smiertelny(sokrates)} jest sprzeczny, zatem smiertelny(sokrates) jest
; logiczna konsekwencją zbioru formuł {forall x czlowiek(x) => smiertelny(x),
; czlowiek(sokrates)}.

(declare-sort Typ)
(declare-fun czlowiek (Typ) Bool)
(declare-fun smiertelny (Typ) Bool)
(declare-const sokrates Typ)
(assert (forall ((x Typ)) (=> (czlowiek x) (smiertelny x))))
(assert (czlowiek sokrates))
(assert (not (smiertelny sokrates)))
(check-sat)

