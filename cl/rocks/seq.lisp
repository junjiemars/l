(defpackage #:rocks/seq
  (:use #:common-lisp)
  (:export
   #:range))

(in-package #:rocks/seq)

;; want a clojure like: take, range
;; how to do that?

(defun take (n seq)
  (labels ((iter (n seq acc)
             (if (or (<= n 0) (null seq))
                 acc
                 (iter (1- n) (cdr seq) (cons (car seq) acc)))))
    (nreverse (iter n seq nil))))


(defun range (max &key (min 0) (step 1) (randomized nil))
  (loop for n from min below max by step
     collect (if randomized
                 (+ min (random (1+ (- max min))))
                 n)))


(defun longer (x y)
  (labels ((iter (x y)
             (and (consp x)
                  (or (null y)
                      (iter (cdr x) (cdr y))))))
    (if (and (listp x) (listp y))
        (iter x y)
        (> (length x) (length y)))))

(defmacro keys (h)
  "Return the keys of H"
  `(loop for k being the hash-keys of ,h
      collect k))


(defmacro dohash ((k v h) &body body)
  "Iterate hash do the body"
  (let ((next (gensym "NEXT"))
        (more (gensym "MORE")))
    `(with-hash-table-iterator (,next ,h)
       (loop (multiple-value-bind (,more ,k ,v)
                 (,next)
               (unless ,more (return nil))
               ,@body)))))


;; eof
