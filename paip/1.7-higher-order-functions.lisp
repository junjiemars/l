;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

#|
Functions in Lisp can not only be "called", or applied to arguments, they can 
also be maniuplated just like any other kind of object. A function that takes
another function as an argument is called a higher-order function.
|#

(defun mappend (fn the-list)
	"Apply fn to each element of list and append the results."
	(apply #'append (mapcar fn the-list)))


(apply #'+ '(1 2 3 4)) ;; => 10
(apply #'append '((1 2 3) (a b c))) ;; => (1 2 3 A B C)

(defun self-and-double (x)
	(list x (+  x x)))

(self-and-double 3) ;; => (3 6)
(apply #'self-and-double '(3)) ;; => (3 6)

(mapcar #'self-and-double '(1 10 300)) ;; => ((1 2) (10 20) (300 600))
(mappend #'self-and-double '(1 10 300)) ;; => (1 2 10 20 300 600)

(defun number-and-negation (x)
	"If x is a number, return a list of x and -x."
	(if (numberp x)
			(list x (- x))
			nil))

(defun numbers-and-negations (input)
	"Given a list, return only the numbers and their negations."
	(mappend #'number-and-negation input))

(numbers-and-negations '(testing 1 2 3 test)) ;; => (1 -1 2 -2 3 -3)


(defun mappend1 (fn the-test)
	"Apply fn to each element of list and append the results."
	(if (null the-list)
			nil
			(append (funcall fn (first the-list))
							(mappend1 fn (rest the-list)))))

;; funcall is similar to apply; it too takes a function as it's first
;; argument and applies the function to a list of arguments, but in the case
;; of funcall, the arguments are listed separately.

;; (+ 2 3) => (+ '(2 3))
(funcall #'+ 2 3) ;; => 5
(apply #'+ '(2 3)) ;; => 5

#|
The name lambda comes from the mathematician Alonzo Church's notation for 
functions (Church 1941). Lambda derives from the notation in Russell and
Whitehead's Principia Mathematica, which used a caret over bound variables.
Church wanted a one-dimensional string, λx(x+x). John McCarthy was a student
of Church's at Princeton, so when McCarthy invented Lisp in 1958, he adopted 
the lambda notation.
|#

((lambda (x) (+ x 2)) 4) ;; => 6
(= (funcall #'(lambda (x) (+ x 2)) 4)
	 (funcall (lambda (x) (+ x 2)) 4 )) ;; => T

(mapcar #'(lambda (x) (+ x x))
				'(1 2 3 4 5)) ;; => (2 4 6 8 10)

(mappend #'(lambda (l) (list l (reverse l)))
				 '((1 2 3) (a b c))) ;; => ((1 2 3) (3 2 1) (A B C) (C B A))


(defparameter *x* (lambda (x) (* x 2)))
(symbol-value '*x*) ;; => #<FUNCTION (LAMBDA (X)) {1001EF73FB}>
;; (*x* 3) => function *x* not defined
(funcall *x* 3) ;; => 6
(setf (symbol-function '*x*) (symbol-value '*x*))
(*x* 3) ;; => 6

(eq (function *x*) #'*x*) ;; => T

(functionp (lambda (x) (+ 2 x))) ;; => T


#|
There are two reasons why lambda expressions are very useful:
1. It can be clearer to define a function as a lambda expression rather than
inventing a name for it.
2. Lambda expressions make it possible to create new functions at runtime. This 
is a powerful technique that is not possible in most programming languages. 
These runtime functions, known as closures.
|#
