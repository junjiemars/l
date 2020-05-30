(declaim (optimize (speed 3)
                   (compilation-speed 0)
                   (safety 0)
                   (space 1)
                   (debug 0)))

(defun toc (n)
  (labels ((fn (n acc)
             (declare (type fixnum n acc))
             (if (<= n 1)
                 acc
                 (fn (1- n) (* n acc)))))
    (fn n 1)))

(defun ploy (a b x)
  (declare (type fixnum a b x))
  (the fixnum (+ (the fixnum (* a (the fixnum (expt x 2))))
                 (the fixnum (* b x)))))
