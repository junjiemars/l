;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

(defun last-name (name)
	"Select the last name from a name represented as a list."
	(first (last name)))

;; last is defined to return a list of the last n elements
(last '(a b c)) ;; => (C)
(last '(a b c) 1) ;; => (C)
(last '(a b c) 2) ;; => (B C)


(last-name '(Rear Admiral Grace Murray Hopper)) ;; => HOPPER
(last-name '(Rex Morgan MD)) ;; => MD
(last-name '(Spot)) ;; => SPOT
(last-name '(Aristotle)) ;; => ARISTOTLE


(defun first-name (name)
	"Select the first name from a name represented as a list."
	(first name))

(first-name '(Wilma Flintstone)) ;; => WILMA





