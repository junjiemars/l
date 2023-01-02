;;;

(define 1foo #x1234)

(define |hit me| #xabc)

(gensym)

(= #36rzz (+ (* 35 (expt 36 1)) 35))

(= #o1.4 1.5)

(= #b1e10 4)
(= #b1e11 8)

#|
block comment
|#

;; datum comment below
(+ 1 2 #;(* 3 4) (+ 5 6)
	 #;#;(+ 1 2) (+ 3 4)
	 (* 7 8))
