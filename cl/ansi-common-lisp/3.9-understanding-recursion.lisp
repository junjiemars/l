;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

;; The advantage of recursion is precisely that is let us view algorithms
;; in a more abstract way.

;; We can assure ourselves that this function is correct by verifying two
;; things:
;; 1. That it works for list of length 0.
;; .2 Given that it works for list of length n, that it also works for lists
;; of length n+1.

;; If we can establish both points, then we know that the function is correct
;; for all possible lists.

(defun len (lst)
	(if (null lst)
			0
			(+ 1 (len (cdr lst)))))

;; base case: when a recursive function doesn't behave as you intented, it is
;; usually because the base case is wrong.

;; (defun our-member-wrong (obj lst)
;; 	(if (eql obj (car lst))
;; 			lst
;; 			(our-member-wrong obj (cdr lst))))

(defun our-member (obj lst)
	(if (null lst)
			nil
			(if (eql obj (car lst))
					lst
					(our-member obj (cdr lst)))))
