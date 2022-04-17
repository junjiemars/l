(define I (lambda (x) x))

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
