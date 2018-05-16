
(defun env-checking ()
  (list
   (short-site-name)
   (long-site-name)
   (lisp-implementation-type)
   (lisp-implementation-version)
   (machine-instance)
   (machine-type)
   (machine-version)
   (software-type)
   (software-version)))

;; set/unset env variables
(sb-posix:getenv "NINJA")
(sb-posix:setenv "NINJA" "Jakawa" 1)
(string= "Jakawa" (sb-posix:getenv "NINJA"))
(sb-posix:unsetenv "NINJA")

;; command-line arguments
sb-ext:*posix-argv*

;; create a executable: a Lisp Image
;; run sbcl from console
#|
(defun foo ()
  (format t "Hello, world!~%The time is ~A~%" (get-universal-time)))
(sb-ext:save-lisp-and-die #p"foo.exe" :toplevel #'hello :executable t)
|#
