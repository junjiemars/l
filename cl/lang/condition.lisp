;;;;
;; Condition
;;;;


(define-condition too-expendsive (error)
  ((price :initarg :price
          :reader price))
  (:report (lambda (condition stream)
             (format stream "At ~A Euro~:P that's too expensive."
                     (price condition)))))

(defparameter *price* (make-condition 'too-expendsive :price 49))

(price *price*)

(format nil "~A" *price*)

;; signal does nothing and just returns nil
(list (signal (make-condition 'too-expendsive)) :foo)
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

