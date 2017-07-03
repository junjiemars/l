
(member '(a) '((a) (z)))

(member '(a) '((a) (z)) :test #'equal)


(defun noise (animal)
  (case animal
    (:dog :woof)
    (:cat :meow)
    (:pig :oink)))
