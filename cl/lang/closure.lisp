;;;; closure

;; in C, declare a function-local variable as `static'
;;  
#|
size_t counter() {
  /* the c will be intialized the first time it is called */
  static size_t c = 0;
  return c++;
}
|#


(let ((acc 0))
  (defun counter (&optional reset)
    "when the function definition is loaded"
    (if reset
        (setf acc 0)
        (incf acc))))





