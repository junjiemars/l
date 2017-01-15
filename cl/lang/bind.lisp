
#|
values: the intent of this facility is to enable passing multiple values
without consing (i.e., allocating heap memory).
[values function in Common Lisp](http://stackoverflow.com/questions/22795608/values-function-in-common-lisp/22796346)
|#

(values)
(values 1 2)
(type-of (values 1 2 3))

(setf (values q r) (floor 19 4))

;; bind
(destructuring-bind (q r) (multiple-value-list (floor 19 4))
  (list :q q :r r))
;; or more efficient
(multiple-value-bind (q r) (floor 19 4)
  (list :q q :r r))


