
(defclass circle ()
  (radius center))

(defparameter *x*
  (let ((c (make-instance 'circle)))
    (setf (slot-value c 'radius) 10
          (slot-value c 'center) 0)
    c))
