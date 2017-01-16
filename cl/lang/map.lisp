
;; diff likes loop in/on
(mapcar 'length '((1) (2) (3) (4)))
(maplist 'length '((1) (2) (3) (4)))

(mapcar 'list '(:one :two :three :four) '(1 2 3 4))
(mapcan 'list '(:one :two :three :four) '(1 2 3 4))

(nconc '(a b c) '(1 2 3))


