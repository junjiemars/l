#lang racket

; fn definition and call

(define (f1 x y)
  (+ x y))

(define f2
  (λ (x y)
    (* x y)))

((λ (x) (add1 x)) 1)


; rest arguments

((λ x (cdr x)) 1 2 3)

(define (square x) (* x x))
(define (sum-of-square x y z . args)
  (square (+ x y z (apply + args))))
(define f3
  (λ (x y z . args)
    (square (+ x y z (apply + args)))))

(= (sum-of-square 1 2 3 4 5)
   (f3 1 2 3 4 5))


; optional arguments
((λ (x [y 2]) (square (+ x y))) 3)
(define (f4 x [y 3])
  (square (+ x y)))
(f4 2)



; keyword arguments
((λ (x #:y y #:z [z 3]) (* (+ x y) z)) 1 #:z 4 #:y 3)
(define (f5 x #:y y #:z [z 3])
  (* (+ x y) z))
(f5 1 #:z 4 #:y 3)



; arity sennsitive arguments
(define f6
  (case-lambda
    [(x) (square x)]
    [(x y) (square (+ x y))]
    [(x y z) (square (+ x y z))]
    [(x y z . args) (square (+ x y z (apply + args)))]))


; fn call
((λ (f x) (f (f x)))
 square 3)

; local functions
(define (count-instances x xs)
  (let ([fn1 (λ (s)
               (define (fn2 n ss)
                 (if (empty? ss)
                     n
                     (fn2 (if (eq? x (first ss))
                              (add1 n)
                              n)
                          (rest ss))))
               (fn2 0 s))])
  (map fn1 xs)))
(count-instances 'a
                 (list (list 'a 'b 'c)
                       (list 'b 'a 'a)
                       (list 'a 'a 'b)))
