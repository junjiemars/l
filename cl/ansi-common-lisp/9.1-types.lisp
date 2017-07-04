
;; Common Lisp provides four distinct types of numbers:
;; integers, floating-point numbers, ratios, and complex numbers
(defconstant numbers
  '((real (rational (:ratio
                     :integer (bignum
                               fixnum (bit)))
           :float (short-float
                   single-flot
                   double-flot
                   long-flot))
     :complex)))


;; an integer is written as a string of digits: 2001
(integerp 2001)


;; a floating-point number can be written as a string of digits
;; containing a decimal point, 3.14 or in scientific notation, 314e-2
(floatp 3.14)
(floatp pi)


;; a ratio is written as a fraction of integers: 2/3
(eql 1 (* 3 1/3))


;; complex number `a+bi' is written as #c(a b), where a and b are any
;; two real numbers of the same type
(complexp #c(1 2))
(rationalp #c (1 2))


;; if a numeric function receives one or more floating-point numbers
;; as arguments, the return value will be a floating-point number
;; (or as complex number with floating-point components)
(+ 1 2.0)
(+ #c (0 1.0) 2.0)


;; ratios that divide evenly will be converted into integers
(/ 10 2)


;; complex numbers whose imaginary part would be zero will be
;; converted into reals
(+ #c (1 -1) #c (2 1))
(list (complexp #c (1 0)))

