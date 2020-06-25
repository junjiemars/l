;; Conceptually, packages are symbol-tables, mapping names to symbols.

(package-name *package*)

(find-package "COMMON-LISP-USER")

;; Usually a symbol is interned in the package that was current at the time
;; it was read.thy
(symbol-package 'sym)
(symbol-package 'gensym)

;; Reading the expression caused `sym' to be interned.
(setf sym 99)

(make-package 'XXX
              :use '(common-lisp))
;; using `slime' change package to XXX
;; inspect the `sym' symbol
;; common-lisp-user::sym

(export 'sym)
(common-lisp-user:sym)
(unintern 'sym)

(import 'common-lisp-user:sym)
(use-package 'common-lisp-user)
