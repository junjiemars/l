#lang racket

; leading 1s
(define (leading-1s n)
  (let ([m #xffffffff])
  (bitwise-xor m (arithmetic-shift m (- n)))))

; tailing 1s
(define (tailing-1s n)
  (let ([m #xffffffff])
    (bitwise-xor m (leading-1s (- 32 n)))))

; random 1~100
(map (λ (x) (random 1 10))
     (range 20))