#lang racket

; lexical scope
(define y 7)
(define (scope-test x)
  (list x y))

(let ([y 9])
  (scope-test 3))

(define (foo x)
  (* x x))

; dynamic scope in elisp
#|
(defvar y 7)
(defun scope-test (x)
  (list x y))
(let ((y 9))
  (scope-test 3))
|#
