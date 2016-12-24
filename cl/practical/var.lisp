
(let ((y 7))
  (defun scope-test (x)
    (list x y)))

(let ((y 123))
  (scope-test 3) y)

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
(funcall (third *f2*))
(funcall (second *f2*))
(funcall (third *f2*))

(eq (boundp '*f1*) (boundp '*f2*))

(defvar *xyz* #b0110)
(defconstant +xyz+ #b0001)

(let ((x (list 1 2 3))
      (y 123))
  (setf (car x) (cadr x))
  (setf y (* y y))
  (list x y))
;; (macroexpand '(setf *xyz* (* *xyz* *xyz*)))

;; assigns only once
(defvar *xyz* #xff)
(defparameter *new-value* 234)

;; allways assigns a new value
(defparameter *new-value* #xff)

;; will failed: (cadr x) is not a symbol
#|
 (let ((x '(a b c)))
  (setq (cadr x) (car x)))
|#

;; *symbol-symbol-value* -> T? -> 123
(defparameter *symbol-symbol-value* (gentemp))
(set *symbol-symbol-value* 123)
(eq 123 (symbol-value (symbol-value '*symbol-symbol-value*)))

(defvar *will-in* (make-symbol "abc"))
(eq '|abc| *will-in*)
(find-symbol (string-upcase "*will-in*"))
(import *will-in*)
(find-symbol (string-upcase "*will-in*"))
(eq '|abc| *will-in*)

