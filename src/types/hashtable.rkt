#lang racket

;; mutable hashtable
(define x (make-hash))
(hash-set! x "apple" '(red round))
(hash-set! x "banana" '(yellow long))
(hash-ref x "apple")
;;(hash-ref x "coconut")
(hash-set! x "coconut" "not there")
(hash-count x)
(hash-has-key? x "coconut")

;; immutable hashtable

(define y (hash "apple" '(red round) "banana" '(yellow long)))
(hash-ref y "banana")
(define z (hash-set y "coconut" '(brown nut)))

(define t1 #hash( ("apple" . (red round))
                  ("banana" . (yellow long))
                  ("coconut" . (brown nut))))
(hash-ref t1 "banana")


;; mutable: weak key 
(define w (make-weak-hasheq))
(hash-set! w (gensym) "can you see me?")
(hash-count w)
(collect-garbage)
(hash-count w)
