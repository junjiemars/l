
;;;; Property Lists

(defparameter *l* (list 'superman 'metropolis
                        'batman 'gotham-city))

;; lookup
(getf *l* 'superman)
(getf *l* 'donald-duck 'nirvana)

;; new one
(setf *l* (list* 'donald-duck 'duckburg *l*))
(setf *l* (list* 'spiderman 'new-york-city *l*))

;; remove
(getf *l* 'donald-duck)
(remf *l* 'donald-duck)

;;
(get-properties *l* '(batman spiderman))

(defparameter *l1*
  (loop for c in '(:a :b :c :d :e :f)
       for code = (char-code (char (symbol-name c) 0))
       collect c 
       collect code))
