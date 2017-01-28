;;;; swap

(defmacro swap (a b)
  (let ((temp (gensym)))
    `(let ((,temp ,a))
       (setf ,a ,b
             ,b ,temp)
       (values ,a ,b))))

;; print will be call three times
(let ((x (list 23 42)))
  (swap (nth (print 0) x) (second x))
  x)

;; print will be call once
(let ((x (list 23 42)))
  (rotatef (nth (print 0) x) (second x))
  x)


(let ((a1 (make-array 4 :initial-contents (list 1 2 3 4)))
      (l1 (list 10 20 30))
      (i1 42))
  (print (list a1 l1 i1))
  (rotatef (aref a1 0) (elt l1 2)
           i1 (second l1))
  (list a1 l1 i1))
  
(let ((a1 (make-array 4 :initial-contents (list 1 2 3 4)))
      (l1 (list 10 20 30))
      (i1 42))
  (print (list a1 l1 i1))
  (shiftf (aref a1 0) (elt l1 2)
           i1 (second l1))
  (list a1 l1 i1))
