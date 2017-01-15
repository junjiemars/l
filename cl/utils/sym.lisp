
(in-package #:rocks.trunk.utils)

(defun package-internal-symbols (package)
  (let ((seq nil))
    (do-symbols (s package)
      (when (eq (second
                 (multiple-value-list
                  (find-symbol (symbol-name s) package)))
                :internal)
        (push s seq)))
    seq))
