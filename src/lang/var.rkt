#lang racket

;; top-level x's location holds value of 
(define x (+ (let ([x 5]) (* 2 x)) 6))

(define p1 (λ (x) (+ x 10)))
(define f1 p1)
(= (p1 7) (f1 7))
(eq? p1 f1)

;; parameter x in lexical scope 
(define p2 (λ (x) (set! x 3) x))
(= x (p2 7))

;; var reference
(define v1 (vector 10 20))
(define x1 v1)
(vector-set! v1 0 11)
(eq? v1 x1)
