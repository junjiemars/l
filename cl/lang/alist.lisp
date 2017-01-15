
;;;; association list

(defparameter *a* (list (cons 'superman 'metropolis)
                      (cons 'batman 'gotham-city)))

;; lookup
(assoc 'batman *a*)
(assoc 'spiderman *a*)

;; push
(push (cons 'spiderman 'aaa) *a*)

;; duplicate/pop
(setf *a* (acons 'donald-duck 'entenhausen *a*))
(setf *a* (acons 'donald-duck 'entenhausen *a*))
(pop *a*)

;; manipulation: if not existing then add new one
(push (cons 'spiderman 'tokyo) *a*)
(setf (cdr (assoc 'batman *a*)) 'new-york-city)

;; :test

(defparameter *a1* '(("Superman" . "metropolis")
                     ("batman" . "gotham city")))
(assoc "batman" *a1*)
(assoc "batman" *a1* :test 'string=)
(assoc "superman" *a1* :test 'string=)
(assoc "superman" *a1* :test 'string= :key 'string-downcase)

;;
(assoc-if #'(lambda (x) (>= (length x) 6)) *a1*)

;;
(defparameter *a2* (pairlis (list "superman" "batman" "Donald Duck")
                            (list "Metropolis" "Gotham City" "Duckburg")))
;; search by value
(rassoc "Duckburg" *a2* :test 'string=)

;; sort
(sort *a1* #'string< :key #'car)



