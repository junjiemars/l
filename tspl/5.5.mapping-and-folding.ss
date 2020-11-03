;;; procedure: (map procedure list1 list2 ...)

(map abs '(1 -2 3 -4 5 -6))

(map (lambda (x y)
       (* x y))
     '(1 2 3 4)
     '(8 7 6 5))

(define map1
  (lambda (f ls . more)
    (if (null? more)
        (trace-let m1 ([ls ls])
                   (if (null? ls)
                       '()
                       (cons (f (car ls))
                             (m1 (cdr ls)))))
        (trace-let m2 ([ls ls] [more more])
                   (if (null? ls)
                       '()
                       (cons (apply f (car ls) (map1 car more))
                             (m2 (cdr ls) (map1 cdr more))))))))

(map1 abs '(1 -2 3 -4))

(map1 (lambda (x y)
        (* x y))
      '(1 2 3)
      '(8 7 6))

(map1 (lambda (x y z)
        (* x y z))
      '(1 2 3)
      '(2 3 45)
      '(3 4 56))
