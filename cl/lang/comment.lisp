;;;; comment

;; (defparamter x 123)

#|
(defun foo () 23)
(defun bar () 24)
|#

;; the one form following #+(or) will be ignored
#+(or)
(defun foo () 45)
(defun foo () 46)

(sort *features* 'string< :key 'string)

;; first read symbol :foo and check whether :foo is in *features*.
;; if it is, it will simply continue reading the (+ 1 2) form.
;; if it is not, it will skip that form.
#+:foo (+ 1 2)

;; (or) => nil, so
#+(or) (defun foo () 23)
#+(or cmucl (and sbcl (not os-windows))) (+ 1 2)

;; non sbcl will => 3
#-:sbcl (+ 1 2)

