
(in-package :rocks.trunk.elastic.kit)



(defmacro info (&optional (url *default-url-base*))
  `(http-go ,url :decode #'j:decode-json))


(defmacro update (url &optional (datum nil))
  `(http-go ,url
            :method :post
            :content ,datum
            :decode #'j:decode-json))
  
             
(defmacro make-url (base &key (index nil) (type nil) (id nil))
  `(with-output-to-string (s)
     (format s "~a" ,base)
     (dolist (x (list ,index ,type ,id))
       (when x (format s "/~a" x)))))


(defun make-go-json (&rest args)
  (with-output-to-string (s)
     (j:with-object (s)
       (dolist (x args)
         (j:encode-object-member (first x) (second x) s)))))
                 

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

