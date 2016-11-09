#lang racket

;; default ports

(display "Hi")
(display "hi, default output port" (current-output-port))


;; stderr
(define (swing-hammer)
  (display "Ouch!" (current-error-port)))
(swing-hammer)

(let ([s (open-output-string)])
  (parameterize ([current-error-port s])
    (swing-hammer)
    (swing-hammer)
    (swing-hammer))
  (get-output-string s))
