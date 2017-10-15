;;;; -*- lexical-binding:t -*-


(require 'ert)

(ert-deftest list+ ()
  (should (equal '(11 12 13) (list+ '(1 2 3) 10))))

(ert-deftest counter-instance ()
  (should (equal '(1 2 1)
                 (counter-instance 'a '((a b c) (d a r p a) (d a r))))))

(ert-deftest counter-instance1 ()
  (should (equal '(1 2 1)
                 (counter-instance1 'a '((a b c) (d a r p a) (d a r)))))
  (should (fboundp #'iter)))

