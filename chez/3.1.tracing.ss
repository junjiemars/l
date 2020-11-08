;;; 3.1. Tracing

;;; syntax: (trace-lambda name formals body1 body2 ...)

(define half
  (trace-lambda half (x)
    (cond [(zero? x) 0]
          [(odd? x) (half (- x 1))]
          [(even? x) (+ (half (- x 1)) 1)])))

(half 5)

;;; syntax: (trace-let name ((var expr) ...) body1 body2 ...)

(define half-let
  (trace-lambda half-let (x)
    (cond [(zero? x) 0]
          [(odd? x) (half-let (trace-let decr-value ()
                                (- x 1)))]
          [(even? x) (+ (half-let (- x 1)) 1)])))

(half-let 5)
