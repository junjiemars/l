#lang racket

; it's cool and from erlang?

(byte? (char->integer #\A))
(byte? #"apple")
(equal? "apple" #"apple")

(define 3A (make-bytes 3 #x41))
(bytes-set! 3A 0 (+ (bytes-ref 3A 0) #x20))

(bytes->string/utf-8 #"\316\273")
(bytes->string/latin-1 #"\316\273")
