;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-


;; 1.2 Write a function to exponentiate, or raise a number to an integer
;; power.

(defun power (x n)
	"Power raises X to the nth power, N must be an integer >= 0.
This executes in log N time, because of the check for even N."
	(cond ((= n 0) 1)
				((evenp n) (expt (power x (/ n 2)) 2))
				(t (* x (power x (- n 1))))))

;; linear iteration
(defun power1 (x n)
	(if (= n 0)
			1
			(* x (power1 x (1- n)))))

;; linear tail recursion
(defun power2 (x n)
	(labels ((iter (x n p)
						 (if (= n 0)
								 p
								 (iter x (1- n) (* x p)))))
		(iter x n 1)))

;; log N tail recursion
(defun power3 (b n)
	(flet ((square (b) (* b b)))
		(cond ((= 0 n) 1)
					((evenp n) (power (square b) (/ n 2)))
					(t (* b (power (1- n)))))))


(defun count-atoms (exp)
	"Return the total number of non-nil atoms in the expression."
	(cond ((null exp) 0)
				((atom exp) 1)
				(t (+ (count-atoms (first exp))
							(count-atoms (rest exp))))))
