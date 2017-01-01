
(defpackage :p1
  (:intern :alpha)
  (:export :bravo :charlie))

(defpackage :p2
  (:intern :alpha :delta)
  (:use :p1)
  (:export :bravo :echo))

(defpackage :p3
  (:intern :alpha)
  (:use :p2 :cl)
  (:export :charlie)
  (:import-from :p2 :delta))


(defmacro swap0 (x y)
  `(let ((tmp ,x))
     (setf ,x ,y ,y tmp)
     (list 'x ,x 'y ,y)))

;; use (gensym) to avoid name capture
(defmacro swap (x y)
  (let ((tmp (gensym)))
    `(let ((,tmp ,x))
       (setf ,x ,y ,y ,tmp)
       (list 'x ,x 'y ,y))))

;; generate fresh symbols
(list *gensym-counter* (gensym) (gensym) (gensym "fo | o"))
(list (make-symbol "a1") (make-symbol "a b c"))


;; make symbol inaccessible
(defun inaccessible-fn () 49)
(defparameter *inaccessible-fn* 'inaccessible-fn)
(symbol-function 'inaccessible-fn)

#|
(unintern 'inaccessible-fn)
;; (funcall *inaccessible-fn*) => unbound
;; restore inaccessible-fn -> fn object
(setf (symbol-function 'inaccessible-fn)
      (symbol-function *inaccessible-fn*))
;; or 
(import *inaccessible-fn*)
|#

;; shadowing: avoid name conflicts

(defpackage :bio
  (:use :cl)
  (:export :cat :dog :tree))

(in-package :bio)
(defclass tree () ())
(defpackage :grapha
  (:use :cl)
  (:export :vertex :edge :tree))
;; will shadow 'grapha:tree if 'tree existing
;; (shadow 'tree)
;; will import 'grpha:tree and shadown the existing 'bio:tree
(shadowing-import 'grapha:tree)
(use-package :grapha)
