

(in-package :rocks.trunk.elastic.kit)

(setf drakma:*header-stream* *standard-output*)



(defmacro lookup (url &key
                        ((:method m) :get)
                        ((:parameters a) nil has-a)
                        ((:content c) nil has-c) 
                        ((:encode e) #'j:encode-json-to-string)
                        ((:decode d) #'j:decode-json))
  `(let ((s (w:http-request ,url
                            :method ,m
                            :want-stream t
                            :content (when ,has-c (funcall ,e ,c))
                            :parameters (when ,has-a ,a))))
     (setf (fs:flexi-stream-external-format s) :utf-8)
     (funcall ,d s)))


(defmacro make-url-base (&key (host "172.17.0.2") (port 9200))
  `(with-output-to-string (s)
     (format s "http://~a:~a" ,host ,port)))


(defmacro make-url (base &key (index nil) (type nil) (id nil))
  `(with-output-to-string (s)
     (format s "~a" ,base)
     (dolist (x (list ,index ,type ,id))
       (when x (format s "/~a" x)))))
                 

(defmacro make-match (out &optional (field nil) (value nil))
  `(let* ((all-p (and (null ,field) (null ,value)))
          (m (if all-p 'match_all 'match)))
     (j:with-object (,out)
       (j:as-object-member (m ,out)
         (j:with-object (,out)
           (if (not all-p)
               (j:encode-object-member ,field ,value ,out)))))))
             
(defmacro make-query (&optional (query 'make-match) &rest args)
  `(with-output-to-string (s)
     (j:with-object (s)
       (j:as-object-member ('query s)
         (,query s ,@args)))))


                 
