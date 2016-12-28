
(defpackage :rocks.trunk.elastic.kit
  (:nicknames "ES-KIT")
  (:use :common-lisp
        :drakma
        :flexi-streams
        :cl-html-parse
        :cl-ppcre
        :yason)
  ;; (:import-from :drakma)
  (:export #:lookup))
