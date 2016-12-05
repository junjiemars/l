#lang racket

(define ss "a\n中\r\n")
(let ([l (open-input-string ss)])
  (list (read-line l)
        (read-line l 'return-linefeed)
        (read-line l)))

(let ([b (open-input-string ss)])
  (list (read-bytes-line b)
        (read-bytes-line b 'return-linefeed)
        (read-bytes-line b)))

(let ([s (open-input-string ss)])
  (read-string 10 s))


(let ([b (open-input-bytes
          (bytes 6
                 115 101 99 114 101
                 116))])
  (define length (read-byte b))
  (bytes->string/utf-8 (read-bytes length b)))

(let ([buffer (make-string 10 #\_)]
      [s (open-input-string "cketRa")])
  (printf "~s\n" buffer)
  (read-string! buffer s 2 6)
  (printf "~s\n" buffer)
  (read-string! buffer s 0 2)
  (printf "~s\n" buffer))

(let ([buffer (make-bytes 10 (char->integer #\_))]
      [s (open-input-string "cketRa")])
  (printf "~s\n" buffer)
  (read-bytes! buffer s 2 6)
  (printf "~s\n" buffer)
  (read-bytes! buffer s 0 2)
  (printf "~s\n" buffer))