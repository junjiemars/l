
;; all conses or nil are lists
(and (listp nil) (listp (cons 1 2)))

;; proper list: the last cell is nil
(cons 1 (cons 2 nil))

(list* 1 2 (list 3 4))
(list* 1 2 (list 3 4) 5)

(make-list 3 :initial-element 49)


;; coerce vector to list
(coerce #(1 2 3) 'list)
(map 'list 'identity #(1 2 3))

;; coerce string to list
(coerce "abc" 'list)

(defun integer-to-bit-list (x)
  (check-type x (integer 0 *))
  (reverse
   (mapcar 'parse-integer
           (mapcar 'string (coerce (format t "~b" x) 'list)))))


(defun integer-to-bit-list1 (x)
  (check-type x (integer 0 *))
  (let (result)
    (loop (when (zerop x)
            (return (nreverse result)))
       (push (logand x 1) result)
       (setf x (ash x -1)))))

;; transpose matrix
;; (mapcar 'list '(11 12 13 14) '(21 22 23 24) '(31 32 33 34)
(let ((m '((11 12 13 14)
           (21 22 23 24)
           (31 32 33 34)))
      (*print-right-margin* 20))
  (pprint (apply 'mapcar 'list m)))


;; list interpolation
(let ((b 49))
  `(a ,b "foo"))

(let ((b (list 'a 'b 'c)))
  `(1 ,@b 2 3))

;; backquote typically not produce a completely fresh object
(flet ((foo (x) `(,x b c)))
  (let ((a (foo 1))
        (b (foo 2)))
    (list a b (eq a b) (eq (cdr a) (cdr b)))))

;; adding objects to the end of a list
;; Don't do that!
(let ((x (list 'a 'b 'c)))
  (setf x (append x (list 'd))))

(defun add-to-end-wrong (n)
  (let (x)
    (dotimes (i n)
      (setf x (append x (list (* i i)))))
    x))
  
(defun add-to-end-right (n)
  (let (x)
    (dotimes (i n)
      (push (* i i) x))
    (nreverse x)))

;; replace sub sequence
(let ((x (list 1 2 3 49 5)))
  (setf (subseq x 2 4) (list :three :four))
  x)


;; shared structure
(let ((tail (list :c :d :e)))
  (let ((*a* (append '(:a) tail))
        (*b* (append '(:b) tail)))
    (list :tail (tailp (cdr *b*) *a*)
          :diff (ldiff *b* *a*))))
