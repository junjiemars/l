;;; 3.1. Tracing

;;; syntax: (trace-lambda name formals body1 body2 ...)

(define half
  (trace-lambda half (x)
    (cond [(zero? x) 0]
          [(odd? x) (half (- x 1))]
          [(even? x) (+ (half (- x 1)) 1)])))

(half 5)

;;; syntax: (trace-let name ((var expr) ...) body1 body2 ...)

(define half-let
  (trace-lambda half-let (x)
    (cond [(zero? x) 0]
          [(odd? x) (half-let (trace-let decr-value ()
                                (- x 1)))]
          [(even? x) (+ (half-let (- x 1)) 1)])))

(half-let 5)


;;; syntax: (trace-do ((var init update) ...) (test result ...) expr ...)

(define (reverse1 ls)
	(trace-do ([old ls (cdr old)]
						 [new '() (cons (car old) new)])
		((null? old) new)))

;;; syntax: trace

(define (half1 x)
  (cond [(zero? x) 0]
        [(odd? x) (half1 (- x 1))]
        [(even? x) (+ (half1 (- x 1)) 1)]))

(define-syntax trace1
	(syntax-rules ()
		[(_ var ...)
		 (begin
			 (set-top-level-value!
				'var
				(let ([p (top-level-value 'var)])
					(trace-lambda var args (apply p args)))) ...)]))


(trace1 half1)
(half1 5)

;;; syntax: (untrace var1 var2 ...)

(define square-minus-one
	(lambda (x)
		(- (* x x) 1)))

(square-minus-one 3)
(trace square-minus-one * -)

;;; syntax: (trace-define var expr)
;;; syntax: (trace-define var .idspec) body1 body2 ...)

(let ()
	(trace-define plus
		(lambda (x y)
			(+ x y)))
	(list (plus 3 4) (+ 5 6)))
