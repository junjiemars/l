;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-


;; my tail-recursive version

(defun run-length-compress (lst)
	(labels ((compress (elt n)
						 (if (> n 1) (list n elt) elt))
					 (iter (elt n lst aa)
						 (if (null lst)
								 (reverse (cons (compress elt n) aa))
								 (let ((next (car lst)))
									 (if (eql next elt)
											 (iter elt (1+ n) (cdr lst) aa)
											 (iter next 1 (cdr lst) (cons (compress elt n) aa)))))))
		(iter (car lst) 1 (cdr lst) nil)))


(defun run-length-uncompress (lst)
	(labels ((uncompress (n elt aa)
						 (if (zerop n)
								 (reverse aa)
								 (uncompress (1- n) elt (cons elt aa))))
					 (iter (lst rr)
						 (if (null lst)
								 rr
								 (let ((elt (car lst)))
									 (if (consp elt)
											 (let ((n (car elt))
														 (e (cadr elt)))
												 (iter (cdr lst) (append rr (uncompress n e nil))))
											 (iter (cdr lst) (append rr (list elt))))))))
		(iter lst nil)))


;; (defun run-length-uncompress (lst)
;; 	(labels ((uncompress (n elt acc)
;; 						 (if (zerop n)
;; 								 (reverse acc)
;; 								 (uncompress (1- n) elt (cons elt acc))))
;; 					 (iter (lst rr)
;; 						 (if (null lst)
;; 								 rr
;; 								 (let ((elt (car lst)))
;; 									 (if (consp elt)
;; 											 (let ((n (car elt))
;; 														 (e (cadr elt)))
;; 												 (iter (cdr lst)
;; 															 (append rr (uncompress n e nil))))
;; 											 (iter (cdr lst) (append rr (list elt))))))))
;; 		(iter lst nil)))
