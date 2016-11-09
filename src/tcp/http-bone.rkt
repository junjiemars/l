#lang racket

(require racket/tcp)

(define (server port)
  (define listener (tcp-listen port 5 #t))
  (define (loop)
    (on-accept listener)
    (loop))
  (loop))

(define (on-accept listener)
  (define-values (in out) (tcp-accept listener))
  (handle in out)
  (close-input-port in)
  (close-output-port out))

(define (handle in out)
  ; Discard the request header (up to blank line):
  (regexp-match #rx"(\r\n|^)\r\n" in)
  ; Send reply:
  (display "HTTP/1.1 200 OK\r\n" out)
  (display "Server: Racket/0.1.0\r\n" out)
  (display "Content-Type: text/html\r\n\r\n" out)
  (display "<html><body>Hello, world!</body></html>" out))

