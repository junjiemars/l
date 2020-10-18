;;; 5.2 Sequencing
;;; syntax: (begin expr1 expr2 ...)

(begin)

(begin 1 2)

(begin
  (define x1 3)
  (set! x1 (+ x1 1))
  (+ x1 x1))

(= 7 (let ()
       (begin
         (define x2 3)
         (+ x2 x1))))

(define swap-pair!
  (lambda (x)
    (let ((temp (car x)))
      (set-car! x (cdr x))
      (set-cdr! x temp)
      x)))

(swap-pair! (cons 'a 'b))
