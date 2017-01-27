
(defun sqr (n) (* n n))

(eq (function sqr) #'sqr)
(eq #'sqr (symbol-function 'sqr))

(funcall #'sqr 3)

(defun plot (fn min max step)
  (loop for i from min to max by step do
       (loop repeat (funcall fn i) do
            (format t "*"))
       (format t "~%")))

((lambda (x) (* x x)) 3)

(defvar x1 (lambda (x) (* 2 x)))
(funcall x1 3)


;; #'sqr => (function sqr)
(flet ((sqr (n) (* 2 n n)))
  (list (funcall 'sqr 3) (funcall #'sqr 3) (function sqr)))
