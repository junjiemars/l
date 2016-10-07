#lang racket

(define (ipv4->integer s)
  (let ([ss (regexp-split #rx"\\." s)])
    (apply bitwise-ior
           (map (λ (x y)
                  (arithmetic-shift (string->number x) y))
                ss
                '(24 16 8 0)))))
                 
(define (ipv4->string n)
  (let ([ss (map (λ (x y z)
                   (number->string
                    (arithmetic-shift (bitwise-and x y) z)))
                 (list n n n n)
                 '(#xff000000 #x00ff0000 #x0000ff00 #x000000ff)
                 '(-24 -16 -8 0))])
    (string-join ss ".")))
    