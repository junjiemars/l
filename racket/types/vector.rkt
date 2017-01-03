#lang racket

(define v1 #(1 2 3))
(eq? #(1 2 3) v1)
(eqv? #(1 2 3) v1)
(equal? #(1 2 3) v1)

(vector-ref v1 0)

(define lst1 (vector->list v1))
(rest lst1)
(and (car lst1) (first lst1))

(define vec1 (list->vector lst1))

(map string-titlecase
     (vector->list #("three" "blind" "mice")))

(define v2 (make-vector 3))
(vector-set! v2 0 'first)
(vector-set! v2 1 'second)