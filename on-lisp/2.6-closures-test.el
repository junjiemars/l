;;;; -*- lexical-binding:t -*-

;; emacs -batch -l 2.6-closures.el -l 2.6-closures-test.el -f ert-run-tests-batch-and-exit

(require 'ert)

(ert-deftest list+ ()
  (should (equal '(11 12 13) (list+ '(1 2 3) 10))))

(ert-deftest new/reset-id ()
  (should (= 1 (new-id)))
  (should (= 2 (new-id)))
  (should (= 0 (reset-id)))
  (should (= 1 (new-id))))

(ert-deftest make-adder ()
  (let ((add2 (make-adder 2))
        (add10 (make-adder 10)))
    (should (= 5 (funcall add2 3)))
    (should (= 15 (funcall add10 5)))))

(ert-deftest make-adderb ()
  (let ((add2 (make-adderb 2)))
    (should (= 5 (funcall add2 3)))
    (funcall add2 10 t)
    (should (= 13 (funcall add2 3)))))

(ert-deftest make-dbms ()
  (let ((cities (make-dbms nil)))
    (should (equal '((boston . us)) (funcall (cadr cities) 'boston 'us)))
    (should (equal '((london . england) (boston . us))
                   (funcall (cadr cities) 'london 'england)))
    (should (equal 'us (funcall (car cities) 'boston)))
    (should (equal 'london (funcall (car (cddr cities)) 'london)))
    (should (equal nil (funcall (car cities) 'london)))))

