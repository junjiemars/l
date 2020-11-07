;;; 7.4. String and Bytevector 

;;; procedure: (open-bytevector-input-port bytevector)
;;; procedure: (open-bytevector-input-port bytevector ?transcoder)

(let ([ip (open-bytevector-input-port #vu8(1 2))])
  (let* ([x1 (get-u8 ip)]
         [x2 (get-u8 ip)]
         [x3 (get-u8 ip)])
    (list x1 x2 (eof-object? x3))))

;;; procedure: (open-string-input-port string)

(get-line (open-string-input-port "hi.\nwhat's up?\n"))

;;; procedure: (open-bytevector-output-port)
;;; procedure: (open-bytevector-output-port ?transcoder)
;;; returns: two values, a new output port and an extraction procedure

(let-values ([(op g) (open-bytevector-output-port)])
  (put-u8 op 15)
  (put-u8 op 73)
  (put-u8 op 115)
  (set-port-position! op 2)
  (let ([bv1 (g)])
    (put-u8 op 27)
    (list bv1 (g))))

;;; procedure: (open-string-output-port)
;;; returns: two values, a new textual output port and an extraction procedure

(let-values ([(op g) (open-string-output-port)])
  (put-string op "some data")
  (let ([s1 (g)])
    (put-string op "new stuff")
    (list s1 (g))))

;;; procedure: (call-with-bytevector-output-port procedure)
;;; procedure: (call-with-bytevector-output-port procedure ?transcoder)
;;; returns: a bytevector containing the accumulated bytes

(let ([tx (make-transcoder
           (latin-1-codec)
           (eol-style lf)
           (error-handling-mode replace))])
  (call-with-bytevector-output-port (lambda (p)
                                      (put-string p "abc"))
                                    tx))

;;; procedure: (call-with-string-output-port procedure)
;;; returns: a string containing the accumulated characters

(define (object->string x)
  (call-with-string-output-port
   (lambda (p)
     (put-datum p x))))

(object->string (cons 'a '(b c)))
