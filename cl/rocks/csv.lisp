
;; (in-package #:rocks.trunk.utils)

(defun read-csv-line (string readtable)
	(let ((*readtable* readtable))
		(with-input-from-string (ss string)
			(loop for o = (read ss nil nil)
				 while o
				 collect o))))

(defun read-csv-file (filespec &key ((:separator separator) #\,))
	(let ((readtable (copy-readtable)))
		(set-syntax-from-char separator #\Space readtable)
		(with-open-file (in filespec
												:direction :input
												:external-format :utf-8)
			(loop for line = (read-line in nil nil)
				 while line
				 collect (read-csv-line line readtable)))))
