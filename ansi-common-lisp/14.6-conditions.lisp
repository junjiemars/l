(error "Your report uses ~A as a verb." 'status)

(let ((sandwich '(ham on rye)))
  (assert (eql 'chicken (car sandwich))
          ((car sandwich))
          "I wanted a ~A sandwich." 'chicken)
  sandwich)

;; ignore-errors macro 
(defun user-input (prompt)
  (format t prompt)
  (let ((s (read-line)))
    (or (ignore-errors (read-from-string s)))))
