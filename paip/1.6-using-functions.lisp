;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

(defparameter *names*
	'((John Q Public) (Malcolm X)
		(Admiral Grace Murray Hopper) (Spot)
		(Aristotle) (A A Milne) (Z Ζ Top)
		(Sir Larry Olivier) (Miss Scarlet)))


(defun last-name (name)
	"Select the last name from a name represented as a list."
	(first (last name)))

;; => (PUBLIC X HOPPER SPOT ARISTOTLE MILNE TOP OLIVIER SCARLET)
(mapcar #'last-name *names*)

;; car, an old name for first, stand for "contents of address register"
;; cdr, an old name for rest, stand for "contents of decrement register"
;; The instructions that were used in the first implementation of Lisp
;; on the IBM 704


(defparameter *titles*
	'(Mr Mrs Miss Ms Sir Madam Dr Admiral Major General)
	"A list of titles that can appear at the start of a name.")


(defun first-name (name)
	"Select the first name from a name represented as a list."
	(if (member (first name) *titles*)
			(first-name (rest name))
			(first name)))

;; => (JOHN MALCOLM GRACE SPOT ARISTOTLE A Z LARRY SCARLET)
(mapcar #'first-name *names*)

;; `C-c C-t'  trace first-name

;; traced 4 times
(first-name '(Madam Major General Paula Jones))

