(define TRUE (lambda (x y) x))

(define FALSE (lambda (x y) y))

(define NOT (lambda (x) (x FALSE TRUE)))

(eq? (NOT TRUE) (NOT (NOT FALSE)))

(define AND (lambda (x y) (x y FALSE)))

(eq? (AND TRUE TRUE) TRUE)
(eq? (AND FALSE TRUE) FALSE)
(eq? (AND TRUE FALSE) FALSE)
(eq? (AND FALSE FALSE) FALSE)

(define OR (lambda (x y) (x TRUE y)))

(eq? (OR TRUE TRUE) TRUE)
(eq? (OR FALSE TRUE) TRUE)
(eq? (OR TRUE FALSE) TRUE)
(eq? (OR FALSE FALSE) FALSE)


(define IFTHENELSE (lambda (p x y) (p x y)))

(= (IFTHENELSE TRUE 1 2) 1)
(= (IFTHENELSE FALSE 1 2) 2)

(define N0 (lambda (s z) z))

(define N1 (lambda (s z) (s z)))

(define N2 (lambda (s z) (s (s z))))

(define S (lambda (n)
						(lambda (f)
							(lambda (x)
								(f ((n f) x))))))


(define λ 'lambda)(y (w y x))

(define-syntax λ
  (syntax-rules ()
    ((_ args body ...)
     (lambda args body ...))))
