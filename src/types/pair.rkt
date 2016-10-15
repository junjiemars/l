#lang racket

(cons 1 2)
(cons (cons 1 2) 3)

(eqv? (cons 1 2) (cons 1 2))
(equal? (cons 1 2) (cons 1 2))

(define p1 (cons 1 (cons 2 3)))
(cdr (cdr p1))
(pair? p1)
(list? p1)

; a list
(define p2 (cons 0 (cons 1 (cons 2 null))))
(pair? p2)
(list? p2)

(foldl (λ (x v) (+ x v))
       10
       p2)

; mutable pair
(define p3 (mcons "a" "b"))
(mpair? p3)
(set-mcar! p3 "A")
