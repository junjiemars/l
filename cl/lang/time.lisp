
;; common-lisp universal time is simply the number of seconds 
;; since the begging of the year 1900
;; 00:00:01 on January 1,1900 UTC
;; like unix time not include leap seconds.

;; unix time since 00:00:01 on January 1,1970 UTC aka POSIX time or Epoch time
;; and not include leap seconds.


;; day-of-week start from Monday(0) end to Sunday(6)
;; ~ in (format) constrol string at the end of a line, and ~, newline,
;; whitespace following the newline are removed from the output.

(defun format-decoded-time ()
  (multiple-value-bind
        (second minute hour date month year day-of-week daylight-p zone)
      (get-decoded-time)
    (format t
            "second:~a~%~
             minute:~a~%~
             hour:~a~%~
             date:~a~%~
             month:~a~%~
             year:~a~%~
             day-of-week:~a~%~
             daylight-p:~a~%~
             zone:~a~%"
            second minute hour date month year day-of-week daylight-p zone)))

(decode-universal-time (get-universal-time))
(encode-universal-time 01 1 13 2 1 17 -8)
(get-decoded-time)


;; (ql:quickload :local-time)
(local-time:now)
(local-time:encode-timestamp 123456789 0 10 12 23 12 1965)
(local-time:parse-timestring "1965-12-23")
(local-time:reread-timezone-repository)
