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

(define class-a
  (cons "1.0.0.0"
        (ipv4->string (arithmetic-shift (- #b10000000 1) 24))))

(define class-b
  (cons (ipv4->string (arithmetic-shift #b10000000 24))
        (ipv4->string (bitwise-ior #x00ff0000
                                   (arithmetic-shift (- #b11000000 1) 24)))))

(define class-c
  (cons (ipv4->string (arithmetic-shift #b11000000 24))
        (ipv4->string (bitwise-ior #x00ffff00
                                   (arithmetic-shift (- #b11100000 1) 24)))))

(define class-d
  (cons (ipv4->string (arithmetic-shift #b11100000 24))
        (ipv4->string (bitwise-ior #x00ffffff
                                   (arithmetic-shift (- #b11110000 1) 24)))))

(define class-e
  (cons (ipv4->string (arithmetic-shift #b11110000 24))
        "254.255.255.254"))