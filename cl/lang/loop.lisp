
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

;; local variables
(loop 
   with x = 100
   with y = -50
   for i from 1 to 10
   collect (+ x y i))

;; destructuring variables
(loop for (a b) in '((1 2) (3 4) (5 6))
   do (format t "a:~a; b:~a~%" a b))
(loop for (a nil) in '((1 2) (3 4) (5 6))
     collect a)
(loop for cons on '((1 2) (3 4) (5 6))
     do (format t "~a" (car cons))
     when (cdr cons) do (format t ", "))
(loop for (item . rest) on '((1 2) (3 4) (5 6))
   do (format t "~a" item)
   when rest do (format t ", "))

;; value accumulation
(let ((r (loop repeat 10 collect (random 100))))
  (format t "~a~%" r)
  (loop for i in r
       counting (evenp i) into evens
       counting (oddp i) into odds
       summing i into total
       maximizing i into max
       minimizing i into min
       finally (return (list total max min evens odds))))

;; uncoditional executation
(block outer
  (loop for i from 0 return 100)
  (print "this will be print"))
(block outer
  (loop for i from 0 do (return-from outer 100))
  (print "this will not be print"))

;; conditional execution
;; conditional test-form loop-clause
(loop for i to 10
     when (evenp i) sum i)
(loop for i to 10
     unless (oddp i) sum i)
(loop for i to 100
     if (evenp i) sum i into even-total
     else sum i into odd-total
     finally (return (list (+ even-total odd-total) even-total odd-total)))

(loop for i below 10
   and a = 0 then b
   and b = 1 then (+ b a)
   finally (return a))

;; termination test
(loop for i to 10 by 2 always (evenp i))
(loop for i to 10 by 2 never (oddp i))
(loop for c across "abc123" thereis (digit-char-p c))


;; loop just macro
(pprint (macroexpand '(loop for i to 10 collect i)))

;; circular list
(loop for i in '#1=(a b c . #1#)
     repeat 9 collect i)
(defparameter *c* '#1=(a b c . #1#))
(setf *print-circle* t)
