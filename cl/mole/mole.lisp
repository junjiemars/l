;;;; mole.lisp

(in-package #:mole)

(defparameter *mole-rules*
	'((:site "https://api.github.com/orgs/edicl/public_members")))


(let ((ss (drakma:http-request
					 (cadr (assoc :site *mole-rules* :test #'eq))
					 :want-stream t)))
	(setf (flexi-streams:flexi-stream-external-format ss) :utf-8)
	(yason:parse ss :object-as :plist))


