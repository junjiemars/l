
(defpackage :rocks.trunk.elastic.kit
  (:nicknames "ES-KIT")
  (:use :common-lisp)
  (:local-nicknames (:w :drakma)
                    (:fs :flexi-streams)
                    (:h :cl-html-parse)
                    (:j :cl-json)
                    (:re :cl-ppcre))
#|
    (:use :common-lisp
        :drakma
        :flexi-streams
        :cl-json
        :cl-html-parse
        :cl-ppcre)
 |#
  (:export #:lookup))
