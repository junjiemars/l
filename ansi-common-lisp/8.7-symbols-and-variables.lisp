;; One potenially confusing thing about Lisp is that symbols are
;; related to variables in two very different ways.

;; When a symbol is the name of a special variable,
;; the value of the variable is stored in a field within the symbol.
(defparameter *x* 123)
(eql (symbol-value '*x*) *x*)


;; A symbol used as a lexical variable is just a placeholder.
;; the compiler will translate it into a reference to a register or
;; a location in memory.
(let ((x 234))
  (list (boundp 'x)
        (when (boundp 'x) x)))
