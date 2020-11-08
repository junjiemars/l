;;; 5.6. Continuations

;;; procedure: (call/cc procedure)
;;; procedure: (call-with-current-continuation procedure)

(define member1
  (lambda (x ls)
    (call/cc
     (lambda (break)
       (do ([ls ls (cdr ls)])
           ((null? ls) #f)
         (when (equal? x (car ls))
           (break ls)))))))

(member1 'd '(a b c))
(member1 'b '(a b c))

;;; procedure: (dynamic-wind in body out)
;;; returns: values resulting from the application of body

(let ([p (open-input-file "input-file")])
  (dynamic-wind
    (lambda () #f)
    (lambda () (process p))
    (lambda () (close-port p))))

(define-syntax unwind-protect
  (syntax-rules ()
    [(_ body cleanup ...)
     (dynamic-wind
       (lambda () #f)
       (lambda () body)
       (lambda () cleanup ...))]))

((call/cc
  (let ([x 'a])
    (lambda (k)
      (unwind-protect
       (k (lambda () x))
       (set! x 'b))))))

(define-syntax fluid-let
  (syntax-rules ()
    [(_ ((x e)) b1 b2 ...)
     (let ([y e])
       (let ([swap (lambda ()
                     (let ([t x])
                       (set! x y)
                       (set! y t)))])
         (dynamic-wind swap (lambda () b1 b2 ...) swap)))]))
