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

(insertR '_ 'a '(x y z a b c))

(define multiinsertR
  (lambda (new old lst)
    (cond ((null? lst) '())
          ((eq? old (car lst))
           (cons old (cons new (multiinsertR new old (cdr lst)))))
          (else (cons (car lst)
                      (multiinsertR new old (cdr lst)))))))

(multiinsertR '_ 'a '(x y z a b c a e f))

(define insertL
  (lambda (new old lst)
    (cond ((null? lst) '())
          ((eq? old (car lst)) (cons new lst))
          (else (cons (car lst)
                      (insertL new old (cdr lst)))))))

(insertL '_ 'a '(x y z a b c a e f))

(define multiinsertL
  (lambda (new old lst)
    (cond ((null? lst) '())
          ((eq? old (car lst))
           (cons new (cons old (multiinsertL new old (cdr lst)))))
          (else (cons (car lst)
                      (multiinsertL new old (cdr lst)))))))

(multiinsertL '_ 'a '(x y z a b c a e f))
(multiinsertL '_ 'a '(a x y z a b c a e f))

(define subst1
  (lambda (new old lst)
    (cond ((null? lst) '())
          ((eq? old (car lst)) (cons new (cdr lst)))
          (else (cons (car lst)
                      (subst1 new old (cdr lst)))))))

(subst1 '_ 'a '(x y z a b c a e f))

(define multisubst1
  (lambda (new old lst)
    (cond ((null? lst) '())
          ((eq? old (car lst))
           (cons new (multisubst1 new old (cdr lst))))
          (else (cons (car lst)
                      (multisubst1 new old (cdr lst)))))))

(multisubst1 '_ 'a '(x y z a b c a e f))


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
                 (else (cons (car lst)
                             (rember* a (cdr lst))))))
          (else (cons (rember* a (car lst))
                      (rember* a (cdr lst)))))))

(rember* 'a '((x) a ((x y a)) (((x a y)))))


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

(insertR* '_ 'a '((x y) a ((z a)) (((x))) (((x a y)))))


(define occur*
  (lambda (a lst)
    (cond ((null? lst) 0)
          ((atom? (car lst))
           (cond ((eq? a (car lst))
                  (add1 (occur* a (cdr lst))))
                 (else (occur* a (cdr lst)))))
          (else (+ (occur* a (car lst))
                   (occur* a (cdr lst)))))))

(occur* 'a '((a) ((x a y)) (((x y a)))))


(define subst1*
  (lambda (new old lst)
    (cond ((null? lst) '())
          ((atom? (car lst))
           (cond ((eq? old (car lst))
                  (cons new (subst1* new old (cdr lst))))
                 (else (cons (car lst)
                             (subst1* new old (cdr lst))))))
          (else (cons (subst1* new old (car lst))
                      (subst1* new old (cdr lst)))))))

(subst1* '_ 'a '(a (a b) ((b a c)) (((b c a)))))

(define insertL*
  (lambda (new old lst)
    (cond ((null? lst) '())
          ((atom? (car lst))
           (cond ((eq? old (car lst))
                  (cons new (cons old
                                  (insertL* new old (cdr lst)))))
                 (else (cons (car lst)
                             (insertL* new old (cdr lst))))))
          (else (cons (insertL* new old (car lst))
                      (insertL* new old (cdr lst)))))))

(insertL* '_ 'a '(a (x a) ((x y a)) (((x a y)))))


(define member?
  (lambda (a lst)
    (cond ((null? lst) #f)
          ((atom? (car lst))
           (or (eq? a (car lst))
               (member? a (cdr lst))))
          (else (or (member? a (car lst))
                    (member? a (cdr lst)))))))

(member? 'a '(x ((y)) (((x y a)))))

(define leftmost
  (lambda (lst)
    (cond ((null? lst) '())
          ((atom? (car lst)) (car lst))
          (else (leftmost (car lst))))))

(leftmost '((((x))) ((y)) y))


(define eqlist?
  (lambda (lst1 lst2)
    (cond ((and (null? lst1) (null? lst2)) #t)
          ((or (null? lst1) (null? lst2)) #f)
          ((and (atom? (car lst1)) (atom? (car lst2)))
           (and (eqan? (car lst1) (car lst2))
                (eqlist? (cdr lst1) (cdr lst2))))
          ((or (atom? (car lst1)) (atom? (car lst2))) #f)
          (else (and (eqlist? (car lst1) (car lst2))
                     (eqlist? (cdr lst1) (cdr lst2)))))))

(eqlist? '(a ((a)) (((a)))) '(a ((a)) (((a)))))

(define equal1?
  (lambda (s1 s2)
    (cond ((and (atom? s1) (atom? s2))
           (eqan? s1 s2))
          ((or (atom? s1) (atom? s2)) #f)
          (else (eqlist? s1 s2)))))

(equal1? '(a ((a)) (((a)))) '(a ((a)) (((a)))))

(define eqlist1?
  (lambda (lst1 lst2)
    (cond ((and (null? lst1) (null? lst2)) #t)
          ((or (null? lst1) (null? lst2)) #f)
          (else (and (equal? (car lst1) (car lst2))
                     (eqlist1? (cdr lst1) (cdr lst2)))))))

(eqlist1? '(a ((a)) (((a)))) '(a ((a)) (((a)))))

(define numbered?
  (lambda (s)
    (cond ((atom? s) (number? s))
          (else (and (numbered? (car s))
                     (numbered? (car (cdr (cdr s)))))))))

(numbered? '(1 + 2))

(define value
  (lambda (s)
    (cond ((atom? s) s)
          ((eq? (cadr s) '+)
           (o+ (value (car s)) (value (caddr s))))
          ((eq? (cadr s) '*)
           (o* (value (car s)) (value (caddr s))))
          (else (o^ (value (cadr s))
                    (value (caddr s)))))))

(value '1)
(value '(1 + (2 + 3)))
(value '(2 * (3 + 1)))

(define 1st-sub-exp
  (lambda (s)
    (cadr s)))

(1st-sub-exp '(+ (* 2 3) 4))

(define 2nd-sub-exp
  (lambda (s)
    (caddr s)))

(2nd-sub-exp '(+ 2 (* 3 4)))
(2nd-sub-exp (2nd-sub-exp '(+ 2 (* 3 4 (+ 5 6)))))

(define operator
  (lambda (s)
    (car s)))

(operator '(+ 2 (* 3 4)))

(define value1
  (lambda (s)
    (cond ((atom? s) s)
          ((eq? (operator s) '+)
           (o+ (value1 (1st-sub-exp s))
               (value1 (2nd-sub-exp s))))
          ((eq? (operator s) '*)
           (o* (value1 (1st-sub-exp s))
               (value1 (2nd-sub-exp s))))
          (else (o^ (value1 (1st-sub-exp s))
                    (value1 (2nd-sub-exp s)))))))

(value1 '(+ 1 (* 2 3)))
(value1 '(+ 1 (* 2 3 (+ 4 5))))


(define sero?
  (lambda (n)
    (null? n)))

(define edd1
  (lambda (n)
    (cons '() n)))

(define zub1
  (lambda (n)
    (cdr n)))

(define oo+
  (lambda (n m)
    (cond ((sero? m) n)
          (else (edd1 (oo+ n (zub1 m)))))))

(edd1 (zub1 (oo+ '(() ()) '(() () ()))))

(define set?
  (lambda (lat)
    (cond ((null? lat) #t)
          ((member? (car lat) (cdr lat)) #f)
          (else (set? (cdr lat))))))

(set? '(a b c a))
(set? '(a b c))

(define makeset
  (lambda (lat)
    (cond ((null? lat) '())
          ((member? (car lat) (cdr lat))
           (makeset (cdr lat)))
          (else (cons (car lat)
                      (makeset (cdr lat)))))))

(makeset '(a b c d a e))

(define makeset1
  (lambda (lat)
    (cond ((null? lat) '())
          (else (cons (car lat)
                      (makeset1 (multirember (car lat)
                                            (cdr lat))))))))

(makeset1 '(a b c d a e))
(makeset1 '(a b c d a e 1 f 1))

(define subset?
  (lambda (set1 set2)
    (cond ((null? set1) #t)
          ((member? (car set1) set2)
           (subset? (cdr set1) set2))
          (else #f))))

(subset? '(a b) '(c d a b))

(define eqset?
  (lambda (set1 set2)
    (and (subset? set1 set2)
         (subset? set2 set1))))

(eqset? '(a b c) '(a b c))


(define interset?
  (lambda (set1 set2)
    (cond ((null? set1) #f)
          ((member? (car set1) set2) #t)
          (else (interset? (cdr set1) set2)))))

(interset? '(a) '(b c d a))
(interset? '(a) '())

(define interset
  (lambda (set1 set2)
    (cond ((null? set1) '())
          ((member? (car set1) set2)
           (cons (car set1)
                 (interset (cdr set1) set2)))
          (else (interset (cdr set1) set2)))))

(interset '(a d) '(b c a e d f))

(define union
  (lambda (set1 set2)
    (cond ((null? set1) set2)
          ((member? (car set1) set2)
           (union (cdr set1) set2))
          (else (cons (car set1)
                      (union (cdr set1) set2))))))

(union '(a b) '(c d e a))

;;; relative complement: S \ T
(define rcset
  (lambda (set1 set2)
    (cond ((null? set1) '())
          ((member? (car set1) set2)
           (rcset (cdr set1) set2))
          (else (cons (car set1)
                      (rcset (cdr set1) set2))))))

(rcset '(a b) '(b c d))
