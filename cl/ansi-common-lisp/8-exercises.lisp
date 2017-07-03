

(eql 'a 'a)

(defpackage "A"
  (:use "COMMON-LISP")
  (:nicknames "A")
  (:export "aaa"))

(defpackage "B"
  (:use "COMMON-LISP")
  (:nicknames "B")
  (:export "aaa"))


(eql 'a:|aaa| 'b:|aaa|)
