;;;;
;; Assert
;;;;

#|
assertions are well-known technique in software development.
at runtime, if test-form of assertion returns a true value, 
the program will simply continue; if it returns nil, the program will
signal an error.
|#

(defun dot-product (x y)
  (assert (and (typep x '(or list vector))
               (typep y '(or list vector))
               (= (length x) (length y)))
          (x y)
          "~S and ~S should have been sequence of the same length."
          x y)
  (reduce '+ (map 'list '* x y)))
  
  
;; disabling assertions in Production code

(defmacro assert* (test-form &rest args)
  (declare (ignorable test-form args))
  #-:release
  `(assert ,test-form ,@args))

(defun sqr (n)
  (assert* (typep n 'fixnum)
           (n)
           "~S should be a fixnum." n)
  (* n n))

(pushnew :release *features*)
