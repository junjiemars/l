
(let ((y 7))
  (defun scope-test (x)
    (list x y)))

(let ((y 123))
  (scope-test 3))

(let ((x 1))
  (format t ">L1 ~a~%" x)
  (let ((x 2))
    (format t ">L2 ~a~%" x)
    (let ((x 3))
      (format t ">L3 ~a~%" x))
    (format t "<L2 ~a~%" x))
  (format t "<L1 ~a~%" x))

(defvar *f1*
  (let ((count 0))
    (lambda ()
      (setf count (1+ count)))))

(defparameter *f2*
  (let ((count 0))
    (list
     (lambda () (incf count))
     (lambda () (decf count))
     (lambda () count))))

(funcall (first *f2*))
(funcall (first *f2*))
(funcall (third *f2*))w
(funcall (second *f2*))
(funcall (third *f2*))

(eq (boundp '*f1*) (boundp '*f2*))

(defvar *xyz* #b0110)
(defconstant +xyz+ #b0001)
