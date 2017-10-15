;;;; -*- lexical-binding:t -*-

(require 'ert)

(ert-deftest foo ()
  (should (= 1 (foo 0))))

(ert-deftest square ()
  (should (= 4 (square 2))))

(ert-deftest cube ()
  (should (= 27 (cube 3))))
