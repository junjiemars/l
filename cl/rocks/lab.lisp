;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-
;;;; lab.lisp
;;;;

(in-package #:rocks/lab)

(defun hello-world ()
	(format t "Hello World!~%"))

(defun split-string (delimiter string)
	(split-sequence:split-sequence delimiter string))
