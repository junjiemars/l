;;; 5.3 Conditionals

;;; syntax: (if test consequent alternative)
;;; syntax: (if test consequent)

(let ((ls '(a b c)))
  (if (null? ls)
      '()
      (cdr ls)))

(let ((ls '()))
  (if (null? ls)
      '()
      (cdr ls)))

(let ((abs (lambda (x)
             (if (< x 0)
                 (- x)
                 x))))
  (abs -4))

(let ((x -4))
  (if (< x 0)
      (list 'minus (- x))
      (list 'plus x)))


;;; procedure: (not obj)
;;; returns: #t if obj is false, #f otherwise
;;; equivalent to (lambda (x) (if x #f #t))

(not #f)
(not #t)
(not '())
(not (< 4 5))

;;; syntax: (and expr ...)

(eq? #t (and))

(and 1 2 3)

(and 1 2 (< 3 2) (+ 4 5))

;;; syntax: (or expr ...)

(eq? #f (or))

;;; syntax: (cond clause1 clause2 ...)
;;; clause:
;;; (test)
;;; (test expr1 expr2 ...)
;;; (test => expr) ;; (apply expr (test))
;;; (else expr expr2 ...)

(let ((x 0))
  (cond
   ((= x 0))
   ((< x 0) (list 'minus (abs x)))
   ((> x 0) (list 'plus x))))

(define select
  (lambda (x)
    (cond ((not (symbol? x)))
          ((assq x '((a . 1) (b . 2) (c . 3))) => cdr)
          (else 0))))

(select 3)
(select 'b)
(select 'e)

;;; auxillary keywords: else, =>

;;; syntax: (when test-expr expr1 expr2 ...)
;;; syntax: (unless test-expr expr1 expr2 ...)


(define-syntax when1
  (syntax-rules ()
    [(_ e0 e1 e2 ...)
     (if e0 (begin e1 e2 ...))]))

(define-syntax unless1
  (syntax-rules ()
    [(_ e0 e1 e2 ...)
     (when1 (not e0) (begin e1 e2 ...))]))


;;; syntax: (case expr0 clause1 clause2 ...)
;;; clause:
;;; ((key ...) expr1 expr2 ...)
;;; (else expr1 expr2 ...)

(let ([x 4] [y 5])
  (case (+ x y)
    [(1 3 5 7 9) 'odd]
    [(0 2 4 6 8) 'even]
    [else 'out-of-range]))

