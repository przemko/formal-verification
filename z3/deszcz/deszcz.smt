; Pokażemy, że mokro jest logiczną konsekwencją formuł {pada, pada -> mokro}.
; 
; Uruchomienie:
;
;   $ z3 -smt2 deszcz.smt
;   unsat
;
; Zbiór formuł {pada, pada -> mokro, not mokro} jest sprzeczny, zatem mokro
; jest logiczną konsekwencją zbioru formuł {pada, pada -> mokro}.

(declare-fun mokro () Bool)
(declare-fun pada () Bool)
(assert pada)
(assert (or (not pada) mokro))
(assert (not mokro))
(check-sat)

