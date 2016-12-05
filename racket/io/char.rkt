#lang racket

(define ss "a中1")
(let ([s (open-input-string ss)])
  (print (read-char s))
  (newline)
  (print (read-char s))
  (newline)
  (print (read-char s))
  (print (read-char s)))

(newline)

(let ([b (open-input-string ss)])
  (list (read-byte b)
        (read-byte b)
        (read-byte b)
        (read-byte b)
        (read-byte b)
        (read-byte b)))

(newline)
  