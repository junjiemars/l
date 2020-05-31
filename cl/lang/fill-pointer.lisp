(defparameter *fp1* (make-array 8
                                :initial-element 1
                                :fill-pointer 2))

(array-has-fill-pointer-p *fp1*)

(= 2 (fill-pointer *fp1*))

(vector-push 2 *fp1*)
(vector-push 3 *fp1*)

(= 3 (vector-pop *fp1*))
(= 2 (vector-pop *fp1*))
