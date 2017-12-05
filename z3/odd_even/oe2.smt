(declare-fun even (Int) Bool)
(declare-fun odd (Int) Bool)

(assert (even 0))
(assert (forall ((n Int)) (=> (odd n) (even (+ n 1)))))
(assert (forall ((n Int)) (=> (even n) (odd (+ n 1)))))
(assert (forall ((n Int)) (=> (even n) (not (odd n)))))
(assert (forall ((n Int)) (=> (odd n) (not (even n)))))

(assert (exists ((n Int)) (and (even n) (even (+ n 1)))))

(check-sat)

