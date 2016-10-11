#lang racket

; as a minimal storage
(define x (box 123))
(define y (box 123))
(unbox x)
(unbox y)
(eq? x y)
