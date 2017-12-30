;;;-*- Mode: Lisp; Syntax: ANSI-Common-Lisp -*-

(require :lisp-unit)


#|

Q1: Translate the following expressions into equivalent expressions 
that don't use let or let*, and don't cause the same expression to be
evaluated twice.

(a) (let ((x (car y)))
      (cons x x))

(b) (let* ((w (car x))
           (y (+ w z)))
      (cons w y))

|#


(defun q1-a (y)
  (let ((x (car y)))
    (cons x x)))

(defun a1-a (y)
  ((lambda (x) (cons x x)) (car y)))

(defun q1-b (x z)
  (let* ((w (car x))
         (y (+ w z)))
    (cons w y)))

(defun a1-b (x z)
  ((lambda (w)
     ((lambda (y)
        (cons w y)) (+ w z))) (car x)))


(lisp-unit:define-test test-q1
  
  (lisp-unit:assert-true
   (equal (a1-a '(1 2 3)) (q1-a '(1 2 3))))
  
  (lisp-unit:assert-true
   (equal (a1-b '(1 2 3) 10) (q1-b '(1 2 3) 10))))



