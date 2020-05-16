;;;; -*- Mode: lisp;

(defpackage #:cffi-user
  (:use #:cl #:cffi))

(in-package #:cffi-user)


(define-foreign-library liblept
  (:darwin (:or "liblept.5.dylib" "liblept.dylib"))
  (t (:default "liblept")))

