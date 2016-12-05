#lang racket

;; pair

(cons 1 2)
(cons (cons 1 2) 3)

(eqv? (cons 1 2) (cons 1 2))
(equal? (cons 1 2) (cons 1 2))

(define p1 (cons 1 (cons 2 (cons 3 4))))
(= 2 (car (cdr p1)) (cadr p1))
(= 3 (car (cdr (cdr p1))) (caddr p1))
(and  (pair? p1) (list? p1))

;; list
(define p2 (cons 0 (cons 1 (cons 2 null))))
(and (pair? p2) (list? p2))

(foldl (λ (x v) (+ x v))
       10
       p2)

;; mutable pair
(define p3 (mcons "a" "b"))
(and (mpair? p3) (cons? p3))
(set-mcar! p3 "A")
