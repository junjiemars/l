#lang racket

(define tmpfile "/tmp/x.txt")

;; write to a file
(define out (open-output-file #:exists 'truncate tmpfile))
(display "Hello, Racket" out)
(close-output-port out)

;; read from the file
(define in (open-input-file tmpfile))
(read-line in)
(close-input-port in)

;; safe

(call-with-output-file tmpfile
  (λ (out)
    (display "You're in safe" out))
  #:exists 'truncate)

(call-with-input-file tmpfile
  (λ (in)
    (read-line in)))


;; write/read string
(define s (open-output-string))
(display "Write into a string" s)
(get-output-string s)

;; read string from input string
(read-line (open-input-string "goodbye\nfarewell"))

;; write/read via tcp
(define server (tcp-listen 12345))
(define-values (c-in c-out) (tcp-connect "localhost" 12345))
(define-values (a-in a-out) (tcp-accept server))
(display "I'm in TCP" c-out)
(close-output-port c-out)
(read-line a-in)
(read-line a-in)


;; write/read via process pipe
(define-values (p stdout stdin stderr)
  (subprocess #f #f #f "/usr/bin/wc" "-w"))
(display "a b c\n" stdin)
(close-output-port stdin)
(read-line stdout)
(close-input-port stdout)
(close-input-port stderr)

;; write/read via internal pipe
(define-values (i-in i-out) (make-pipe))
(display "garbage" i-out)
(close-output-port i-out)
(read-line i-in)