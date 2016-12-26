
;; use (asdf:require-system :hi) or (ql:quickload :hi) to load.
(asdf:defsystem :hi
  :description "a hello world common lisp project"
  :version "1.0"
  :author "JunjieMars@gmail.com"
  :depends-on nil
  :components ((:file "packages")
               (:file "hi" :depends-on ("packages"))))
               
                      
