(require 'asdf)
(require 'cmp)

;; (setf *load-verbose* nil)
;; (setf *compile-verbose* nil)
;; (setf c::*suppress-compiler-warnings* t)
;; (setf c::*suppress-compiler-notes* t)
;; (setf c::*compile-in-constants* t)

(push (make-pathname :name nil
                     :type nil
                     :version nil
                     :defaults *load-truename*)
      asdf:*central-registry*)

;;;
;;; This will show you what is running behind the walls of ASDF. Everything
;;; is built on top of the powerful C::BUILDER routine, which allows one
;;; to build anything from executables to shared libraries.
;;;
;;(trace c::builder)

;;;
;;; Now we attempt building a single FASL file containing all those files.
;;; Notice that we remove any previous fasl file.
;;;

(princ "

Building FASL file 'hi.fasb'

")
(asdf:make-build :hi :type :fasl :move-here "./")

;;;
;;; Now we load the previous file!
;;;

(princ "

Loading FASL file hi.fasb

")
(load "hi.fasb")

;;;
;;; Now that it worked, we attempt building a single program file with everything.
;;;

(princ "

Building standalone executable 'hi' ('hi.exe' in Windows)

")
(asdf:make-build :hi
                 :type :program
                 :epilogue-code '(hi:main)
                 :move-here "./")

;;;
;;; Test the program
;;;

(princ "

Executing standalone file 'hi'

")
(ext:system "./hi")

;;;
;;; Clean up everything
;;;

(mapc #'delete-file (append (directory "*.o")
                            (directory "*.obj")
                            (directory "hi-mono*")))

(ext:quit 0)
