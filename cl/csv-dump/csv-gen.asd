;;;; csv-gen.asd

(asdf:defsystem #:csv-gen
  :description "Describe csv-gen here"
  :author "Junjie Mars"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:cl-csv)
  :components ((:file "package")
               (:file "csv-gen")))
