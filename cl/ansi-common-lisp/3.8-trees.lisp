;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

;; conses can also be considered as binary trees, with the car representating
;; the right subtree and the cdr the left. For example, the list
;; '(a (b c) d)


(defun our-copy-tree (tr)
	(declare (optimize (debug 3) (speed 0) (safety 0)))
	(if (atom tr)
			tr
			(cons (our-copy-tree (car tr))
						(our-copy-tree (cdr tr)))))

(substitute 'y 'x '(and (integerp x) (zerop (mode x 2))))

(subst 'y 'x '(and (integerp x) (zerop (mod x 2))))

;; functions that operate on trees usually have this form, recursing down both
;; the car and cdr. such functions are said to be doubly recursive.

(defun our-subst (new old tree)
	(if (eql tree old)
			new
			(if (atom tree)
					tree
					(cons (our-subst new old (car tree))
								(our-subst new old (cdr tree))))))
