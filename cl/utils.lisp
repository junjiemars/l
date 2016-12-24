
;; want a clojure like: take, range
;; how to do that?
(defpackage :utils
  (:use :common-lisp)
  (:export #:take
           #:range
           #:longer))


(defun take (n seq)
  (labels ((iter (n seq acc)
             (if (or (<= n 0) (null seq))
                 acc
                 (iter (1- n) (cdr seq) (cons (car seq) acc)))))
    (nreverse (iter n seq nil))))

(defun range (max &key (min 0) (step 1))
  (loop for n from min below max by step
       collect n))

(defun longer (x y)
  (labels ((iter (x y)
             (and (consp x)
                  (or (null y)
                      (iter (cdr x) (cdr y))))))
    (if (and (listp x) (listp y))
        (iter x y)
        (> (length x) (length y)))))
