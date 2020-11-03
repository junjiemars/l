(define vector->list1
  (lambda (s)
    (do ([i (- (vector-length s) 1) (- i 1)]
         [ls '() (cons (vector-ref s i) ls)])
        ((< i 0) ls))))

(define list->vector1
  (lambda (ls)
    (let ([s (make-vector (length ls))])
      (do ([ls ls (cdr ls)]
           [i 0 (+ i 1)])
          ((null? ls) s)
        (vector-set! s i (car ls))))))
