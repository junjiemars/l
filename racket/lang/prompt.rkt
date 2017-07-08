#lang racket

(define (escape v)
  (abort-current-continuation
   (default-continuation-prompt-tag)
   (λ () (+ v pi))))

(+ 1 (+ 2 (+ 3 (/ 4 (escape 0)))))

(+ 1
     (call-with-continuation-prompt
      (λ ()
        (+ 1 (+ 2 (+ 3 (/ 4 (escape 0))))))))