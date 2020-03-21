(define (square x)
  (* x x))

(define (fact n)
  (if (< n 2) 1
      (* n (fact (- n 1)))))

(define (fact1 n acc)
  (if (< n 2)
      acc
      (fact1 (- n 1) (* n acc))))

