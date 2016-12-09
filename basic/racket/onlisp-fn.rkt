#lang racket

;; onlisp

(define (last1 lst)
  (car (last lst)))

(define (single lst)
  (and (cons? lst) (null? (cdr lst))))

(define (append1 lst v)
  (append lst (list v)))

(define (mklist v)
  (if (list? v) v (list v)))

(define (longer x y)
  (define (iter x y)
    (and (cons? x)
         (or (null? y)
             (iter (cdr x) (cdr y)))))
  (if (and (list? x) (list? y))
      (iter x y)
      (> (length x) (length y))))
