(define rember
  (lambda (a lst)
    (cond ((null? lst) '())
          ((eq? a (car lst)) (cdr lst))
          (else (cons (car lst)
                      (rember a (cdr lst)))))))

(rember 'a '())
(rember 'a '(x y z a b c))

(define multirember
  (lambda (a lst)
    (cond ((null? lst) '())
          ((eq? a (car lst)) (multirember a (cdr lst)))
          (else (cons (car lst)
                      (multirember a (cdr lst)))))))

(multirember 'a '(x y z a b c a e))


(define insertR
  (lambda (new old lst)
    (cond ((null? lst) '())
          ((eq? old (car lst)) (cons old (cons new (cdr lst))))
          (else (cons (car lst)
                      (insertR new old (cdr lst)))))))

(insertR 'X 'a '(x y z a b c))

(define multiinsertR
  (lambda (new old lst)
    (cond ((null? lst) '())
          ((eq? old (car lst))
           (cons old (cons new (multiinsertR new old (cdr lst)))))
          (else (cons (car lst)
                      (multiinsertR new old (cdr lst)))))))

(multiinsertR 'X 'a '(x y z a b c a e f))

(define insertL
  (lambda (new old lst)
    (cond ((null? lst) '())
          ((eq? old (car lst)) (cons new lst))
          (else (cons (car lst)
                      (insertL new old (cdr lst)))))))

(insertL 'X 'a '(x y z a b c a e f))

(define multiinsertL
  (lambda (new old lst)
    (cond ((null? lst) '())
          ((eq? old (car lst))
           (cons new (cons old (multiinsertL new old (cdr lst)))))
          (else (cons (car lst)
                      (multiinsertL new old (cdr lst)))))))

(multiinsertL 'X 'a '(x y z a b c a e f))
(multiinsertL 'X 'a '(a x y z a b c a e f))

(define subst1
  (lambda (new old lst)
    (cond ((null? lst) '())
          ((eq? old (car lst)) (cons new (cdr lst)))
          (else (cons (car lst)
                      (subst1 new old (cdr lst)))))))

(subst1 'X 'a '(x y z a b c a e f))

(define multisubst1
  (lambda (new old lst)
    (cond ((null? lst) '())
          ((eq? old (car lst))
           (cons new (multisubst1 new old (cdr lst))))
          (else (cons (car lst)
                      (multisubst1 new old (cdr lst)))))))

(multisubst1 'X 'a '(x y z a b c a e f))


(and (atom? '()) (null? '()) (list? '()))

(define o+
  (lambda (n m)
    (cond ((zero? m) n)
          (else (add1 (o+ n (sub1 m)))))))

(o+ 2 3)

(define o-
  (lambda (n m)
    (cond ((zero? m) n)
          (else (sub1 (o- n (sub1 m)))))))

(o- 5 3)

(define addtup
  (lambda (tup)
    (cond ((null? tup) 0)
          (else (o+ (car tup) (addtup (cdr tup)))))))

(addtup '(1 2 3))

(define o*
  (lambda (n m)
    (cond ((zero? m) 0)
          (else (o+ n (o* n (sub1 m)))))))

(o* 2 3)


(define tup+
  (lambda (tup1 tup2)
    (cond ((null? tup1) tup2)
          ((null? tup2) tup1)
          (else (cons (o+ (car tup1) (car tup2))
                      (tup+ (cdr tup1) (cdr tup2)))))))

(tup+ '(1 2 3 4) '(4 3 2 1))
(tup+ '(1 2) '(4 3 2))
(tup+ '(1 2 3) '(4 3))

(define o>
  (lambda (n m)
    (cond ((zero? n) #f)
          ((zero? m) #t)
          (else (o> (sub1 n) (sub1 m))))))

(o> 2 3)
(o> 3 2)
(o> 3 3)

(define o<
  (lambda (n m)
    (cond ((zero? m) #f)
          ((zero? n) #t)
          (else (o< (sub1 n) (sub1 m))))))

(o< 2 3)
(o< 3 2)
(o< 3 3)

(define o=
  (lambda (n m)
    (cond ((zero? m) (zero? n))
          ((zero? n) #f)
          (else (o= (sub1 n) (sub1 m))))))

(o= 2 2)
(o= 2 3)
(o= 3 2)

(define o=1
  (lambda (n m)
    (cond ((o> n m) #f)
          ((o< n m) #f)
          (else #t))))

(o=1 2 2)
(o=1 2 3)
(o=1 3 2)

(define o^
  (lambda (n m)
    (cond ((zero? m) 1)
          (else (o* n (o^ n (sub1 m)))))))

(o^ 2 3)

(define o/
  (lambda (n m)
    (cond ((< n m) 0)
          (else (add1 (o/ (- n m) m))))))

(o/ 5 2)

(define length1
  (lambda (lst)
    (cond ((null? lst) 0)
          (else (add1 (length1 (cdr lst)))))))

(length1 '(a b c))

(define pick
  (lambda (n lst)
    (cond ((zero? (sub1 n)) (car lst))
          (else (pick (sub1 n) (cdr lst))))))

(pick 2 '(a b c))
;; (pick 0 '(a b c))


(define rempick
  (lambda (n lst)
    (cond ((zero? (sub1 n)) (cdr lst))
          (else (cons (car lst)
                      (rempick (sub1 n)
                               (cdr lst)))))))

(rempick 2 '(a b c))

(define no-nums
  (lambda (lst)
    (cond ((null? lst) '())
          ((number? (car lst)) (no-nums (cdr lst)))
          (else (cons (car lst)
                      (no-nums (cdr lst)))))))

(no-nums '(a 1 b c 2))

(define all-nums
  (lambda (lst)
    (cond ((null? lst) '())
          ((number? (car lst)) (cons (car lst)
                                     (all-nums (cdr lst))))
          (else (all-nums (cdr lst))))))

(all-nums '(a 1 b c 2))

(define eqan?
  (lambda (a1 a2)
    (cond ((and (number? a1) (number? a2))
           (= a1 a2))
          ((or (number? a1) (number? a2))
           #f)
          (else (eq? a1 a2)))))

(eqan? 'a 'a)
(eqan? 1 1)
(eqan? 'a 1)

(define occur
  (lambda (a lst)
    (cond ((null? lst) 0)
          ((eq? a (car lst)) (add1 (occur a (cdr lst))))
          (else (occur a (cdr lst))))))

(occur 'a '(x y z a b c a))

(define one?
  (lambda (n)
    (cond ((zero? n) #f)
          (else (zero? (sub1 n))))))

(one? 1)

(define rempick1
  (lambda (n lst)
    (cond ((one? n) (cdr lst))
          (else (cons (car lst)
                      (rempick1 (sub1 n)
                               (cdr lst)))))))
(rempick1 2 '(a b c))


(define rember*
  (lambda (a lst)
    (cond ((null? lst) '())
          ((atom? (car lst))
           (cond ((eq? a (car lst))
                  (rember* a (cdr lst)))
                 (else (cons (car list)
                             (rember* a (cdr lst))))))
          (else (cons (car lst)
                      (rember* a (cdr lst)))))))

(rember* 'a '((c) a ((t)) a (a (h)) a))


(define insertR*
  (lambda (new old lst)
    (cond ((null? lst) '())
          ((atom? (car lst))
           (cond ((eq? old (car lst))
                  (cons old
                        (cons new
                              (insertR* new old (cdr lst)))))
                 (else (cons (car lst)
                             (insertR* new old (cdr lst))))))
          (else (cons (insertR* new old (car lst))
                      (insertR* new old (cdr lst)))))))

(insertR* 'X 'a '((x y) a ((z a)) (((x))) (((x a y)))))
