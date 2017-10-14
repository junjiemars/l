;;;; -*- lexical-binding:t -*-

(defun list+ (seq n)
  (mapcar #'(lambda (x) (+ x n)) seq))

(let ((counter 0))
  (defun new-id () (cl-incf counter))
  (defun reset-id () (setq counter 0)))


(defun make-adder (n)
  #'(lambda (x) (+ x n)))

(defun make-adderb (n)
  #'(lambda (x &optional change)
      (if change
          (setq n x)
        (+ x n))))

(defun make-dbms (db)
  (list
   #'(lambda (key)
       (cdr (assoc key db)))
   #'(lambda (key val)
       (push (cons key val) db))
   #'(lambda (key)
       (setf db (delete key db))
       key)))
