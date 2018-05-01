;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

(require :asdf)

(push (make-pathname :name nil
                     :type nil
                     :version nil
                     :defaults *load-truename*)
      asdf:*central-registry*)
(load "arlo.asd")

(require :arlo)

(sb-ext:save-lisp-and-die
 (sb-ext:posix-getenv "ARLO_BIN")
 ;; (if (string= "Win32" (software-type))
 ;;     "arlo.exe"
 ;;     "arlo")
 
 ;; :toplevel #'xyz
 :compression t
 :executable t)

(sb-ext:exit 0)
