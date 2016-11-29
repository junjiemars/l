#lang racket

(define *queue* '())

(define (empty-queue?)
  (null? *queue*))

(define (enqueue x)
  (set! *queue* (append *queue* (list x))))

(define (dequeue x)
  (let ((x (car *queue*)))
    (set! *queue* (cdr *queue*))
    x))

(define (fork fn)
  (call/cc
   (λ (x)
     (enqueue x)
     fn)))

(define (yield)
  (call/cc
   (λ (x)
     (enqueue x)
     ((dequeue)))))


(define (thread-exit)
  (if (empty-queue?)
      (exit)
      ((dequeue))))

(define (do-stuff-n-print str)
  (λ ()
    (let loop ((n 0))
      (format "~A ~A\n" str n)
      (yield)
      (loop (add1 n)))))

(fork (do-stuff-n-print "this is aaa"))
(fork (do-stuff-n-print "hello from bbb"))
(thread-exit)

