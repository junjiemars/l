;;; I/O: Streams and Files

*standard-input*
*standard-output*
*error-output*

(defun foo (n)
	(make-list n :initial-element (read)))

(with-input-from-string (*standard-input* "42")
	(foo 3))

(with-output-to-string (*standard-output*)
	(apropos 'foo))

(let ((result (with-output-to-string (ss)
								(let ((out (make-synonym-stream '*standard-output*)))
									(print 42 out)
									(let ((*standard-output* ss))
										(print 43 out))
									(print 44 out)))))
	result)


(progn
	(write-char #\.)
	(sleep 2)
	(write-char #\.)
	(values))

(progn
	(write-char #\.)
	(force-output *standard-output*)
	(sleep 2)
	(write-char #\.)
	(values))

(with-open-file (in "~/.sbclrc"
										:element-type '(unsigned-byte 8))
	(file-length in))


(defun file-at-once (filespec &rest open-args)
	(with-open-stream (ss (apply #'open filespec open-args))
		(let* ((buffer (make-array (file-length ss)
															 :element-type (stream-element-type ss)
															 :fill-pointer t))
					 (position (read-sequence buffer ss)))
			(setf (fill-pointer buffer) position)
			buffer)))

(defun number-of-users ()
	(count #\Newline (file-at-once "/etc/passwd"
																 :element-type 'character)))

(number-of-users)


;;; broadcast streams

(with-open-file (s1 "/tmp/foo1" :direction :output)
	(with-open-file (s2 "/tmp/foo2" :direction :output)
		(let ((out (make-broadcast-stream s1 s2)))
			(format out "This line goes to foo1 and foo2~%")
			(format s1 "Only foo1~%")
			(format s2 "Only foo2~%")
			(format out "Again both files~%"))))

(file-at-once "/tmp/foo1")
(file-at-once "/tmp/foo2")


;;; synonym streams

(with-open-file (log "/tmp/log1" :direction :output)
	(let ((log (make-broadcast-stream log *error-output*)))
		(format log "An error occurred~%")
		(with-open-file (*error-output* "/tmp/log2" :direction :output)
			(format log "Another error occurred~%"))
		(format log "Zounds! Again an error!~%")))

(file-at-once "/tmp/log1")
(file-at-once "/tmp/log2")
