;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

;; The kind of lists that can be built by calling list are more precisely known
;; as proper lists. A proper list is either nil, or a cons whose cdr is a proper list.

(defun proper-list? (x)
	(or (null x)
			(and (consp x)
					 (proper-list? (cdr x)))))


;; If cons is not a proper list, it is displayed in dotted notation.

(cdr (cons 'a 'b))

;; A cons that isn't a proper list is called a dotted list.

;; proper list
(cons 'a (cons 'b nil))

;; dotted list
(cons 'a (cons 'b 'c))
'(a b . c)


