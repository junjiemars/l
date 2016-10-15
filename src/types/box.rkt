#lang racket

; as a minimal storage
(define x (box 123))
(define y (box 123))
(eq? x y)
(list x y)

(= (unbox x) (unbox y))

; a box as a single-element vector
(set-box! y '(banna boat))
(unbox y)
(eq? '(banna boat) (unbox y))



