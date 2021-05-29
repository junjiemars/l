;;; Hofstadter sequence

;;; F(0) = 1
;;; M(0) = 0
;;; F(n) = n - M(F(n-1)), n > 0
;;; M(n) = n - F(M(n-1)), n > 0


(defun female (n)
	(cond ((zerop n) 1)
				(t (- n (male (female (1- n)))))))

(defun male (n)
	(cond ((zerop n) 0)
				(t (- n (female (male (1- n)))))))


(trace female)
(female 3)
(trace male)


(trace)
(untrace female male)
