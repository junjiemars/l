#lang racket/base

(require rackunit)
(require rackunit/text-ui)

(define object-equations
  (test-suite
   "Tests for equations between objects"
  
   (test-case
    "object identity equation: one object"
    (check-true (eq? "abc" "abc") "string constants equation")
    (check-false (eq? "123" (number->string 123)) "different string object")
    (check-false (eq? "aaa" (make-string 3 #\a)) "different string object"))

   (test-case
    "value equation: eq? -> eqv? -> equal?"
    (check-false (eq? 1 1.0) "diff precision")
    (check-false (eqv? 1 1.0) "same precision? then check value equation")
    (check-false (equal? 1 1.0) "value equation")
    (check-true (= 1 1.0) "numberic equation"))))

(run-tests object-equations)

