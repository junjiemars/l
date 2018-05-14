;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

#|
Evaluation Rule:
1. Every expression is either a list or an atom
2. Every list to be evaluated either a special form expression or
a function application.
3. A special form expression is defined to be a list whose first element
is a special form oeprator. The expression is evaluted according to the
operator's idiosyncratic evalution rule.
4. A function application is evaluated by first evaluating the arguments
(the rest of the list) and then finding the fuction named by the first element
of the list and applying it to the list of evaluated arguments.
5. Every atom is either a symbol or a nonsymbol.
6. A symbol evalutes to the most recent value that has been assigned to the
variable named by that symbol.
7. A nonsymbol atom evaluated to itself. For now, numbers and strings are the
only such non-symbol atoms we know of.
|#

;; => T
(and (atom 123) (atom "aaa") (atom *print-pretty*))

;; => T
(special-operator-p 'quote)

