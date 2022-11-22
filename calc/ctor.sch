;;; https://tgdwyer.github.io/lambdacalculus/#:~:text=A%20combinatoris%20a%20lambda%20expression%20%28function%29%20with%20no,not%20bound%20to%20any%20parameter%2C%20it%20is%20free.

(define TRUE (lambda (x y) x))

(define FALSE (lambda (x y) y))

(define IF (lambda (b t f) (b t f)))


(define AND (lambda (x y) (IF x y FALSE)))

;;; AND TRUE TRUE
;;; (lambda (x y) (IF x y FALSE)) TRUE TRUE
;;; (IF TRUE TRUE FALSE)
;;; (lambda (b t f) (b t f)) TRUE TRUE FALSE)
;;; (TRUE TRUE FALSE)
;;; (lambda (x y) x) TRUE FALSE
;;; TRUE


(define OR (lambda (x y) (IF x TRUE y)))

;;; OR FALSE TRUE
;;; (lambda (x y) (IF x TRUE y)) FALSE TRUE
;;; (IF FALSE TRUE TRUE)
;;; (lambda (b t f) (b t f)) FALSE TRUE TRUE
;;; (FALSE TRUE TRUE)
;;; (lambda (x y) y) TRUE TRUE
;;; TRUE

(define NOT (lambda (x) (IF x FALSE TRUE)))

;;; NOT FALSE
;;; (lambda (x) (IF x FALSE TRUE)) FALSE
;;; (IF FALSE FALSE TRUE)
;;; (lambda (b t f) (b t f)) FALSE FALSE TRUE
;;; (FALSE FALSE TRUE)
;;; (lambda (x y) y) FALSE TRUE
;;; TRUE

(eq? (NOT (NOT (AND TRUE (OR FALSE TRUE)))) TRUE)


(define XOR (lambda (x y) (OR (AND x (NOT y)) (AND (NOT x) y))))
(define XOR1 (OR (AND x y) (AND (NOT x) (NOT y))))

;;; XOR TRUE TRUE
;;; (OR (AND x (NOT y)) (AND (NOT x) y)) TRUE TRUE
;;; (OR (AND TRUE (NOT TRUE)) (AND (NOT TRUE) TRUE))
;;; (OR (AND TRUE FALSE) (AND FALSE TRUE))
;;; (OR FALSE FALSE)
;;; FALSE


(define N0 (lambda (f) x))
(define N1 (lambda (f x) (f x)))
(define N2 (lambda (f x) (f (f x))))
(define N3 (lambda (f x) (f (f (f x)))))

(define S (lambda (n f x) (f (n f x))))

;;; S N0
;;; (lambda (n f x) (f (n f x))) N0
;;; (f (N0 f x))
;;; (f ((lambda (f x) x) f x))
;;; (f x)

;; (eq? N1 (S N0))



;;  ( λx . x  x) ( λy. y y)
;;; ( λy. y y) ( λy. y y)
;;; ...
;;; ( λy. y y) ( λy. y y)


;;; Y = λf. (λx. f (x x)) (λx. f (x x))

(define Y (lambda (f)
						((lambda (x) (f x x))
						 (lambda (x) (f x x)))))

;;; Y g
;;; (λf. (λx. f (x x)) (λx. f (x x))) g
;;; (λx. g (x x)) (λx. g (x x))
;;; g ((λx. g (x x)) (λx. g (x x)))
;;; g (Y g)
;;; ...
;;; g (g (Y g))

(define fact1 (lambda (n)
								(if (= n 0)
										1
										(* n (fact1 (- n 1))))))



;;; Z = λf. (λx. f (λv. xxv)) (λx. f (λv. xxv))

(define Z (lambda (f)
						((lambda (x) (lambda (v) (x (x v))))
						 (lambda (x) (lambda (v) (x (x v)))))))

;;; Z g
;;; (λf. (λx. f (λv. xxv)) (λx. f (λv. xxv)) g
;;; (λx. g (λv. xxv)) (λx. g (λv. xxv))
;;; g (λv. (λx. g (λv. xxv)) (λx. g (λv. xxv)) v)
;;; g (Z v)


(define S (lambda (x)
						(lambda (y)
							(lambda (z)
								((x z) (y z))))))

(define K (lambda (x)
						(lambda (y)
							x)))

(define B (lambda (x)
						(lambda (y)
							(lambda (z)
								(x (y z))))))

(define C (lambda (x)
						(lambda (y)
							(lambda (z)
								((x z) y)))))

(define T (lambda (x)
						(lambda (y)
							x)))

(define F (lambda (x)
						(lambda (y)
							y)))

(define W (lambda (x)
						(x x)))

(define WW (lambda ()
						 (W W)))

(define Y (lambda (f)
						((lambda (x) ((f (x x))))
						 (lambda (x) (f (x x))))))

(define O (lambda (x)
						((lambda (f) (f ((x x) f)))
						 (lambda (x) (lambda (f) (f ((x x) f)))))))
