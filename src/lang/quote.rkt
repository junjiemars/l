#lang racket

(eq? (quote a) (#%datum . a))

(define (f1 x y z)
  (+ x y z))

; backquote or quasiquote
; `  quasiquote
; ,  unquote
; ,@ unquote-splicing
(define x (quasiquote (0 (unquote (+ 1 2)) 4)))
(define y `(0 ,(+ 1 2) 4))
(eq? x y)
(equal? x y)

`(1 ,@(list 2 3) 4)
`(1 ,@(+ 2 3))

`(1 `(2 ,(+ 1 2)) 4)
`(1 `,(2 ,(+ 1 2)) 4)
`(1 ```,,@,(add1 1) ,@(list 3 4) 5)

