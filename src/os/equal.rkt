#lang racket

; object identity
(eq? "123" (number->string 123))
(eq? "abc" "abc")
(eq? "aaa" (make-string 3 #\a))

; equal? -> eqv? -> eq?
(eqv? 1 1.0)
(equal? 1 1.0)
(= 1 1.0)
