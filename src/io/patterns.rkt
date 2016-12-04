#lang racket

(define (upcase-lines in)
  (for ([l (in-lines in)])
    (display (string-upcase l))
    (newline)))

(upcase-lines
 (open-input-string
  (string-append
   "Hello, world!\n"
   "Can you hear me, now?")))


(define (has-hello? in)
  (regexp-match? #rx"hello" in))

(has-hello? (open-input-string "abc hello 123"))


;; copy in to out
(define out-str (open-output-string))
(copy-port (open-input-string "boom") out-str)
(get-output-string out-str)