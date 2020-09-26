;;; 

(c-declare "extern char *getenv (const char*);")

(define getenv
  (c-lambda (char-string)
            char-string
            "getenv"))

(println (getenv "ZZZ"))
