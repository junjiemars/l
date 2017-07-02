
(defclass speaker () ())

(defmethod speak ((s speaker) string)
  (format t "~A" string))


(speak (make-instance 'speaker)
       "I'm hungry")


(defclass intellectual (speaker) ())


(defmethod speak :before ((i intellectual) string)
  (princ "Perhaps "))

(defmethod speak :after ((i intellectual) string)
  (princ " in some sense"))


(speak (make-instance 'intellectual)
       "I am hungry")


(defclass courtier (speaker) ())

(defmethod speak :around ((c courtier) string)
  (format t "Does the King belive that ~A? " string)
  (if (eql (read) 'yes)
      (if (next-method-p) (call-next-method))
      (format t "Indeed, it is a preposterous idea. ~%."))
  'bow)

#|
(speak (make-instance 'courtier) "kings will last")

(speak (make-instance 'courtier) "kings will last")
|#
