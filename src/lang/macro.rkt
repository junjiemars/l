#lang racket

;; pattern-based macro

; single pattern
(define-syntax-rule (swap x y)
  (let ([t x])
    (set! x y)
    (set! y t)))

(let ([x 111]
      [y 222])
  (swap x y)
  (list x y))

; multiple patterns with the same id
(define-syntax rotate
  (syntax-rules ()
    [(rotate a b) (swap a b)]
    [(rotate a b c) (begin (swap a b)
                           (swap b c))]))

(let ([red 1] [green 2] [blue 3])
  (rotate red green)
  (rotate red green blue)
  (list red green blue))

; matching sequences
(define-syntax rotate1
  (syntax-rules ()
    [(rotate a) (void)]
    [(rotate1 a b c ...) (begin
                          (swap a b)
                          (rotate1 b c ...))]))

(let ([red 1] [green 2] [blue 3])
  (rotate1 red green)
  (rotate1 red green blue)
  (list red green blue))

; 