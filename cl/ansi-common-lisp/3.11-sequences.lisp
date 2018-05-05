;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

;; Another way to think of a list is as a series of objects in a particular
;; order. In Common Lisp, sequences include both lists and vectors.


(eql (length '(1 2 3 4))
		 (length #4(a b c d)))


(subseq '(a b c d) 1 2)
(subseq '(a b c d) 1)

(reverse '(a b c))


;; A palindrome is a sequence that reads the same in either direction.
;; For example: '(a b b a)

(defun mirror? (s)
	(let ((len (length s)))
		(and (evenp len)
				 (let ((mid (/ len 2)))
					 (equal (subseq s 0 mid)
									(reverse (subseq s mid)))))))

(mirror? '(a b b a))
(mirror? '(a b c b a))


;; sort is destructive
;; for efficiency reasons, sort is allowed to modity the sequence given to it
;; as an argument.

(sort '(0 2 1 3 8) #'<)
(sort '(0 2 1 3 8) #'>)

(defun nthmost (n lst)
	(nth (1- n) (sort (copy-list lst) #'>)))


(every #'oddp '(1 3 5))

(some #'evenp '(1 2 3))

(every #'> '(1 3 5) '(0 2 4))
