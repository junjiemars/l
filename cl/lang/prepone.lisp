;;;; prepone

(defun prepone ()
  (load-time-value (get-internal-real-time)))
