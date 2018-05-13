;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-


(pushnew *default-pathname-defaults*
				 asdf:*central-registry*)
(asdf:load-system #:rocks)

(in-package #:rocks/lab)

(hello-world)

(format t "~A~%" (split-string #\, "a,b,c"))

(interruptable)
