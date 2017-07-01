
(defstruct rectangle
  height width)

(defstruct circle
  radius)

(defun area (x)
  (cond ((rectangle-p x)
         (* (rectangle-height x) (rectangle-width x)))
        ((circle-p x)
         (* pi (expt (circle-radius x) 2)))))

(let ((r (make-rectangle)))
  (setf (rectangle-height r) 2
        (rectangle-width r) 3)
  (area r))

(let ((c (make-circle)))
  (setf (circle-radius c) 10)
  (area c))


(defclass rectangle1 ()
  (height width))


(defclass circle1 ()
  (radius))


(defmethod area1 ((x rectangle1))
  (* (slot-value x 'height)
     (slot-value x 'width)))

(defmethod area1 ((x circle1))
  (* pi (expt (slot-value x 'radius) 2)))


(let ((r (make-instance 'rectangle1)))
  (setf (slot-value r 'height) 2
        (slot-value r 'width) 3)
  (area1 r))


(let ((c (make-instance 'circle1)))
  (setf (slot-value c 'radius) 10)
  (area1 c))


(defclass colored ()
  (color))


(defclass colored-circle (circle1 colored)
  ())

(let ((c (make-instance 'colored-circle)))
  (setf (slot-value c 'radius) 10
        (slot-value c 'color) 'blue)
  (format t "the area of ~A circle is ~A ~%"
          (slot-value c 'color)
          (area1 c))
  (area1 c))
