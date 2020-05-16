;;;; -*- Mode: lisp;

(defpackage #:cffi-user
  (:use #:cl #:cffi)
  (:export
   #:cffi-version
   #:getenv
   #:setenv
   #:gethostname
   #:gettimeofday))

(in-package #:cffi-user)

(defun cffi-version ()
  (asdf:component-version (asdf:find-system 'cffi)))

(defcfun "getenv" :string
  (name :string))

(defcfun "setenv" :int
  (name :string)
  (value :string)
  (overwrite :int))

(defcfun ("gethostname" %gethostname) :int
  (name :pointer)
  (namelen :int))

(defun gethostname ()
  (with-foreign-pointer-as-string ((name namelen) 255)
    (%gethostname name namelen)))

(defcstruct timeval
  (tv-sec :long)
  (tv-usec :long))

(define-foreign-type null-pointer-type ()
  ()
  (:actual-type :pointer)
  (:simple-parser null-pointer))

(defmethod translate-to-foreign (value (type null-pointer-type))
  (cond
    ((null value) (null-pointer))
    ((null-pointer-p value) value)
    (t (error "~A is not a null pointer." value))))

(defcfun ("gettimeofday" %gettimeofday) :int
  (tp :pointer)
  (tzp null-pointer))

(defun gettimeofday ()
  (with-foreign-object (tv 'timeval)
    (%gettimeofday tv nil)
    (with-foreign-slots ((tv-sec tv-usec) tv timeval)
      (values tv-sec tv-usec))))


