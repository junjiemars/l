(defpackage :cffi-user
  (:use #:common-lisp :cffi))

(in-package :cffi-user)

;; load `libcurl' into lisp
(define-foreign-library libcurl
  (:darwin (:or "libcurl.4.dylib" "libcurl.dylib"))
  (:unix (:or "libcurl.so.4" "libcurl.so"))
  (t (:default "libcurl")))
(use-foreign-library libcurl)

(defctype curl-code :int)

(defcenum curl-version
  (:curl-version-first 0)
  (:curl-version-second 1)
  (:curl-version-third 2)
  (:curl-version-fourth 3)
  (:curl-version-fifth 4)
  (:curl-version-last 5))

(defconstant +curl-version-now+ 4)

(defctype size :unsigned-int)

;; cffi converted `curl_global_init' to lisp-friendly name
;; `curl-global-init'
(defcfun "curl_global_init" curl-code
  (flags :long))


;; (defcstruct curl-version-info-data
;;   (age :curl-version)
;;   :documentation  "age of the returned struct"
;;   ;; const char *version;      /* LIBCURL_VERSION */
;;   ;; unsigned int version_num; /* LIBCURL_VERSION_NUM */
;;   ;; const char *host;         /* OS/host/cpu/machine when configured */
;;   ;; int features;             /* bitmask, see defines below */
;;   ;; const char *ssl_version;  /* human readable string */
;;   ;; long ssl_version_num;     /* not used anymore, always 0 */
;;   ;; const char *libz_version; /* human readable string */
;;   ;; /* protocols is terminated by an entry with a NULL protoname */
;;   ;; const char * const *protocols;

;;   ;; /* The fields below this were added in CURLVERSION_SECOND */
;;   ;; const char *ares;
;;   ;; int ares_num;

;;   ;; /* This field was added in CURLVERSION_THIRD */
;;   ;; const char *libidn;

;;   ;; /* These field were added in CURLVERSION_FOURTH */

;;   ;; /* Same as '_libiconv_version' if built with HAVE_ICONV */
;;   ;; int iconv_ver_num;

;;   ;; const char *libssh_version; /* human readable string */

;;   ;; /* These fields were added in CURLVERSION_FIFTH */

;;   ;; unsigned int brotli_ver_num; /* Numeric Brotli version
;;   ;; (MAJOR << 24) | (MINOR << 12) | PATCH */
;;   ;; const char *brotli_version; /* human readable string. */

;;   )

(defcfun "curl_version_info" :pointer
  (curl-version :int))

(defcfun "curl_easy_init" :pointer)

(defcfun "curl_easy_cleanup" :void
  (easy-handle :pointer))

(defctype easy-handle :pointer)

(defmacro curl-easy-setopt (easy-handle enumerated-name
                            value-type new-value)
  "Call `curl_easy_setopt' on EASY-HANDLE, using ENUMERATED-NAME
     as the OPTION.  VALUE-TYPE is the CFFI foreign type of the third
     argument, and NEW-VALUE is the Lisp data to be translated to the
     third argument.  VALUE-TYPE is not evaluated."
  `(foreign-funcall "curl_easy_setopt" easy-handle ,easy-handle
                    curl-option ,enumerated-name
                    ,value-type ,new-value curl-code))


(defun curry-curl-option-setter (function-name option-keyword)
  "Wrap the function named by FUNCTION-NAME with a version that
     curries the second argument as OPTION-KEYWORD.

     This function is intended for use in DEFINE-CURL-OPTION-SETTER."
  (setf (symbol-function function-name)
        (let ((c-function (symbol-function function-name)))
          (lambda (easy-handle new-value)
            (funcall c-function easy-handle option-keyword
                     new-value)))))

(defmacro define-curl-option-setter (name option-type
                                     option-value foreign-type)
  "Define (with DEFCFUN) a function NAME that calls
     curl_easy_setopt.  OPTION-TYPE and OPTION-VALUE are the CFFI
     foreign type and value to be passed as the second argument to
     easy_setopt, and FOREIGN-TYPE is the CFFI foreign type to be used
     for the resultant function's third argument.

     This macro is intended for use in DEFINE-CURL-OPTIONS."
  `(progn
     (defcfun ("curl_easy_setopt" ,name) curl-code
       (easy-handle easy-handle)
       (option ,option-type)
       (new-value ,foreign-type))
     (curry-curl-option-setter ',name ',option-value)))


(defmacro define-curl-options (type-name type-offsets &rest enum-args)
  "As with CFFI:DEFCENUM, except each of ENUM-ARGS is as follows:

         (NAME TYPE NUMBER)

     Where the arguments are as they are with the CINIT macro defined
     in curl.h, except NAME is a keyword.

     TYPE-OFFSETS is a plist of TYPEs to their integer offsets, as
     defined by the CURLOPTTYPE_LONG et al constants in curl.h.

     Also, define functions for each option named
     set-`TYPE-NAME'-`OPTION-NAME', where OPTION-NAME is the NAME from
     the above destructuring."
  (flet ((enumerated-value (type offset)
           (+ (getf type-offsets type) offset))
         ;; map PROCEDURE, destructuring each of ENUM-ARGS
         (map-enum-args (procedure)
           (mapcar (lambda (arg) (apply procedure arg)) enum-args))
         ;; build a name like SET-CURL-OPTION-NOSIGNAL
         (make-setter-name (option-name)
           (intern (concatenate
                    'string "SET-" (symbol-name type-name)
                    "-" (symbol-name option-name)))))
    `(progn
       (defcenum ,type-name
         ,@(map-enum-args
            (lambda (name type number)
              (list name (enumerated-value type number)))))
       ,@(map-enum-args
          (lambda (name type number)
            (declare (ignore number))
            `(define-curl-option-setter ,(make-setter-name name)
                 ,type-name ,name ,(ecase type
                                     (long :long)
                                     (objectpoint :pointer)
                                     (functionpoint :pointer)
                                     (off-t :long)))))
       ',type-name)))


(defcallback easy-write size ((ptr :pointer) (size size)
                              (nmemb size) (stream :pointer))
  (let ((data-size (* size nmemb)))
    (handler-case
        ;; We use the dynamically-bound *easy-write-procedure* to
        ;; call a closure with useful lexical context.
        (progn (funcall (symbol-value '*easy-write-procedure*)
                        (foreign-string-to-lisp ptr :count data-size))
               data-size)         ;indicates success
      ;; The WRITEFUNCTION should return something other than the
      ;; #bytes available to signal an error.
      (error () (if (zerop data-size) 1 0)))))
