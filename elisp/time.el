;;;; -*- lexical-binding:t -*-


(defmacro time (expr)
  "Evaluates expr and prints the time it took. Returns the value of expr."
  `(let ((start (current-time))
         (return ,expr))
     (print (format "Elapsed %f secs."
                    (float-time
                     (time-subtract (current-time) start))))
     return))
