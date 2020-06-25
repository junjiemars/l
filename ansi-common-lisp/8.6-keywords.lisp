;; Symbols in the keyword package have two unique properties: they
;; always evaluate to themselves, and you can refer to them anywhere
;; simply as: :x, instead of keyword:x.

(find-package "KEYWORD")

(member '(a) '((a) (z)))

(member '(a) '((a) (z)) :test #'equal)

;; Why use keywords instead of ordinary symbols? Because they are
;; accessible anywhere.

(defpackage "XXX"
  (:use "COMMON-LISP")
  (:export "NOISE" "NOISE1"))

(in-package "XXX")

(defun noise (animal)
  (case animal
    (:dog :woof)
    (:cat :meow)
    (:pig :oink)
    (t :unknown)))

(defun noise1 (animal)
  (case animal
    ('dog 'woof)
    ('cat 'meow)
    ('pig 'oink)
    (t 'unknown)))

(in-package "COMMON-LISP-USER")
(assert (eq :woof (xxx:noise :dog)))
(ignore-errors (xxx:noise1 'dog))

;; Should export `dog' and `woof' symbol in package `XXX'
;; (export 'dog)
;; (export 'woof)





