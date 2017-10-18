;;;; -*- lexical-binding:t -*-


(require 'cl)
(defmacro labels (bindings &rest body)
  (declare (indent 1) (debug cl-flet))
  (let ((binds ()) (newenv macroexpand-all-environment))
    (dolist (binding bindings)
      (let ((var (make-symbol (format "--tro-%s--" (car binding)))))
        (push (list var `(cl-function (lambda . ,(cdr binding)))) binds)
        (push (cons (car binding)
                    (lambda (&rest args)
                      (if (eq (car args) cl--labels-magic)
                          (list cl--labels-magic var)
                        (cl-list* 'funcall var args))))
              newenv)))
    (macroexpand-all `(letrec ,(nreverse binds) ,@body)
                     ;; Don't override lexical-let's macro-expander.
                     (if (assq 'function newenv) newenv
                       (cons (cons 'function #'cl--labels-convert) newenv)))))

(defmacro labels-1 (bindings &rest body)
  (declare (indent 1) (debug cl-flet))
  (let ((binds ()) (newenv macroexpand-all-environment))
    (dolist (binding bindings)
      (let ((var (make-symbol (format "--tro-%s--" (car binding)))))
        (push (list var `(function (lambda . ,(cdr binding)))) binds)
        (push (cons (car binding)
                    (lambda (&rest args)
                      (if (eq (car args) cl--labels-magic)
                          (list cl--labels-magic var)
                        (cl-list* 'funcall var args))))
              newenv)))
    (cl-values  binds newenv 123
                (macroexpand-all `(letrec ,(nreverse binds) ,@body)
                                 ;; Don't override lexical-let's macro-expander.
                                 (if (assq 'function newenv) newenv
                                   (cons (cons 'function #'cl--labels-convert) newenv))))))
