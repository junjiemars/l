

(defun foo (n)
  (bar (* 2 n)))


(defmacro bar (n)
  `(1+ ,n))
