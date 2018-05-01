;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-
;;;; arlo.lisp

(in-package #:arlo)

;;; "arlo" goes here. Hacks and glory await!

(defmacro assert* (test-form &rest args)
	"For release (pushnew :arlo-release *feature*)"
	(declare (ignorable test-form args))
	#-:arlo-release
	`(assert ,test-form ,@args))


(defun hello ()
	(format t "Hello~%"))


(defun hello-world (&optional (stream t))
	(format stream "Hello World!~%"))



