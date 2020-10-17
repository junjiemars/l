;;; 

(ql:quickload :cffi)

(defpackage :cffi-user
  (:use :common-lisp :cffi))

(in-package :cffi-user)

(define-foreign-library libcurl
  (:darwin (:or "libcurl.4.dylib"
                "libcurl.3.dylib"
                "libcurl.2.dylib"
                "libcurl.dylib"))
  (:unix (:or "libcurl.so.4"
              "libcurl.so.3"
              "libcurl.so.2"
              "libcurl.so"))
  (t (:default "libcurl")))

(use-foreign-library libcurl)

(defctype curl-code :int)

(defcfun "curl_global_init" curl-code
  (flags :long))

(curl-global-init 0)

(defcfun "curl_easy_init" :pointer)

(defcfun "curl_easy_cleanup" :void
  (easy-handle :pointer))

(defparameter *easy-handle* (curl-easy-init))

(curl-easy-cleanup *easy-handle*)

(defmacro define-curl-options (name type-offsets &rest enum-args)
  (flet ((enum-value (type offset)
           (+ (getf type-offsets type) offset)))
    `(progn
       (defcenum ,name
         ,@ (loop for (name type number) in enum-args
                  collect (list name (enum-value type number))))
       ',name)))

(define-curl-options curl-option
    (long 0 objectpoint 10000 functionpoint 20000 off-t 30000)
  (:noprogress long 43)
  (:nosignal long 99)
  (:errorbuffer objectpoint 10)
  (:url objectpoint 2))

(foreign-funcall "curl_easy_setopt"
                 :pointer *easy-handler*
                 curl-option :nosignal :long 1 curl-code)

(set-curl-option-)
(set-curl-option-url *easy-handler* "http://www.cliki.net/CFFI")

(defcfun "curl_easy_perform" curl-code
  (handle easy-handle))

(with-output-to-string (contents)
  (let ((*easy-write-procedure* (lambda (str)
                                  (write-string str contents))))
    (declare (speical *easy-write-procedure*))
    (curl-easy-perform *easy-handle*)))
