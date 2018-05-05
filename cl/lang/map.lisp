;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

;; map is the name of a higher-order function that applies a given function
;; to each element of a list, returning a list of results in the same order.
;; It is often called apply-to-all when considdered in functional form.
;; https://en.wikipedia.org/wiki/Map_(higher-order_function)


;; (trace identity)
;; using #'identity see how to apply to each element.


(mapcar 'length '((1) (2) (3) (4)))
(maplist 'length '((1) (2) (3) (4)))

(mapcar 'list '(:one :two :three :four) '(1 2 3 4))
(mapcan 'list '(:one :two :three :four) '(1 2 3 4))

(nconc '(a b c) '(1 2 3))

(map 'list #'(lambda (x)
							 (* x x))
		 (loop for i from 1 to 5 collect i))


