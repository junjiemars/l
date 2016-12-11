
;; want a clojure like: take, range
;; how to do that?

(defun take (n seq)
  (labels ((iter (n seq acc)
             (if (or (<= n 0) (null seq))
                 acc
                 (iter (1- n) (cdr seq) (cons (car seq) acc)))))
    (nreverse (iter n seq nil))))

(defun range (max &key (min 0) (step 1))
  (loop for n from min below max by step
       collect n))
