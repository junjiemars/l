;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-


(mapcar #'(lambda (x) (+ x 10))
				'(1 2 3))

(mapcar #'list
				'(a b c d)
				'(1 2 3 4 5))

(maplist #'(lambda (x) x)
				 '(a b c))
