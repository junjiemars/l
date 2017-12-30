;;;-*- Mode: Lisp; Syntax: ANSI-Common-Lisp -*-

(require :lisp-unit)
(use-package :lisp-unit)

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


(define-test test-q1
  (assert-true (equal (a1-a '(1 2 3)) (q1-a '(1 2 3))))
  (assert-true (equal (a1-b '(1 2 3) 10) (q1-b '(1 2 3) 10))))


#|

Q2: Rewrite mystery (page 29) to use cond.

|#

(defun q2-mystery (x y)
  (if (null y)
      nil
      (if (eql (car y) x)
          0
          (let ((z (q2-mystery x (cdr y))))
            (and z (+ z 1))))))

(defun a2-mystery (x y)
  (cond ((null y) nil)
        ((eql (car y) x) 0)
        (t (let ((z (a2-mystery x (cdr y))))
             (and z (+ z 1))))))

(define-test test-a2-mystery
  (assert-true (eql (a2-mystery 1 '(2 3 4))
                    (q2-mystery 1 '(2 3 4)))))

#|

Q3: Define a function that returns the square of its argument,
and which does not compute the square if the argument is a positive
integer less than or equal to 5.

|#

(defun a3-square (x)
  (if (and (integerp x) (< 0 x 6))
      x
      (* x x)))

(define-test test-a3-square
  (assert-true (= 1.21 (a3-square 1.1)))
  (assert-true (= 0 (a3-square 0)))
  (assert-true (= 5 (a3-square 5)))
  (assert-true (= 36 (a3-square 6))))
