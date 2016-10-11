#lang racket

(module m racket
  (provide foo f1)
  (define foo 123)
  (define (f1 x) (* x x)))

(require 'm)
(= 123 foo)
(= (* foo foo) (f1 foo))
