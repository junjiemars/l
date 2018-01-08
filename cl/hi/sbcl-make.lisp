(require :asdf)
(push (make-pathname :name nil
                     :type nil
                     :version nil
                     :defaults *load-truename*)
      asdf:*central-registry*)
(load "hi.asd")

(require :hi)

(sb-ext:save-lisp-and-die
 (if (string= "Windows" (software-type))
     "hi.exe"
     "hi")
 :toplevel #'hi:main :executable t)

(sb-ext:exit 0)
