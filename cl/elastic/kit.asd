
(asdf:defsystem #:rocks.trunk.elastic.kit
  :description "elastic kit"
  :version "1.0"
  :author "南山竹"
  
  :depends-on (#:drakma
               #:flexi-streams
               #:cl-json
               #:cl-html-parse
               #:cl-ppcre)

  :serial t
               
  :components ((:file "package")
               (:module "url"
                        :components ((:file "url")))
               (:file "kit" :depends-on ("package"
                                         "url"))
               (:file "search" :depends-on ("kit"))))

               
                        
