
;; `float' fn converts any real number to a floating-point number
(mapcar #'float '(1 2/3 .5))


;; reducing numbers to integers is not necessarily conversion,
;; because it can involve some loss of information
(truncate 1.3)
(let ((n 1.3))
  (multiple-value-bind (first second) (truncate n)
    (list :first first :second second
          (eql (- n first) second))))


;; => (<= x N)
(floor 1.3)
(let ((n 1.3))
  (multiple-value-bind (first second) (floor n)
    (list :first first :second
          second (eql (- n first) second))))

;; => (>= x N)
(ceiling 1.3)
(let ((n 1.3))
  (multiple-value-bind (first second) (ceiling n)
    (list :first first :second second
          (eql (- n first) second))))


;; `truncate' toward zero
;; `floor' toward -infinite
;; `ceiling' toward +infinite
(defun our-truncate (n)
  (if (> n 0)
      (floor n)
      (ceiling n)))


;; `round' and `fround' produce a quotient that has been
;; rounded to the nearest mathematical integer;
;; if the mathematical quotient is exactly halfway
;; between two integers, (that is, it has the form integer+1/2), then the
;; quotient has been rounded to the even (divisible by two) integer
(mapcar #'round '(-2.5 -1.5 1.5 2.5))


;; (mod x y) == (_ second) <= (floor x y)
(mod 2 3)
(let ((n 2) (d 3))
  (list (mod n d)
        (eql (mod n d)
             (multiple-value-bind (_ y) (floor n d)
               (declare (ignore _))
               y))))


;; (rem x y) == (_ second) <= (truncate x y)
(rem 2 3)
(let ((n 2) (d 3))
  (list (rem n d)
        (eql (rem n d)
             (multiple-value-bind (_ y) (truncate n d)
               (declare (ignore _))
               y))))


(mapcar #'signum '(-2 -0.0 0.0 0 .5 3))


;; `ratios' and `complex' numbers are conceptually two-part structures

(numerator 1/3)
(denominator 1/3)

(numerator 1)
(denominator 3)

(realpart #c (1 2.0))
(imagpart #c (1 2.0))

(realpart 1)
(imagpart 2.0)
(imagpart 2)

;; (and (< 0 x) (< x n))
(random 10)

