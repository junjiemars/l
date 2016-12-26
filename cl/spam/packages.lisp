
(defpackage :rocks.trunk.spam
  (:use :common-lisp
        :cl-ppcre)
  (:export
   #:extract-words
   #:extract-features))
