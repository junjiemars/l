#lang racket

(define (ipv4->strings s)
  (regexp-split #rx"\\." s))

(define (ipv4->integers s)
  (let ([xs (map string->number (ipv4->strings s))])
    xs))

(define (ipv4->integer s)
  (let ([xs (ipv4->integers s)])
    (apply bitwise-ior
           (map (λ (x y) (arithmetic-shift x y))
                xs
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
  (cons #x01000000
        (arithmetic-shift (- #b10000000 1) 24)))

(define class-b
  (cons (arithmetic-shift #b10000000 24)
        (bitwise-ior #x00ff0000
                     (arithmetic-shift (- #b11000000 1) 24))))

(define class-c
  (cons (arithmetic-shift #b11000000 24)
        (bitwise-ior #x00ffff00
                     (arithmetic-shift (- #b11100000 1) 24))))

(define class-d
  (cons (arithmetic-shift #b11100000 24)
        (bitwise-ior #x00ffffff
                     (arithmetic-shift (- #b11110000 1) 24))))

(define class-e
  (cons (arithmetic-shift #b11110000 24)
        #xfefffffe))

(define (ipv4-private? s)
  (let ([xs (ipv4->integers s)])
    (match xs
      [(list 0 0 0 0) #t]
      [(list 10 _ _ _) #t]
      [(list 127 _ _ _) #t]
      [(list 172 16 _ _) #t]
      [(list 192 168 _ _) #t]
      [_ #f])))

(define (ipv4-subnet s)
  (let* ([ss (map string->number
                  (regexp-split #rx"\\.|/" s))])
    #f))

(define (ipv4-class s)
  (let ([i (ipv4->integer s)])
    (cond
      [(and (>= i (car class-a)) (< i (cdr class-a))) (cons "Class A" class-a)]
      [(and (>= i (car class-b)) (< i (cdr class-b))) (cons "Class B" class-b)]
      [(and (>= i (car class-c)) (< i (cdr class-c))) (cons "Class C" class-c)]
      [(and (>= i (car class-d)) (< i (cdr class-d))) (cons "Class D" class-d)]
      [(and (>= i (car class-e)) (< i (cdr class-e))) (cons "Class E" class-e)])))

(define (ipv4-address s)
  (let* ([ss (map string->number
                  (regexp-split #rx"\\.|/" s))]
         [bs (map (λ (b)
                    (~r b
                        #:base 2
                        #:pad-string "0"
                        #:min-width 8)) ss)])
    (cons s (string-join bs "."))))

(define (ipv4-calculator s)
  (let* ([ss (map string->number (regexp-split #rx"\\.|/" s))]
         [address (λ (x xs)
                    (let ([b (map (λ (b)
                                    (~r b
                                        #:base 2
                                        #:pad-string "0"
                                        #:min-width 8)) xs)])
                      (cons x (string-join b "."))))])
    (match ss
      [(list a b c d)
       (let ([e 24])
         (address s ss))]
      [(list a b c d e) e])))
