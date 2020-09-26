;;; 

(c-define (print-list x y #!rest z)
          (int char float)
          int
          "print_list"
          ""                            ; global, otherwise "static"
          (let ((lst (cons x (cons y z))))
            (write lst)
            (newline)
            (length lst)))


(println (print-list 3 #\A 3.14))
