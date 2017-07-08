#lang racket

;; number types

(and (number? 1)
     (complex? 1+2i)
     (real? (sqrt 5))
     (integer? 2)
     (exact-integer? 3)
     (exact-nonnegative-integer? 0)
     (exact-positive-integer? 1)
     (inexact-real? (sqrt 2))
     (fixnum? -21)
     (flonum? (+ -1.0 +inf.0))
     (zero? 0)
     (positive? 1)
     (negative? -2)
     (even? 0)
     (odd? -1)
     (exact? 1)
     (inexact? -1.0))

;; conversion

(eqv? 1 1.0)
(eqv? 1 (inexact->exact (exact->inexact 1)))

