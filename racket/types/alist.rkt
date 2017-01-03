#lang racket

(define a1 (list (cons 'x 1) (cons 'y 2) (cons 'z 3)))

(define a2 (map cons '(x y z) (range 1 4)))

(eq? (car (assoc 'y a1)) (car (assoc 'y a2)))