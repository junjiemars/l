

(in-package :rocks.trunk.elastic.kit)

(setf drakma:*header-stream* *standard-output*)

;; (import 'http-request :drakma)
;; (import 'flexi-external-formt :flexi-streams)

(defun lookup (url &key ((:package p) nil has-p) ((:parameters a) nil has-a)
                     ((:encode e) 'j:encode-json-alist-to-string)
                     ((:decode d) 'j:decode-json))
  (let ((s (w:http-request url
                           :method :get
                           :want-stream t
                           :content (when has-p (funcall e p))
                           :parameters (when has-a a))))
    (setf (fs:flexi-stream-external-format s) :utf-8)
    (funcall d s)))


(defun add (url d)
  (let* ((j (j:encode-json-alist-to-string d))
         (s (w:http-request url
                            :want-stream t
                            :content j)))
    (setf (fs:flexi-stream-external-format s) :utf-8)
    (j:decode-json s)))


