

;; list as set

(defparameter *s1* (loop repeat 10 collect (random 100)))
(defparameter *s2* (loop repeat 10 collect (random 100)))

(union *s1* *s2*)
(intersection *s1* *s2*)
(set-difference *s1* *s2*)
(set-difference *s2* *s1*)
(set-exclusive-or *s1* *s2*)
(adjoin 2 *s1*)
(adjoin 2 *s1*)
(member 2 *s1*)

;; hash-table as set
(defparameter *s3*
  (let ((s (make-hash-table)))
    (loop repeat 10
         collect (setf (gethash (random 100) s) nil))
    s))

(defparameter *s4*
  (let ((s (make-hash-table)))
    (loop repeat 10
         collect (setf (gethash (random 100) s) nil))
    s))


(defun hash-set-union (a b)
  (let ((u (make-hash-table)))
    (loop for k being the hash-keys of a
         do (setf (gethash k u) t))
    (loop for k being the hash-keys of b
         do (setf (gethash k u) t))
    u))

(defun hash-set-intersection (a b)
  (let ((d (make-hash-table)))
    (loop for k being the hash-keys of a
         when (gethash k b)
         do (setf (gethash k d) t))
    d))


;; bits pattern

(defparameter *b1* #b1011)
(defparameter *b2* #b11001)

(setf *print-base* 2)

;; union
(logior *b1* *b2*)

;; intersection
(logand *b1* *b2*)

;; remove element 1 from set *b1*
(setf (ldb (byte 1 1) *b1*) 0)
