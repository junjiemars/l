
(defclass circle ()
  ((radius :accessor circle-radius
           :initarg :radius
           :initform 0)
   (centor :accessor circle-center
           :initarg :centor
           :initform 0)))

(defclass graphic ()
  ((color :accessor graphic-color
          :initarg :color
          :initform t)
   (visible :accessor graphic-visible
            :initarg :visible
            :initform t)))

(defclass screen-circle (circle graphic)
  ())


