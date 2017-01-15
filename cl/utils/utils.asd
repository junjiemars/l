
(asdf:defsystem #:rocks.trunk.utils
  :description "another tiny utils"
  :version "1.0"
  :author "南山竹"
  
  :depends-on nil ;; (:common-lisp)
  :serial t
  :components ((:file "package")
               (:file "seq" :depends-on ("package"))
               (:file "sym" :depends-on ("package"))))
