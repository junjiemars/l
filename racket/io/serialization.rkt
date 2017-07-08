#lang racket

(struct pt (x y))

(write (pt 1 2))

(define-values (in out) (make-pipe))

;; opaque struct
(write (pt 2 3) out)
#|
;;read: bad syntax `#<'
(read in)
|#

(newline)

;; transparent struct
(struct t-pt (x y) #:transparent)
(define tmpfile "/tmp/pt.txt")

(call-with-output-file tmpfile
  (λ (out)
    (write (t-pt 3 4) out))
  #:exists 'truncate)

(call-with-input-file tmpfile
  (λ (in)
    (read in)))


;; serializable struct
(require racket/serialize)
(serializable-struct s-pt (x y) #:transparent)

(serialize (s-pt 1 2))
(deserialize (serialize (s-pt 1 2)))

(call-with-output-file tmpfile
  (λ (out)
    (write (s-pt 2 3) out))
  #:exists 'truncate)

(call-with-input-file tmpfile
  (λ (in)
    (read in)))
