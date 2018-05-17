
(defparameter *glob* 99)

(setf *glob* 98)

(let ((n 10))
  (setf n 2)
  n)

(defparameter *x* (list 'a 'b 'c))
(setf (car *x*) 'X)
