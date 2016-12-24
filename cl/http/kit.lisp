
(defpackage :http-kit
  (:use :common-lisp
        :drakma
        :cl-html-parse
        :cl-ppcre
        :yason)
  (:export #:request))

(setf drakma:*header-stream* *standard-output*)

(defun request (url &key (html nil))
  (let ((s (drakma:http-request url)))
    (if html
        (cl-html-parse:parse-html s))))
  

