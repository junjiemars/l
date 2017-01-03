

(in-package :rocks.trunk.elastic.kit)

(setf drakma:*header-stream* *standard-output*)
(defparameter *default-url-base* (url-base :host "172.17.0.2" :port 9200))


(defmacro http-go (url &key
                         ((:method m) :get)
                         ((:parameters a) nil has-a)
                         ((:content c) nil has-c) 
                         ((:encode e) #'identity)
                         ((:decode d) #'h:parse-html))
  `(let ((s (w:http-request ,url
                            :method ,m
                            :want-stream t
                            :content (when ,has-c (funcall ,e ,c))
                            :parameters (when ,has-a ,a))))
     (setf (fs:flexi-stream-external-format s) :utf-8)
     (funcall ,d s)))

                 
