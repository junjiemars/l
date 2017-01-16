;;;; arlo.asd

(sb-posix:putenv "DYLD_LIBRARY_PATH=/opt/local/lib")

(asdf:defsystem #:rocks.trunk.web.arlo
  :description "Describe arlo here"
  :author "南山竹"
  :license "Specify license here"
  :depends-on (#:wookie)
  :serial t
  :components ((:file "package")
               (:file "arlo")))


