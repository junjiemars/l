;;; 
;;; 
;;; 

(define calc-add
  (c-lambda (int int int)
            int
#<<c-lambda-end
int s;
s = ___arg1 + ___arg2 + ___arg3;
___return (s);
c-lambda-end
))

(println (calc-add 1 2 3))
