
(= 1 1.0)
(eql 1 1.0)


;; with one argument they all return t
(< 1)
(= 1)
(<= 1)
(> 1)
(>= 1)
(/= 1)


;; (<= w x y z) => (and (<= w x) (<= x y) (<= y z))

;; (/= w x y z) => (and (/= w x) (/= w y) (/= w z) (/= x y) (/= x z) (/= y z))


;; `zerop', `plusp', `minusp' take one argument and return true
;; if it is =, >, and < zero.

(zerop 1)
(eql (zerop 0) (zerop 0.0))
(eql (zerop 0.0) (zerop -0.0))

(plusp 1)
(plusp 0)
(plusp -1)
(eql (plusp 0) (plusp -0.0))

(minusp )

