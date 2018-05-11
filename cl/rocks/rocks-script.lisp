;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-


(in-package #:rocks/lab)
(ql:quickload :split-sequence)

(hello-world)

(format t "~A~%" (split-string #\, "a,b,c"))

(interruptable)
