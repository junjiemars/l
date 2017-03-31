
;; let/let* can be replaced by lambda expr

(= (let ((a 1) (b 2) (c 3))
     (+ a b c))
   ((lambda (a b c)
      (+ a b c)) 1 2 3))

(= (let* ((a 1) (b (* 2 a)) (c (* 3 b)))
     (+ a b c))
   ((lambda (a)
      ((lambda (b)
         ((lambda (c)
            (+ a b c)) (* 3 b)))
       (* 2 a)))
    1))


