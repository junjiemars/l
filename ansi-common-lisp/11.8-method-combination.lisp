
(defgeneric price (x)
  (:method-combination +))


(defclass jacket () ())

(defclass trousers () ())

(defclass suit (jacket trousers) ())


(defmethod price + ((jk jacket)) 350)
(defmethod price + ((tr trousers)) 200)


(price (make-instance 'suit))


