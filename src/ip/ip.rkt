#lang racket


(define ipv4->integer
  (case-lambda
    [(s)
     (let ([xs (regexp-split #rx"\\.|/" s)])
       (match xs
         [(list a b c d) (ipv4->integer a b c d)]
         [(list a b c d e) (ipv4->integer a b c d e)]))]
    [(a b c d) (ipv4->integer a b c d "8")]
    [(a b c d e)
     (let* ([ns (map string->number
                     (list a b c d))]
            [n (apply bitwise-ior
                      (map (λ (x y) (arithmetic-shift x y))
                           ns
                           '(24 16 8 0)))]
            [nm (string->number e)])
       (list n ns nm))]))

(define ipv4->string
  (case-lambda
    [(n)
     (match-let ([(list a b c d)
                  (map (λ (x y z)
                         (arithmetic-shift (bitwise-and x y) z))
                       (list n n n n)
                       '(#xff000000 #x00ff0000 #x0000ff00 #x000000ff)
                       '(-24 -16 -8 0))])
       (ipv4->string a b c d))]
    [(a b c d)
     (let* ([ss (map number->string
                     (list a b c d))]
            [s (string-join ss ".")])
       (cons s ss))]))
                 
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
  (let ([xs (second (ipv4->integer s))])
    (match xs
      [(list 0 0 0 0) #t]
      [(list 10 _ _ _) #t]
      [(list 127 _ _ _) #t]
      [(list 172 16 _ _) #t]
      [(list 192 168 _ _) #t]
      [_ #f])))



(define (ipv4-class s)
  (let ([i (first (ipv4->integer s))])
    (cond
      [(and (>= i (car class-a)) (< i (cdr class-a)))
       (cons "Class A" class-a)]
      [(and (>= i (car class-b)) (< i (cdr class-b)))
       (cons "Class B" class-b)]
      [(and (>= i (car class-c)) (< i (cdr class-c)))
       (cons "Class C" class-c)]
      [(and (>= i (car class-d)) (< i (cdr class-d)))
       (cons "Class D" class-d)]
      [(and (>= i (car class-e)) (< i (cdr class-e)))
       (cons "Class E" class-e)])))


(define (ipv4-netmask n)
  (let ([m #xffffffff])
    (bitwise-xor m (arithmetic-shift m (- n)))))

(define (ipv4-calculate s)
  (let* ([ns (ipv4->integer s)]
         [address (string-join (map number->string
                                    (second ns))
                                    ".")]
         [netmask (ipv4-netmask (third ns))])
    netmask))
