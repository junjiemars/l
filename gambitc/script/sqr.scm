#!env gsi-script

;; (define (main arg)
;;   (pretty-print (expt (string->number arg) 2)))

(define (main . args)
  (let ((ns (map (lambda (x)
                   (expt (string->number x) 2))
                 args)))
    (pretty-print ns)))

;;; compile to executable: gsc-script -exe sqr

