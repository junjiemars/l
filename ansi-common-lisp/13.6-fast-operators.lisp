
;; `eql' is the default predicate for testing identity
(eql #\a #\a)
(eql 1 1)
(eql '(a b c) '(a b c))

;; `eq' more faster?
(eq #\a #\a)
(eq 1 1)
(eq '(a b c) '(a b c))

;; in `sbcl', in some cases, `eql' has less processor cycles
(disassemble #'eql)
(disassemble #'eq)
(time (eql 'a 'a))
(time (eq 'a 'a))


;; calling `reduce' can be a more effcient alternative to `apply' when
;; the function in question has a rest parameter.
(apply #'+ '(1 2 3))
(reduce #'+ '(1 2 3))


