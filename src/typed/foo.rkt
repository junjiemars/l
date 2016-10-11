#lang typed/racket



(define (foo [x : Float]) : Float
  (/ 1 x))

(println "Hi, typed racked ")