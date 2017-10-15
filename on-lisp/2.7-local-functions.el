;;;; -*- lexical-binding:t -*-

(mapcar #'copy-tree '((a b) (c d e)))

(defun list+ (seq n)
  (mapcar #'(lambda (x) (+ x n))
          seq))

(require 'cl)

(cl-labels ((inc (x) (1+ x)))
  (inc 0))

(defun counter-instance (obj lsts)
  (cl-labels ((iter (lst acc)
                    (if (consp lst)
                        (iter (cdr lst)
                              (if (eq obj (car lst))
                                  (1+ acc)
                                acc))
                      acc)))
    (mapcar #'(lambda (x) (iter x 0)) lsts)))


;; iter will be toplevel, it's no good
(defun counter-instance1 (obj lsts)
  (defun iter (lst acc)
    (if (consp lst)
        (iter (cdr lst) (if (eq obj (car lst)) (1+ acc) acc))
      acc))
  (mapcar #'(lambda (x) (iter x 0)) lsts))

