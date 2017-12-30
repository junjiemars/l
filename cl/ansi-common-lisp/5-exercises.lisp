
#|
Q1: Translate the following expressions into equivalent expressions 
that don't use let or let*, and don't cause the same expression to be
evaluated twice.

(a) (let ((x (car y)))
      (cons x x))

(b) (let* ((w (car x))
           (y (+ w z)))
      (cons w y))
|#

((lambda (x) (cons x x)) (car y))

((lambda (w)
   ((lambda (y) (cons w y)) (+ w z))) (car x))
