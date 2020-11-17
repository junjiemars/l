;;; 4.2. Calling out of Scheme

;; syntax: (foreign-procedure conv ... entry-exp (param-type ...) res-type) 
;; returns: a procedure 

(load-shared-object "libc.so.6")

(define c-sleep-block
	(foreign-procedure #f "sleep"
										 (unsigned) unsigned))

(time (c-sleep-block 3))

(foreign-entry? "sleep")


(define c-sleep-safe
	(foreign-procedure __collect_safe "sleep"
										 (unsigned) unsigned))

(time (c-sleep-safe 3))


(define c-getenv
	(foreign-procedure #f "getenv" (string) string))

(c-getenv "SHELL")



(compute-size (cons 0 0))
