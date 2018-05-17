
(defmethod combine (x y)
  (list x y))


(combine 'a 'b)


(defclass stuff ()
  ((name :accessor name
         :initarg :name)))

(defclass ice-cream (stuff) ())


(defclass topping (stuff) ())


(defmethod combine ((ic ice-cream)
                    (top topping))
  (format nil "~A ice-cream with ~A topping."
          (name ic)
          (name top)))

(combine (make-instance 'ice-cream :name 'fig)
         (make-instance 'topping :name 'treacle))

(combine 23 'skiddoo)


(defmethod combine ((ic ice-cream) x)
  (format nil "~A ice-cream with ~A."
          (name ic)
          x))

(combine (make-instance 'ice-cream :name 'grape)
         (make-instance 'topping :name 'marshmallow))

(combine (make-instance 'ice-cream :name 'clam)
         'reluctance)


(defmethod combine ((x number) (y number))
  (+ x y))

(defmethod combine ((x (eql 'powder))
                    (y (eql 'spark)))
  'boom)



