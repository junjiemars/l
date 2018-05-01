;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-
;;;;
;;;; arlo.asd

;; (sb-posix:putenv "DYLD_LIBRARY_PATH=/opt/local/lib")

(defpackage #:arlo
  (:use #:cl)
  (:export :hello-world))


(asdf:defsystem #:arlo
  :description "Describe arlo here"
  :author "南山竹"
  :license "Specify license here"
  :depends-on (#:cl-ppcre)
  :serial t
  :components ((:file "arlo")))


