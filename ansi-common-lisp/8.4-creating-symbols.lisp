;; 14.4-packages.lisp

;; A symbol that belongs to a package is said to be `interned' in that
;; package. Functions and variables have symbols as their
;; names. Packages enforce modularity by restricting which symbols are
;; accessible, and thus, which functions and variables one can refer
;; to.

;; notice the second argument, default is `*package*'
(intern "RANDOM-SYMBOL")


