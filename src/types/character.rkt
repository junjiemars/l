#lang racket

;; a character corresponds to a unicode scalar value
;; range from #x0 to #x10ffff bot not including #xd800 to #xdfff

(and (char? #\A) (char? #\λ))

;; conversion
(eqv? #\A (integer->char (char->integer #\A)))

;; utf-8 length
(char-utf-8-length #\λ)

;; equal
(and 
 (char=? #\a #\a (integer->char #x61))
 (char<? #\a #\b #\c)
 (char<=? #\a #\a #\b)
 (char>? #\c #\b #\a)
 (char>=? #\c #\c #\b))

;; case insensitive
(and
 (char-ci=? #\a #\A)
 (char-ci<? #\a #\B)
 (char-ci<=? #\a #\A #\B)
 (char-ci>? #\C #\B #\a)
 (char-ci>=? #\C #\c #\B))

;; classifications
(and
 (char-alphabetic? #\a)
 (char-lower-case? #\a)
 (char-upper-case? #\A)
 (char-numeric? #\1)
 (char-punctuation? #\')
 (char-whitespace? #\space)
 (char-whitespace? #\tab)
 (char-blank? #\tab))

;; conversions
(and 
 (eqv? #\A (char-upcase #\a))
 (eqv? #\a (char-downcase #\A)))
