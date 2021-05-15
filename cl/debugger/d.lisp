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

;;; (before-debugger-enter)
;;; (before-debugger-enter #'error)


(defun break-on-a-type-error (x)
	(let ((*break-on-signals* 'type-error))
		(signal 'type-error :expected-type 'fixnum :datum x)))

(defun break-on-a-arithmetic-error (x)
	(let ((*break-on-signals* 'arithmetic-error))
		(ignore-errors
		 (error 'division-by-zero
						:operands (list x 0)
						:operation '/))))


;;; (break-on-a-type-error 42.0)
;;; (break-on-a-arithmetic-error 3)

