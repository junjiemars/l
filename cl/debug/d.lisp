;;; 1. don't compile and load, just compile neccessary
;;; 2. invoke debugger
;;; 3. break into debugger
;;; 4. *debugger-hook*


(defun type-error1 (datum)
	(make-condition 'type-error
									:expected-type 'fixnum
									:datum datum))

(invoke-debugger )
(error 'type-error :expected-type 'fixnum :datum 42.0)


(defun ignore-arithmetic-error (x)
	(ignore-errors
		 (error 'division-by-zero
						:operands (list x 0)
						:operation '/)))

(defun break-on-a-arithmetic-error (x)
	(let ((*break-on-signals* 'arithmetic-error))
		(ignore-errors
		 (error 'division-by-zero
						:operands (list x 0)
						:operation '/))))

(defun break-on-a-type-error (x)
	(let ((*break-on-signals* 'type-error))
		(signal 'type-error :expected-type 'fixnum :datum x)))


(ignore-arithmetic-error 3)
(break-on-a-arithmetic-error 3)
(break-on-a-type-error 3)

(break "abc")


(defun before-debugger-enter (&optional (who #'error))
	(catch 'tag
		(let ((*debugger-hook*
						(lambda (condition old-debugger-hook)
							(declare (ignore old-debugger-hook))
							(format *error-output*
											"Condition ~S was suppressed.~%"
											condition)
							(throw 'tag 42))))
			(funcall who "Some error."))))

(before-debugger-enter)
(before-debugger-enter #'break)








