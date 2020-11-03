;;; -*- mode:gambit-mode

(define half
  (lambda (x)
    (cond [(zero? x) x]
          [(odd? x) (half (- x 1))]
          [(even? x) (- (half (- x 1)))])))
