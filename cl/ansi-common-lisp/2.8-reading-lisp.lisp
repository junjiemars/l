
(defun our-member (obj lst)
  (if (null lst)
      nil
      (if (eql obj (car lst))
          lst
          (our-member obj (cdr lst)))))
