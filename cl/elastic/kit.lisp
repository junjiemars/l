

(in-package :rocks.trunk.elastic.kit)

(setf drakma:*header-stream* *standard-output*)

(import 'http-request :drakma)
(import 'flexi-external-formt :flexi-streams)

(defun lookup (url &key (as :plist) )
  (let ((s (http-request url :want-stream t)))
    (setf (flexi-stream-external-format s) :utf-8)
    (yason:parse s :object-as as)))

  
    

