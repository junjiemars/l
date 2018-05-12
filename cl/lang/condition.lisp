;;;;
;; Condition
;;;;


(define-condition too-expensive (error)
  ((price :initarg :price
          :reader price))
  (:report (lambda (condition stream)
             (format stream "At ~A Euro~:P that's too expensive."
                     (price condition)))))

(defparameter *price* (make-condition 'too-expensive :price 49))

(price *price*)

(format nil "~A" *price*)

;; signal does nothing and just returns nil
(list (signal (make-condition 'too-expensive)) :foo)
(list (signal (make-condition 'error)) :bar)

;; warn
(list (warn (make-condition 'warning)) :baz)

(handler-case
    (signal *price*)
  (error ()
    "ok, it's a signal"))

(handler-case
    (error *price*)
  (error ()
    "ok, it's an error"))

;; cerror takes a format-control string, `M-.' to see definition
;;(cerror "Proceed." *price*)


(defun access-condition (condition)
	(handler-case (signal condition)
		(warning () "Lots of smoke, but no fire.")
		((or arithmetic-error control-error stream-error) (condition)
			(format nil "~S looks especially bad." condition))
		(serious-condition (condition)
			(format nil "~S looks serious." condition))
		(condition () "Hardly worth mentioniong.")))

(access-condition (make-condition 'stream-error :stream *terminal-io*))

(define-condition random-condition (condition)
	()
	(:report (lambda (condition stream)
						 (declare (ignore condition))
						 (princ "Yow" stream))))

(access-condition (make-condition 'random-condition))

(access-condition (make-condition 'serious-condition :bar #x1122))

(defun foo (a b)
	(handler-case (/ a b)
		(division-by-zero (condition) (format t "~A~%" condition))))


(defun handle-division-condition (condition)
	(format t "ddd~%")
	(when (and (typep condition 'arithmetic-error)
						 (eq '/ (arithmetic-error-operation condition)))
		(format t "xxx")))

(handle-division-condition (make-condition 'division-by-zero :operation '/))

