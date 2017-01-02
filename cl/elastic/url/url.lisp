
(in-package :rocks.trunk.elastic.kit)

(defmacro url-base (&key (host "localhost") (port nil))
  `(with-output-to-string (s)
     (if (or (null ,port) (= 80 ,port))
         (format s "http://~a" ,host)
         (format s "http://~a:~a" ,host ,port))))
         
