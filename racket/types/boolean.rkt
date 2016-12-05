#lang racket


(boolean? #t)
(and (eq? #t #t) (eq? #f #f) (not #f))

;; boolean aliases

(and (eq? #t true) (eq? #f false))

;; symbol=? : symbol? -> eq?
;; boolean=? : boolean? -> eq?
(and (symbol=? 'a 'a) (boolean=? #t true))

;; nand : (not (and ...)) `c-d c-d d'
(nand (not #t) (false? #f))

;; nor : (not (or ...))
(nor #f #f #t)

;; (xor b1 b2) : exclusive or of b1 and b2
(xor #f #f)
(xor #t #t)
(xor #t #f)

;; (implies expr1 expr2) : (if expr1 expr2 #t)
(implies #f #t)
(implies #f #f)
(implies #t #f)



