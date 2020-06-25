;; Symbols as data objects and as names for things.
;; But the range of possible Lisp symbols is broader than the range of 
;; variable names allowed in most lanugages.

;; using `slime' to inspect it
;; By default CL converts all alphabetic characters in a symbol's name
;; into uppercase as they are read. This means that, by default, CL is not
;; case-sensitive.

(symbol-name 'abc)

(eql 'abc 'Abc)

(CaR '(a b c))

;; There is a special syntax for referring to symbols whose names
;; contain whitespace or other things that might otherwise be
;; significant to the reader.

;; reserved case
(list '|Lisp 1.5| '|| '|abc| '|ABC|)

;; when the name of such a symbol in || is read, there is no case
;; conversion.
(eql '|abc| '|ABC|)
(eql 'abc '|ABC|)

;; Remember that the vertical bars are a special syntax for denoting
;; symbols. They are not part of the symbol's name
(symbol-name '|a b c|)
(symbol-name '|a b \|c|)

