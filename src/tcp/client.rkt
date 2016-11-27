#lang racket

(require racket/tcp)

(define (http-request host port)
  (define-values (in out) (tcp-connect host port))
  (let* ([p "GET HTTP/1.1\r\nHost:~a\r\nUserAgent:~a\r\nAccept:~a\r\n"]
         [s (format p host "xyz/1.2" "*/*")])
    (write s out)
    (flush-output out)
    (displayln (read-line in))
    (close-input-port in)
    (close-output-port out)))
    
    
  