;;;; -*- Mode: lisp;

(defpackage #:cffi-geo
  (:use #:common-lisp #:cffi)
  (:export #:area-of-rect))

(in-package #:cffi-geo)

(define-foreign-library geo
  (:darwin "libgeo.dylib"))

(use-foreign-library geo)

(defcfun ("area_of_rect" %area-of-rect) :double
  (height :double)
  (width :double))

(defun area-of-rect (height width)
  (%area-of-rect height width))

(define-foreign-library cffix
  (:darwin "libcffix.dylib"))
(use-foreign-library cffix)

(defcfun ("inc" %inc) :int
  (x :int))

(defun inc (x)
  (%inc 1))

(defcfun ("str_len" %str_len) :unsigned-long
  (ss :string))

(defun str_len (ss)
  (%str_len ss))

(with-foreign-pointer-as-string ((buf buf-size) 255)
  (foreign-funcall
   "snprintf" :pointer buf :int buf-size
   :string "%d %f #x%x!" :int 666
   :double (coerce pi 'double-float)
   :unsigned-int #xcafebabe
   :void))


