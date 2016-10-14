#lang racket

;; pattern-based macro

; single pattern
(define-syntax-rule (swap x y)
  (let ([t x])
    (set! x y)
    (set! y t)))


; multiple patterns with the same id
(define-syntax rotate
  (syntax-rules ()
    [(rotate a b) (swap a b)]
    [(rotate a b c) (begin (swap a b)
                           (swap b c))]))

; matching sequences
(define-syntax rotate1
  (syntax-rules ()
    [(rotate1 a) (void)]
    [(rotate1 a b c ...) (begin
                          (swap a b)
                          (rotate1 b c ...))]))


(let ([red 1] [green 2] [blue 3] [alpha 4])
  (rotate1 red green blue alpha)
  (list red green blue alpha))

; more efficient
(define-syntax rotate2
  (syntax-rules ()
    [(rotate2 a b ...)
     (shift-to (b ... a) (a b ...))]))

(define-syntax shift-to
  (syntax-rules ()
    [(shift-to (from0 from ...) (to0 to ...))
     (let ([tmp from0])
       (set! to from) ...
       (set! to0 tmp))]))

(let ([red 1] [green 2] [blue 3] [alpha 4])
  (rotate2 red green blue alpha)
  (list red green blue alpha))

; identifier macros
(define-syntax clock
  (syntax-id-rules (set!)
    [(set! clock n) (put-clock! n)]
    [(clock a ...) (list (get-clock) a ...)]
    [clock (get-clock)]))

(define-values (get-clock put-clock!)
  (let ([private-clock 0])
    (values (λ () private-clock)
            (λ (v) (set! private-clock v) private-clock))))

(let ([n clock])
  (when (zero? clock)
    (begin (set! clock 10) (clock 0 1 2))))
      