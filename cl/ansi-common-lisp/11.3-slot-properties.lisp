
(defclass circle ()
  ((radius :accessor circle-radius
           :initarg :radius
           :initform 0)
   (center :accessor circle-center
           :initarg :center
           :initform 0)))

(defparameter *x* (make-instance 'circle :radius 10))

(setf (circle-center *x*) 1)


(defclass blue-circle (circle)
  ((color :reader circle-color
          :initarg :color
          :initform 'blue)))

(defparameter *y* (make-instance 'blue-circle))

(circle-color *y*)


;; shared slot: `:allocation :class' or default `:allocation :instance'
(defclass tabloid ()
  ((top-story :accessor tabloid-story
              :allocation :class
              :initarg :top-story)))


(defparamter  daily-blab (make-instance 'tabloid)
  unsolicited-mail (make-instance 'tabloid))

(setf (tabloid-story daily-blab) 'adultery-of-senator)
