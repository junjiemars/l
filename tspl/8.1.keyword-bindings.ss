;;; 8.1. Keyword Bindings

;;; syntax: (define-syntax keyword expr)

(define-syntax let*1
	(syntax-rules ()
		((_ () b1 b2 ...) (let () b1 b2 ...))
		((_ ((i1 e1) (i2 e2) ...) b1 b2 ...)
		 (let ((i1 e1))
			 (let*1 ((i2 e2) ...) b1 b2 ...)))))

(let*1 ((x 1)
				(y (* x 2))
				(z (+ y 10)))
			 (+ x y z))


(define even?1
	(lambda (x) (or (= x 0) (odd?1 (- x 1)))))
(define-syntax odd?1
	(syntax-rules ()
		((_ x) (not (even?1 x)))))

(trace even?1)
(even?1 10)

(let ()
	(define-syntax bind-to-zero
		(syntax-rules ()
			((_ id) (define id 0))))
	(bind-to-zero x)
	x)
