
(format t "~A plus ~A equals ~A. ~%"
        2 3 (+ 2 3))


(defun askem (str)
  (format t "~A" str)
  (read))
