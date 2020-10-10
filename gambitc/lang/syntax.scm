;;; 

(define-syntax let1
  (syntax-rules ()
    [(_ ((x e) ...) b1 b2 ...)
     ((lambda (x ...) b1 b2 ...) e ...)]))

(define-syntax and1
  (syntax-rules ()
    [(_) #t]
    [(_ e) e]
    [(_ e1 e2 e3 ...)
     (if e1 (and1 e2 e3 ...) #f)]))

(define-syntax or1
	(syntax-rules ()
		[(_) #f]
		[(_ e) e]
		[(_ e1 e2 e3 ...)
		 (let ([v e1])
			 (if e1 v (or1 e2 e3 ...)))]))

(define flip-flop
  (let ([state #f])
    (lambda ()
      (set! state (not state))
      state)))

(define memoize
  (lambda (proc)
    (let ([cache '()])
      (lambda (x)
        (cond
         [(assq x cache) => cdr]
         [else (let ([ans (proc x)])
                 (set! cache (cons (cons x ans) cache))
                 ans)])))))

(define fibonacci1
  (memoize
   (lambda (n)
     (if (< n 2)
         1
         (+ (fibonacci1 (- n 1))
            (fibonacci1 (- n 2)))))))

(define first
  (lambda (ls)
    (apply (lambda (x . y) x) ls)))

(define rest
  (lambda (ls)
    (apply (lambda (x . y) y) ls)))

(define swap-pair1
  (lambda (x)
    (let ([left (car x)])
      (set-car! x (cdr x))
      (set-cdr! x left)
      x)))

(define divisors
  (lambda (n)
    (let f ([i 2])
      (cond
       [(>= i n) '()]
       [(integer? (/ n i)) (cons i (f (+ i 1)))]
       [else (f (+ i 1))]))))

(and1 1 2 3)

(first '(1 2 3))

((λ (n) (* n n)) 3)
