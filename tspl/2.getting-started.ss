;;; 2. getting started


(display "xxx\nabc\n")


;;; (echo '(compile-file "2.getting-started.ss")' | scheme -q

;;; echo '(reset-handler abort) (compile-file "2.getting-started.ss")' \
;;;   | scheme -q


;; (define yin
;;   (lambda ()
;;     (- (yang) 1)))

;; (define yang
;;   (lambda () (+ (yin) 1)))


(+ 1 2 3)

(define fact1
  (lambda (n)
    (if (= n 0)
        1
        (* n (fact1 (- n 1))))))
