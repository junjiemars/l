;;;; idiot.lisp

(in-package #:idiot)

(define-foreign-library liblept
  (:darwin (:or "liblept.5.dylib" "liblept.dylib"))
  (t (:default "liblept")))


