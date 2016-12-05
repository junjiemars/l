#lang racket

#|
Racket has higher-order assertions known as contracts that protect any values
including functions and objects. 
Contracts are typically applied on the imports or exports of a module.
|#

(define/contract x
  (=/c 42)
  42)

(define/contract f
  (-> number? (or/c 'yes 'no))
  (λ (x)
    (if (= 42 x) 'yes 'no)))

(f 42)
(f 35)
;; (f "abc") ;; contract violation

