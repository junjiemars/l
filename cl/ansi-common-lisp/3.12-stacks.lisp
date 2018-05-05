;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

;; The representation of lists as conses makes it natural to use them as
;; pushdown stacks.

;; push and pop are defined in term of setf

(defparameter *stacks* (list 'b 'c 'd))

(push 'a *stacks*)

(pop *stacks*)

(setf *stacks* (cons 'a *stacks*))

(defun our-reverse (seq)
	(let ((acc))
		(dolist (x seq acc)
			(push x acc))))

;; pushnew macro is a variant of push that uses adjoin instead of cons

(pushnew 'a *stacks*)
(pushnew 'a *stacks*)





