
(asdf:defsystem :rocks.trunk.elastic.kit
  :description "elastic kit"
  :version "1.0"
  :author "南山竹"
  
  :depends-on (:drakma
               :flexi-streams
               :cl-json
               :cl-html-parse
               :cl-ppcre)
               
  :components ((:file "packages")
               (:file "kit" :depends-on ("packages"
                                         "url"))
               (:module "url"
                        :components ((:file "url")))))
