;;; 9.5. String Port

;;; procedure: (open-input-string string)

(let ([p (open-input-string "hi mom!")])
  (let ([x (read p)])
    (list x "," (read p))))

;;; procedure: (with-input-from-string string thunk)

(with-input-from-string "(cons 3 4)"
  (lambda ()
    (eval (read))))

;;; procedure: (open-output-string)

;;; procedure: (get-output-string string-output-port)

(let ([p (open-output-string)])
  (write 'hi p)
  (write-char #\space p)
  (write 'mom! p)
  (get-output-string p))

;;; procedure: (with-output-to-string thunk)

(with-output-to-string
  (lambda ()
    (display "Once upon a time ...")
    (newline)))
