#lang racket

(displayln (write (print write)))
(displayln (write (print 1/2)))

(printf "Items ~a for shopper ~s: ~v\n"
        '("list") '("John") '("mile"))

;; internal pipe
(define-values (in out) (make-pipe))
(write "hello" out)
(read in)