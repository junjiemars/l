

;; unbound variable
(defvar x1 49)
(makunbound 'x1)

;; unbound function
(defun foo (n) (* 2 n))
(defparameter x2 #'foo)
(fmakunbound 'foo)

;; unintern symbol
(unintern 'foo)
