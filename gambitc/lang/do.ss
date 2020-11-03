(define factorial
  (lambda (n)
    (do ([i n (- i 1)]
         [a 1 (* a i)])
        ((zero? i) a))))

(define fibonacci
  (lambda (n)
    (if (= n 0)
        0
        (do ([i n (- i 1)]
             [a1 1 (+ a1 a2)]
             [a2 0 a1])
            ((= i 1) a1)))))
