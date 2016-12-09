#lang racket

;; literal
#hash((#t . 1) (#f . 0))

;; constructor
(define i (make-immutable-hash '(("t" . 1) ("f" . 0))))
(define m (make-hash '(("t" . 1) ("f" . 0))))

;; predicate
(hash? m)
(dict? m)

;; size
(hash-count i)

;; lookup
(hash-ref i "t")
(hash-ref i "m" -1)

;; update
(hash-set! m "t" 123)

;; is key present
(hash-has-key? i "t")

;; delete
(hash-remove i "t")

;; iterate
(hash-for-each i (λ (k v)
                   (printf "~a:~a\n" k v)))

;; keys/values as lists
(hash-keys i)
(hash-values i)

