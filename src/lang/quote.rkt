#lang racket

(eq? (quote a) (#%datum . a))

(define (f1 x y z)
  (+ x y z))

; backquote or quasiquote
(define x (quasiquote (0 (unquote (+ 1 2)) 4)))
(define y `(0 ,(+ 1 2) 4))
(eq? x y)
(equal? x y)