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


(define naive-find
	(lambda (pred xs)
		(cond ((null? xs) '())
					((pred (car xs)) (car xs))
					(else (naive-find pred (cdr xs))))))

(define sophistic-find
	(lambda (pred xs)
		(call/cc (lambda (k)
							 (letrec ((fn (lambda (pred xs1)
															(cond ((null? xs1) (k '()))
																		((pred (car xs1)) (k (car xs1)))
																		(else (fn pred (cdr xs1)))))))
								 (fn pred xs))))))
