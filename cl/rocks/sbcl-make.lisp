;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

(require :asdf)

(push (make-pathname :name nil
                     :type nil
                     :version nil
                     :defaults *load-truename*)
      asdf:*central-registry*)

(ql:quickload '(:split-sequence
								:inferior-shell
								:external-program))
(load "rocks.asd")

(sb-ext:save-lisp-and-die
 #-win32 "rocks" #+win32 "rocks.exe"
 ;; :toplevel #'xyz
 :compression #-win32 t #+win32 nil
 :executable t)

(sb-ext:exit 0)
