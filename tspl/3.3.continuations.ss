;;; 3.3. Continuations

;;; (1) what to evaluate
;;; (2) what to do with the value

(if (null? x) (quote ()) (cdr x))

;; (1) -> (null? x)
;; (2) -> (quote ()) or (cdr x)

;;; "what to do with the value" the continuation of a computations.

(let ((x '(a b c)))
  (if (null? x)
      (quote ())
      (cdr x)))

;;; 1. the value of whole expression,
;;; 2. the value of (null? x),
;;; 3. the value of null?,
;;; 4. the value of x,
;;; 5. the value of cdr, and
;;; 6. the value of x.

(= 4 (call/cc (lambda (k)
                (* 5 4))))

(= 4 (call/cc (lambda (k)
                (* 5 (k 4)))))

(= 6 (+ 2 (call/cc (lambda (k)
                     (* 5 (k 4))))))

;;; nonlocal exit from a recursion

(define product
  (lambda (ls)
    (call/cc
     (lambda (break)
       (trace-let f ([ls ls])
         (cond [(null? ls) 1]
               [(= (car ls) 0) (break 0)]
               [else (* (car ls) (f (cdr ls)))]))))))

(product '(1 2 3 4 5))

(product '(7 3 8 0 19 5))

(let ([x (call/cc (lambda (k) k))])
  (x (lambda (ignore) "hi")))

(((call/cc (lambda (k) k)) (lambda (x) x)) "HEY!")


;;; 

(define retry #f)

(define factorial
  (lambda (x)
    (if (= x 0)
        (call/cc (lambda (k) (set! retry k) 1))
        (* x (factorial (- x 1))))))

(= 24 (factorial 4))
(= 24 (retry 1))
(= 48 (retry 2))

;;; light-weight process

(define lwp-list '())

(define lwp
  (lambda (thunk)
    (set! lwp-list (append lwp-list (list thunk)))))

(define start
  (lambda ()
    (let ([p (car lwp-list)])
      (set! lwp-list (cdr lwp-list))
      (p))))

(define pause
  (lambda ()
    (call/cc
     (lambda (k)
       (lwp (lambda () (k #f)))
       (start)))))

(lwp (lambda () (let f () (pause) (display "h") (f))))
(lwp (lambda () (let f () (pause) (display "e") (f))))
(lwp (lambda () (let f () (pause) (display "y") (f))))
(lwp (lambda () (let f () (pause) (display "!") (f))))
(lwp (lambda () (let f () (pause) (newline) (f))))
(start)
