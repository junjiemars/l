;;;; -*- lexical-binding:t -*-

(defun our-find-if (fn lst)
  (if (funcall fn (car lst))
      (car lst)
    (our-find-if fn (cdr lst))))


(defun our-length (lst)
  "Elisp has no tail-recursion optimization"
  (cl-labels ((iter (lst acc)
                    (if (null lst)
                        acc
                      (iter (cdr lst) (1+ acc)))))
    (iter lst 0)))

;; transform iteration to loop
;; "https://github.com/Wilfred/tco.el"

(defun our-length1 (lst)
  (let ((acc 0)
        (seq lst))
    (while (car seq)
      (setq acc (1+ acc)
            seq (cdr seq)))
    acc))
