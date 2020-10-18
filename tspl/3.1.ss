;;; syntax extension

(define-syntax let1
  (syntax-rules ()
    [(_ ((x e) ... ) b1 b2 ...)
     ((lambda (x ...) b1 b2 ...) e ...)]))

(define-syntax and1
  (syntax-rules ()
    [(_) #t]
    [(_ e) e]
    [(_ e1 e2 e3 ...)
     (if e1 (and1 e2 e3 ...) #f)]))

