
(in-package :hi)

(defun sqr (n)
  (declare (optimize (debug 3) (safety 0) (speed 0)))
  (* n n))

(defun cube (n)
  (declare (optimize (debug 3) (safety 0) (speed 0)))
  (* n (sqr n)))

(defun quit (&optional code)
  ;; This group from "clocc-port/ext.lisp"
  #+sbcl (sb-ext:exit :code code)
  #+abcl (cl-user::quit)
  #+ecl (si:quit)
  (error 'not-implemented :proc (list 'quit code))) 

(defun main ()
  (princ "Hello, Comman Lisp")
  (terpri)
  (princ (format nil "~A~%" "aaa"))
  (quit))

