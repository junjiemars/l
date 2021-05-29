;;; stepping
;;; 1. compile foo



(defun foo (a)
	(declare (optimize debug))
	(let* ((b (random 5))
				 (c (expt a b)))
		(- c a)))

(step (foo 3))

