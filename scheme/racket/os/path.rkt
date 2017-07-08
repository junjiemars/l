#lang racket

(define s "/tmp")
(define p (string->path s))
(define b (path->bytes p))
(define e (string->path-element "tmp"))
(define abc (string->path "/a/b/c"))

(path->string (string->path s))
(path->bytes (string->path "/tmp"))
(path->string e)

(build-path (string->path "/") e)

(system-path-convention-type)
(path-convention-type p)

(path<? (string->path "/a") (string->path "/b"))

(split-path abc)
(explode-path abc)

(file-name-from-path (path-add-extension abc #".rkt"))

(find-system-path 'home-dir)
