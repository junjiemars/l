(setf *print-array* t)

(defparameter *x23* (make-array '(2 3) :initial-element nil))

(setf (aref *x23* 0 0) 'a)
(setf (aref *x23* 1 1) 'b)

(aref *x23* 0 0)
(aref *x23* 1 1)

;; array literal
;; #2a((a nil nil) (b nil nil))


(defparameter *x4* (make-array 4 :initial-element nil))

;; a one-dimensional array is also called a vector
(vector "a" 'b 3)

(defparameter *v1* (vector "a" 'b 3))

;; simple-vector ref
(svref *v1* 1)

