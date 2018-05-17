
(defpackage "CTR"
  (:use "COMMON-LISP")
  (:export "COUNTER" "INCREMENT" "CLEAR"))

(in-package ctr)

(defclass counter ()
  ((state :initform 0)))

(defmethod increment ((c counter))
  (incf (slot-value c 'state)))

(defmethod clear ((c counter))
  (setf (slot-value c 'state) 0))


#|


(defparameter *x* (make-instance 'ctr:counter))

(ctr:increment *x*)
(ctr:increment *x*)

(ctr:clear *x*)
(ctr:increment *x*)
(ctr:increment *x*)

|#
