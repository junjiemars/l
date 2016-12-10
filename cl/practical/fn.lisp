

;; (declaim (optimize (speed 0) (debug 3)))

(defun verbose-sum (x y)
  "Sum any two numbers x and y after printing a message."
  (format t "summing ~d and ~d.~%" x y)
  (+ x y))

(defun sum3 (x y &optional z)
  (list x y (if z z 0)))

(defun sum4 (x y &optional (z 0) (a 10))
  (list x y z a))

(defun rectangle (width &optional (height width))
  (list :width width :height height))

(defun sum4-suplied (x y &optional (z 0 z-suplied-p))
  (list x y z z-suplied-p))

(defun sum8 (&rest values)
  (list values))

(defun named-args-fn (x &key (y 0) (z 10 z-suplied-p) (a (+ x y)))
  (list x y z z-suplied-p a))

(defun named-args-fn (x &key
                          ((:apple y))
                          ((:berry z) 0 z-suplied-p))
  (list x y z z-suplied-p))



