
(loop for i from 1 to 10 collecting i)

(loop for x across "the quick brown fox jumps over the lazy dog"
   counting (find x "aeiou"))

;; when a loop has mulitple `for' clauses, then loop terminates
;; as soon as any `for' clause reachs its end condition.
(loop
   for i in '(a b c)
   for j from 1 to 10
   collect j)

;; counting loop
(loop for i from 0 to 10 collect i)
(loop for i to 10 collect i)
(loop for i from 0 downto -10 by 2 collect i)
(loop for i downfrom 0 to -10 by 2 collect i)

;; loop through collections

;; loop over list
(loop for i in '(a b c) collect i)
(loop for i in '(a b c) by #'cdr collect i)
(loop for i on '(a b c) collect i)
(loop for i on '(a b c) by #'cddr collect i)

;; loop across string or vector
(loop for i across "abcd" collect i)
(loop for i across '#(a b c d) collect i)

;; loop through package
(loop for p being the present-symbols in
     (find-package :cl)
     counting p)
(loop for p being the external-symbols in
     (find-package :cl)
     counting p)

;; equal-then iteration
;; (loop for var = initial-value-form [ then step-form ] ...)
(loop repeat 5
     for x = 0 then y
     for y = 1 then (+ x y)
     collect y)
(loop repeat 5
     for y = 1 then (+ x y)
     for x = 0 then y
     collect y)
(loop repeat 5
     for x = 0 then y
     and y = 1 then (+ x y)
     collect y)


(loop for i below 10
   and a = 0 then b
   and b = 1 then (+ b a)
   finally (return a))

