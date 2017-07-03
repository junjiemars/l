

(eql 'a 'a)

(defpackage "A"
  (:use "COMMON-LISP")
  (:nicknames "A")
  (:export "aaa"))

(defpackage "B"
  (:use "COMMON-LISP")
  (:nicknames "B")
  (:export "aaa"))

;; Q1: Is it possible for two symbols to have the same name but not be eql?
(and (string= (symbol-name 'a:|aaa|)
              (symbol-name 'b:|aaa|))
     (not (eql 'a:|aaa| 'b:|aaa|)))

;; Q2: 
