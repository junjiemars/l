;;; 5.4 Resursion And Iteration

;;; syntax: (let name ((var expr) ...) body1 body2 ...)
;;; syntax ((letrec ((name (lambda (var ...) body1 body2 ...)))
;;;            name)
;;;         expr ...)


(define divisors
  (lambda (n)
    (let f ([i 2])
      (cond
       [(>= i n) '()]
       [(integer? (/ n i)) (cons i (f (+ i 1)))]
       [else (f (+ i 1))]))))

(divisors 32)

(define divisors1
  (lambda (n)
    (let f ([i 2] [ls '()])
      (cond
       [(>= i n) (reverse ls)]
       [(integer? (/ n i)) (f (+ i 1) (cons i ls))]
       [else (f (+ i 1) ls)]))))

(divisors1 32)

;;; syntax: (do ((var init update) ...) (test result ...) expr ...)
;;; returns: the value of the last result expression

