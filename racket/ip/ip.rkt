#lang racket

(define (integer->bytes n)
  (map (λ (x y z)
         (arithmetic-shift (bitwise-and x y) z))
       (list n n n n)
       '(#xff000000 #x00ff0000 #x0000ff00 #x000000ff)
       '(-24 -16 -8 0)))

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
     (match-let ([(list a b c d) (integer->bytes n)])
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


(define (ipv4-private? ns)
  (match ns
    [(list 0 0 0 0) #t]
    [(list 10 _ _ _) #t]
    [(list 127 _ _ _) #t]
    [(list 172 16 _ _) #t]
    [(list 192 168 _ _) #t]
    [_ #f]))



(define (ipv4-class n)
  (cond
    [(and (>= n (car class-a)) (< n (cdr class-a)))
     (cons "Class A" class-a)]
    [(and (>= n (car class-b)) (< n (cdr class-b)))
     (cons "Class B" class-b)]
    [(and (>= n (car class-c)) (< n (cdr class-c)))
     (cons "Class C" class-c)]
    [(and (>= n (car class-d)) (< n (cdr class-d)))
     (cons "Class D" class-d)]
    [(and (>= n (car class-e)) (< n (cdr class-e)))
     (cons "Class E" class-e)]))


(define (ipv4-netmask n)
  (let ([m #xffffffff])
    (bitwise-xor m (arithmetic-shift m (- n)))))

(define (bytes->string-in-binary ns)
  (string-join (map (λ (x)
                      (~r x
                          #:base 2
                          #:pad-string "0"
                          #:min-width 8))
                    ns)
               "."))

(define (ipv4-calculate s)
  (let* ([nl (ipv4->integer s)]
         [n (first nl)]
         [ns (second nl)]
         [nm (third nl)]
         [address (string-join (map number->string ns)
                               ".")]
         [netmask (ipv4-netmask nm)]
         [wildcard (bitwise-xor netmask #xffffffff)]
         [network (bitwise-and netmask n)]
         [broadcast (bitwise-ior network wildcard)]
         [hostmin (bitwise-ior network 1)]
         [hostmax (sub1 broadcast)]
         [hosts (add1 (- hostmax hostmin))])
    (hash "ADDRESS" (cons address (bytes->string-in-binary ns))
          "NETMASK" (cons (car (ipv4->string netmask))
                          (bytes->string-in-binary (integer->bytes netmask)))
          "WILDCARD" (cons (car (ipv4->string wildcard))
                           (bytes->string-in-binary
                            (integer->bytes wildcard)))
          "NETWORK" (cons (string-append (car (ipv4->string network))
                                         "/" (number->string nm))
                          (bytes->string-in-binary (integer->bytes network)))
          "BROADCAST" (cons (car (ipv4->string broadcast))
                            (bytes->string-in-binary
                             (integer->bytes broadcast)))
          "HOSTMIN" (cons (car (ipv4->string hostmin))
                          (bytes->string-in-binary
                           (integer->bytes hostmin)))
          "HOSTMAX" (cons (car (ipv4->string hostmax))
                          (bytes->string-in-binary
                           (integer->bytes hostmax)))
          "HOSTS/NET" (cons hosts
                            (string-append (car (ipv4-class n))
                                           (if (ipv4-private? ns)
                                               " (Private Network)"
                                               ""))))))
