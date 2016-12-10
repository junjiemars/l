
(declaim (optimize (speed 0) (debug 3)))

(defun test (x y)
  (+ x y))

(defun test1 (lst)
  (print (+ (car lst) (cadr lst)))
  (break)
  (test1 (cdr lst)))
