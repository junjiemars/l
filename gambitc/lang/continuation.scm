;;; CSE 341: Scheme: Continuations and exceptions
;;; https://courses.cs.washington.edu/courses/cse341/04wi/lectures/15-scheme-continuations.html
;;; https://stackoverflow.com/questions/16529475/scheme-continuations-for-dummies
;;; https://www.scheme.com/tspl4/further.html#./further:h3

(+ 4 (+ 1 2))

(lambda (v) (+ 4 v))

(+ 4 (call/cc (lambda (c)
								(c (+ 1 2)))))

((lambda (c) (c (+ 1 2)))
 (lambda (v) (+ 4 v)))


(call/cc (lambda (x)
					 (* 5 (x 4))))


(+ 1 (call/cc (lambda (k)
                (* 2 (k 3)))))

(+ 1 (* 4 (call/cc (lambda (k)
                     (* 2 (k 3))))))

(let ([x (call/cc (lambda (k) k))])
  (x (lambda (ignore) "hi")))

;; The value of the call/cc is its own continuation, as in the
;; preceding example. This is applied to the identity procedure
;; (lambda (x) x), so the call/cc returns a second time with this
;; value. Then, the identity procedure is applied to itself, yielding
;; the identity procedure. This is finally applied to "HEY!", yielding
;; "HEY!".

(((call/cc (lambda (k) k))              ; return the continuation
  (lambda (x) x))                       ; apply the continuation with λ(x)
 "HEY!")                                ; apply λ("HEY")


(define (product1 xs)
	(cond ((null? xs) 1)
				((= 0 (car xs)) 0)
				(else (* (car xs) (product1 (cdr xs))))))

(define (product2 xs)
	(call/cc (lambda (k)
						 (let fn ((xs1 xs))
							 (cond ((null? xs1) 1)
										 ((= 0 (car xs1)) (k 0))
										 (else (* (car xs1) (fn (cdr xs1)))))))))

(define (product3 xs)
	(call/cc (lambda (k)
						 (let fn ((xs1 xs)
											(acc 1))
							 (cond ((null? xs1) acc)
										 ((= 0 (car xs1)) (k 0))
										 (else (fn (cdr xs1) (* acc (car xs1)))))))))

(define *retry* #f)
(define factorial1
	(lambda (n)
		(if (= 0 n)
				(call/cc (lambda (k) (set! *retry* k) 1))
				(* n (factorial1 (- n 1))))))

