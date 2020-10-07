;;;
;;; make clean test
;;;

(c-declare #<<c-declare-end

#include <stdio.h>
char *welcome (const char *name);

char *
welcome (const char *name) {
  static char ss [64];
  snprintf (ss, 63, "Welcome %s", name);
  return ss;
}


c-declare-end
)


(define welcome
  (c-lambda (char-string)
            char-string
            "welcome"))


(println (welcome "ZZZ"))
