;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

;; A list of conses is called an assoc-list or alist. Such a list could represent
;; a set of translations.

(defun our-assoc (key alist)
	(and (consp alist)
			 (let ((pair (car alist)))
				 (if (eql key (car pair))
						 pair
						 (our-assoc key (cdr alist))))))


(our-assoc 'a '((b 11) (a 22) (c 33)))

(defun our-assoc1 (item alist &key key test)
	(and (consp alist)
			 (let* ((pair (if key
												(funcall key alist)
												(car alist)))
							(a= (if test
											(funcall test item (car pair))
											(eql item (car pair)))))
				 (if a=
						 (car alist)
						 (our-assoc1 item (cdr alist) :key key :test test)))))

(our-assoc1 "bb" '(("aa" 11) ("bb" 22) ("cc" 33))
						:test #'string=)

(our-assoc1 "bb" '(("xx" "aa" 11) ("xx" "bb" 22) ("xxx" "cc" 33))
						:key #'cdar :test #'string=)

;; assoc-if 
