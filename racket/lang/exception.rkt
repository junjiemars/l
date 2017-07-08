#lang racket

(with-handlers
    ([exn:fail:contract:divide-by-zero?
      (λ (e) +inf.0)])
  (/ 1 0))

(with-handlers
    ([exn:fail?
      (λ (e) 'air-bag)])
  (error "crash!"))

(with-handlers
    ([(λ (e) (equal? e 2))
      (λ (v) 'two)])
  (raise 2))

(define (always-fail n)
  (with-handlers
      ([even? (λ (v) 'even)]
       [positive? (λ (v) 'positive)])
    (raise n)))

;; catch all includes exn:break
(with-handlers
    ([(λ (x) #t)
      (λ (v) 'oops)])
  (car 17))

;; just catch exn:fail?
(with-handlers
    ([exn:fail?
      (λ (x) 'oops)])
  ;; simulate C-c
  ;; (break-thread (current-thread))
  (car 18))

(with-handlers
    ([exn:fail:contract?
      (λ (x) 'catch-you)])
  (car 19))


