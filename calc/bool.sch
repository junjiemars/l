(define TRUE (lambda (x y) x))

(define FALSE (lambda (x y) y))

(define NOT (lambda (x) (x FALSE TRUE)))

(NOT TRUE)
(NOT FALSE)

(define AND (lambda (x y) (x y FALSE)))

(AND TRUE TRUE)
(AND FALSE TRUE)
(AND TRUE FALSE)
(AND FALSE FALSE)

(define OR (lambda (x y) (x TRUE FALSE)))

(OR TRUE TRUE)
(OR FALSE TRUE)
(OR TRUE FALSE)
(OR FALSE FALSE)
