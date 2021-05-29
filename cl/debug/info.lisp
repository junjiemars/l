(defvar foo 42
	"A variable with the same name as the function FOO.")

(declaim (ftype (function (integer integer) t) bar))

(defun foo (x y)
	"Computes the BAR of X and Y and binds FOO."
	(let ((foo 23))
		(bar x y)))

(defun bar (a b)
	"Computes FLOOR after switching the arguments."
	(floor b a))
