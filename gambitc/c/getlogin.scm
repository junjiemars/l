;; (c-declare #<<c-declare-end
;;            #include <unistd.h>
;;            c-declare-end)

(define getlogin
  (c-lambda ()
            (pointer "char")
            "getlogin"))

(define (main . args)
  (display (getlogin))
  (newline))
