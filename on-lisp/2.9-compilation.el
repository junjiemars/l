;;;; -*- lexical-binding:t -*-

(defmacro compiled-function-p (fn)
  `(if (symbolp ,fn)
       (byte-code-function-p (symbol-function ,fn))
     (byte-code-function-p ,fn)))

(defun foo (x)
  (1+ x))

(defvar *bar* (byte-compile #'(lambda (x) (1+ x))))

(defun make-adder (n)
  #'(lambda (x) (+ x n)))

(defsubst 50th (lst)
  (nth 49 lst))

(defun 50th+ (lst)
  (1+ (50th lst)))

