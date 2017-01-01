
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

;; use (gensym) to avoid name clashes
(defmacro swap (x y)
  (let ((tmp (gensym)))
    `(let ((,tmp ,x))
       (setf ,x ,y ,y ,tmp)
       (list 'x ,x 'y ,y))))
