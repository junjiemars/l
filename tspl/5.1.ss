;;; 
;;; 5.1 Procedure Application
;;; 

(apply + 1 2 3 '(4 5))

(define first
  (lambda (ls)
    (apply (lambda (x . _) x) ls)))

(define rest
  (lambda (ls)
    (apply (lambda (_ . x) x) ls)))

(append '(1 2 3) '((a b) (c d)))

(apply append '(1 2 3) '((a b) (c d)))
