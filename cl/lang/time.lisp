
;; common-lisp universal time is simply the number of seconds 
;; since the begging of the year 1900
;; 00:00:01 on January 1,1900 UTC
;; like unix time not include leap seconds.

;; unix time since 00:00:01 on January 1,1970 UTC aka POSIX time or Epoch time
;; and not include leap seconds.
;; unix timestamp: date +%s


;; day-of-week start from Monday(0) end to Sunday(6)
;; ~ in (format) constrol string at the end of a line, and ~, newline,
;; whitespace following the newline are removed from the output.

(defun format-universal-time (&key
																(universal-time)
																(unix-time)
																(time-zone))
  (multiple-value-bind
        (second minute hour date month year day-of-week daylight-p zone)
      (if universal-time
					(decode-universal-time universal-time time-zone)
					(get-decoded-time))
		(list :second second
					:minute minute
					:hour hour
					:date date
					:month month
					:year (if unix-time (+ 70 year) year)
					:day-of-week day-of-week
					:daylight-p daylight-p
					:zone zone)))

(decode-universal-time (get-universal-time))
(encode-universal-time 01 1 13 2 1 17 -8)
(get-decoded-time)


(ql:quickload :local-time)
(local-time:now)
(local-time:encode-timestamp 123456789 0 10 12 23 12 1965)
(local-time:parse-timestring "1965-12-23")
(local-time:reread-timezone-repository)
