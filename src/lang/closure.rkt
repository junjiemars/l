#lang racket

(define (list+ lst n)
  (map (λ (x) (+ x n))
       lst))

(define (make-adder n)
  (λ (x) (+ x n)))
(define add3 (make-adder 3))
(define add10 (make-adder 10))

(define (make-addx n)
  (λ (x [y #f])
    (if y
        (set! n x)
        (+ x n))))
(define addx (make-addx 10))
(addx 3)
(addx 7 #t)
(addx 3)
