
(asdf:defsystem #:rocks
  :description "another tiny utils"
  :version "1.0"
  :author "南山竹"
  
  :depends-on nil ;; (:common-lisp)
  :serial t
  :components ((:file "seq")
               (:file "lab")))

(defpackage #:rocks/seq
  (:nicknames "S")
  (:use #:cl)
  (:export #:take
           #:range
           #:longer
           #:keys
           #:dohash
					 ))

(defpackage #:rocks/lab
  (:nicknames "L")
  (:use #:cl)
  (:export #:hello-world
					 ))
