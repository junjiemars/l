;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

#|
Exercise 2.3
Write a trivial grammar for some other language. This can be a natural
language other than English, or perhaps a subset of a computer language.
|#


#|
Exercise 2.4
One way of describing combine-all is that it calculates the cross-product of
the function append on the argument lists. Write the higher-order function 
cross-product, and define combine-all in terms of it.
The moral is to make your code as general as possible, because you never know
what you may want to do with it next.
|#

(defun cross-product (fn xlist ylist)
	"Return a list of all (fn x y) values."
	(mappend #'(lambda (y)
							 (mapcar #'(lambda (x) (funcall fn x y))
											 xlist))
					 ylist))

(defun combine-all (xlist ylist)
	"Return a list of lists formed by appending a y to an x."
	(cross-product #'append xlist ylist))

;; => (11 12 13 21 22 23 31 32 33)
(cross-product #'+ '(1 2 3) '(10 20 30))

;; => ((A 1) (B 1) (C 1) (A 2) (B 2) (C 2) (A 3) (B 3) (C 3))
(cross-product #'list '(a b c) '(1 2 3))
