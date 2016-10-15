#lang racket

(define v1 #(1 2 3))
(eq? #(1 2 3) v1)
(eqv? #(1 2 3) v1)
(equal? #(1 2 3) v1)

(vector-ref v1 0)

(define lst1 (vector->list v1))
(rest lst1)
