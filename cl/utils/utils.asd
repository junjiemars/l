
;; use (asdf:require-system :hi) or (ql:quickload :hi) to load.
(asdf:defsystem :utils
  :description "another tiny utils"
  :version "1.0"
  :author "JunjieMars@gmail.com"
  :depends-on nil
  :components ((:file "packages")
               (:file "seq" :depends-on ("packages"))
               (:file "sym" :depends-on ("packages"))))
