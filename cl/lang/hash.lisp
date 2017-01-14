
(defparameter h (make-hash-table))

;; add associated pair
(gethash 'batman h)
(setf (gethash 'batman h) 'gotham-city)
(gethash 'batman h)

(setf (gethash 'spiderman h) nil)
(gethash 'spiderman h)

;; count
(hash-table-count h)

(gethash 'superman h 'metropolis)
(setf (gethash 'superman h) 'metropolis)


;; iterating through a hash table

(maphash (lambda (k v)
           (format t "K:~a V:~a~%" k v)) h)

(defun our-maphash (fn hash)
  (with-hash-table-iterator (next-entry hash)
    (loop (multiple-value-bind (more key value)
              (next-entry)
            (unless more (return nil))
            (funcall fn key value)))))

(loop for hero being the hash-keys of x
   collect hero)

(loop for hero being the hash-values of x
   collect hero)

;;(remhash 'superman h)
;;(clrhash h)
