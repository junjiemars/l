#lang racket

;; for other dialect, (require compatibility/defmacro)

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
  (let ([c 0])
    (values (λ () c)
            (λ (v) (set! c v) c))))

(let ([n clock])
  (when (zero? clock)
    (begin (set! clock 10) (clock 0 1 2))))

; macro-generating macros
(define-syntax-rule (define-get/put-id id get put!)
  (define-syntax id
    (syntax-id-rules (set!)
      [(set! id e) (put! e)]
      [(id a (... ...)) (list (get) a (... ...))]
      [id (get)])))

(define-get/put-id clock1 get-clock put-clock!)
(when (= 10 clock1)
  (set! clock1 100)
  (clock1 0 1 2))
      