

(in-package :rocks.trunk.elastic.kit)

(setf drakma:*header-stream* *standard-output*)

;; (import 'http-request :drakma)
;; (import 'flexi-external-formt :flexi-streams)

(defun lookup (url &key ((:package p) nil has-p)
                     ((:encode e) 'encode-json-alist-to-string)
                     ((:decode d) 'decode-json))
  (let ((s (http-request url
                         :method :get
                         :want-stream t
                         :content (when has-p (funcall e p)))))
    (setf (flexi-stream-external-format s) :utf-8)
    (funcall d s)))


(defun add (url d)
  (let* ((j (encode-json-alist-to-string d))
         (s (http-request url
                          :want-stream t
                          :content j)))
    (setf (flexi-stream-external-format s) :utf-8)
    (decode-json s)))


