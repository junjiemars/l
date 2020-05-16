;;;; idiot.asd

(asdf:defsystem #:idiot
  :description "Describe idiot here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:cl #:cffi #:cl-autowrap #:cl-plus-c #:trivial-garbage)
  :components ((:file "package")
               (:file "idiot")))
