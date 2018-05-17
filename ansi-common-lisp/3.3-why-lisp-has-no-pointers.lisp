

(defparameter *x* (list 'a 'b 'c))

(defparameter *y* *x*)

(eql *x* *y*)

(setf (car *y*) 'd)

(eql 'd (car *x*))
