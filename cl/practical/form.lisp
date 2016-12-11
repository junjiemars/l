
(defun fib (n)
  (do ((a 0 (1+ a))
       (cur 0 next)
       (next 1 (+ cur next)))
      ((= n a) cur)))
