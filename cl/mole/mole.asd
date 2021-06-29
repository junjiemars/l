;;;; mole.asd

(asdf:defsystem #:mole
  :description "Describe mole here"
  :author "Junjie Mars"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:drakma
							 #:cl-ppcre
							 #:flexi-streams
							 #:yason)
  :components ((:file "package")
               (:file "mole")))
