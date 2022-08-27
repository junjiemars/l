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
