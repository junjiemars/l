
(asdf:defsystem :rocks.trunk.elastic.kit
  :description "elastic kit"
  :version "1.0"
  :author "南山竹"
  :depends-on nil
  :components ((:file "packages")
               (:file "kit" :depends-on ("packages"))))
