;;; 2.3. The Interaction Environment

;;; convert cons from immutable to mutable
(define cons (let () (import scheme) cons))


;;; mutally recursive procedures

(define yin (lambda () (- (yang) 1)))

(define yang (lambda () (+ (yin) 1)))


;;; free-identifier=?

(library (A) (export a)
  (import (rnrs))
  
  (define-syntax a
    (lambda (x)
      (syntax-case x ()
        [(_ id) (free-identifier=? #'id #'undefined)]))))

(let () (import (A)) (a undefined))

