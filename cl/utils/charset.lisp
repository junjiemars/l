;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-


(defun latin->utf8 (s &key (start 0) end null-terminate)
	(octets-to-string
	 (string-to-octets s
										 :external-format :latin-1
										 :start start :end end :null-terminate null-terminate)
	 :external-format :utf8 :start start :end end))
