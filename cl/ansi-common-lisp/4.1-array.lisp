
(defparameter *x* (make-array '(2 3) :initial-element nil))

(setf (aref *x* 0 0) 'a)

(aref *x* 0 0)


(when (not *print-array*)
  (let ((*print-array* t))
    *x*))


(defparameter *v* (make-array 4 :initial-element nil))

(setf (aref *v* 0) 9)

;; simple-vector ref
(svref (vector "a" 'b 3) 1)

