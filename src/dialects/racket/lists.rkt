#lang racket

;; literal
'(1 2 3)
'[1 2 3]
'{1 2 3}

;; constructor
(list 1 2 3)

;; predicate
(list? '(1 2 3))
(empty? '())

;; cons
(cons 1 '(2 3))

;; head
(car '(a b c))
(first '(a b c))

;; tail
(cdr '(a b c))
(rest '(a b c))

;; length
(length '(a b c))

;; equality test
(equal? '(a b c) '(a b c))

;; nth element
(list-ref '(a b c) 1)

;; element index
(require srfi/1)
(let ([y '(5 6 7 8)])
  (list-index (λ (x) (= x 7)) y))

;; concatenate
(append '(a b c) '(1 2 3))

;; take
(take '(a b c) 2)

;; drop
(drop '(a b c) 2)

;; last element
(last '(a b c))

;; all but last element
(let ([butlast '(a b c)])
  (take butlast (sub1 (length butlast))))

;; reverse
(reverse '(a b c))

;; sort
(sort '(3 2 4 1) <)

;; dedupe
(remove-duplicates '(a b b c))

;; membership
(member 2 '(1 2 3))

;; map
(map (λ (x) (* x x)) '(1 2 3))

;; filter
(filter (λ (x) (> x 3)) (range 10))

;; reduce
(foldl (λ (x v) (+ x v)) 10 (range 3))

;; right fold
(foldr - 2 '(1 2 3 4))

;; iterate
(for ([x (range 3)])
  (printf "~a~n" (* x x)))

;; universal predicate
(for/and ([i (range 4)])
  (even? i))

;; list comprehension
(for*/list ([file "ABC"]
            [rank (in-range 1 3)])
  (format "~a~a" file rank))

;; shuffle
(shuffle '(1 2 3 4))

;; set head
(let ([x (mcons 1 2)])
  (set-mcar! x 10)
  x)

;; set tail
(let ([x (mcons 1 2)])
  (set-mcdr! x 10)
  x)

;; flatten
(flatten '(1 2 (a (b))))

;; accociative array lookup
(assoc 3 '((1 2) (3 4)))

;; pair litteral
'(1 . 2)

;; cons cell test
(cons? '(a . b))
(pair? '(a . b))

