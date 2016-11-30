#lang racket

(define saved-k #f)

(define (save-it!)
  (call-with-composable-continuation
   (λ (k)
     (set! saved-k k) ;; k is a continuation
     0)))

(+ 1 (+ 2 (+ 3 (+ (save-it!) 4 5))))

(continuation? saved-k)
(saved-k 20) ;; 35

;; saved-k like saved-k-fn
(define (saved-k-fn v)
  (+ 1 (+ 2 (+ 3 (+ v 4 5)))))
(= 35 (saved-k-fn 20))


(define accumulator #f)
(define (accumulate!)
  (let ([i 0])
    (call-with-composable-continuation
     (λ (x) (set! accumulator x)))
    (set! i (add1 i))
    i))

#|
(accumulate!) ;; 1
(accumulator) ;; 2
(accumulator) ;; 3

(define previous-accumulator accumulator)
(accumulate!) ;; 1
(accumulator) ;; 2
(previous-accumulator) ;; 4
|#

