

(in-package :rocks.trunk.elastic.kit)

(setf drakma:*header-stream* *standard-output*)

;; (import 'http-request :drakma)
;; (import 'flexi-external-formt :flexi-streams)

(defmacro lookup (url &key
                        ((:method m) :get)
                        ((:parameters a) nil has-a)
                        ((:content c) nil has-c) 
                        ((:encode e) #'j:encode-json)
                        ((:decode d) #'j:decode-json))
  `(let ((s (w:http-request ,url
                            :method ,m
                            :want-stream t
                            :content (when ,has-c (funcall ,e ,c))
                            :parameters (when ,has-a ,a))))
     (setf (fs:flexi-stream-external-format s) :utf-8)
     (funcall ,d s)))


(defmacro make-url (base &key (index nil) (type nil) (id nil))
  `(with-output-to-string (s)
     (format s "~a" ,base)
     (dolist (x (list ,index ,type ,id))
       (when x (format s "/~a" x)))))
                 
