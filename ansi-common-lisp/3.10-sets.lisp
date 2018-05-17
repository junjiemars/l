;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

;; == member ==
;; Lists are a good way to represent small sets. Every element of a list is a
;; member of the set it represents:

(member 'b '(a b c))

(member "b" '("a" "b" "c"))

(member "b" '("a" "b" "c") :test #'string=)

(member "b" '((1 "a") (2 "b") (3 "c")) :key #'cadr :test #'string=)

(member-if #'oddp '(2 3 4))

(defun our-member-if (test list)
	(and (consp list)
			 (if (funcall test (car list))
					 list
					 (our-member-if test (cdr list)))))


;; == join ==

(adjoin 'a '(b c d))

(adjoin 'a '(a b c d))

;; == union ==

(union '(a b c) '(c b s))

;; == intersection ==

(intersection '(a b c) '(b b c))

;; == difference ==

(set-difference '(a b c d e) '(b e))
