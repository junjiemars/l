;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

;; real time which is also sometimes called wall time;
;; run time which is often called CPU time

(get-internal-real-time)
(get-internal-run-time)
internal-time-units-per-second

(time (sqrt 123456789))

(defmacro time1 (form)
	`(let ((rt (get-internal-run-time))
				 (wt (get-internal-real-time)))
		 ,form
		 (format t "Run time: ~,6F seconds~%Real time: ~,6F seconds~%"
						 (/ (- (get-internal-run-time) rt)
								internal-time-units-per-second)
						 (/ (- (get-internal-real-time) wt)
								internal-time-units-per-second))))
