;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-


(defmacro swap (x y)
  `(let ((tmp ,x))
     (setf ,x ,y ,y tmp)
     (list 'x ,x 'y ,y)))
;; does not swap expectly
(let ((x 123)
      (tmp 234))
  (swap x tmp)) ;; => (X 123 Y 123)

;; use (gensym) to avoid name capture
(defmacro swap1 (x y)
  (let ((tmp (gensym)))
    `(let ((,tmp ,x))
       (setf ,x ,y ,y ,tmp)
       (list 'x ,x 'y ,y))))

(let ((x 123)
      (tmp 234))
  (swap1 x tmp)) ;; => (X 234 Y 123)

;; generate fresh symbols
(list *gensym-counter* (gensym) (gensym) (gensym "fo | o"))
(list (make-symbol "a1") (make-symbol "a b c"))
