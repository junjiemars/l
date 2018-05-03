;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

(require :asdf)

(push (make-pathname :name nil
                     :type nil
                     :version nil
                     :defaults *load-truename*)
      asdf:*central-registry*)
(load "rocks.asd")

(require :rocks)

(sb-ext:save-lisp-and-die
 #-win32 "rocks" #+win32 "rocks.exe"
 ;; :toplevel #'xyz
 :compression #-win32 t #+win32 nil
 :executable t)

(sb-ext:exit 0)
