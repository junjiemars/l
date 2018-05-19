;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

;; Lisp is more useful than a calculator for two main reasons.
;; 1. It allows us to manipulate objects other than numbers.
;; 2. It allows us to define new objects that might be useful in subsequent
;; computations.


;; computation on lists
(append '(Pat Kim) '(Robin Sandy)) ;; => (PAT KIM ROBIN SANDY)


;; symbolic computations can be nested and even mixed with numeric
;; computations.

;; => (PAT KIM (JOHN Q PULBIC) SANDY)
(append '(Pat Kim) (list '(John Q Pulbic) 'Sandy))

;; => 4
(length (append '(Pat Kim) (list '(John Q Pulbic) 'Sandy)))


;; Note:
;; 1. It is important to remember that Lisp does not attach any external
;; significance to the objects it manipulates.
;; 2. To do the computations above, we had to know that append, length, and +
;; are defined function in Common Lisp. Learning a language involves
;; remembering vocabulary items as well as learning the basic rules for forming
;; expressions and determining what they mean.
;; 3. Symbols in Common Lisp are not case sensitive. (readtable-case)
;; 4. I'd known
