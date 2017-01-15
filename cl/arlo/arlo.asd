;;;; arlo.asd

(asdf:defsystem #:rocks.trunk.web.arlo
  :description "Describe arlo here"
  :author "南山竹"
  :license "Specify license here"
  :depends-on (#:wookie)
  :serial t
  :components ((:file "package")
               (:file "arlo")))

