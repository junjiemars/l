#lang racket

#|
* the struct getters and setters have readable names.
* the struct can have fields added to its defintion without changing
existing references.
* an instance of a struct is reprensented as a single object in memory,
so it can be passed around a program **by reference** (meaning, it's not
duplicated if plassed from one function to another).
* a struct has its own unique predicate, which can be efficiently tested
(say, inside a **contract**).
|#

(struct style (color size weight) #:transparent #:mutable)
(define s (style "red" 42 'bold))

(style? s)
(style-color s)
(set-style-color! s "blue")
(string=? "blue" (style-color s))
