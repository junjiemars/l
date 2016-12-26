
(asdf:defsystem :rocks.trunk.spam
  :description "tiny spam filter"
  :version "1.0"
  :author "南山竹"
  :depends-on nil
  :components ((:file "packages")
               (:file "alpha" :depends-on ("packages"))))
