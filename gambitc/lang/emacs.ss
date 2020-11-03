(define remove-if
  (lambda (fn seq)
    ()))

(define (geiser:module-completions prefix . rest)

  (define (interesting? sym)
    (and (string-prefix? prefix (symbol->string sym))
         (procedure? (##global-var-ref (##make-global-var sym)))))

  (define (environment-symbols)
    (let ((symtab (##symbol-table)))
      (let loop1 ((i (- (vector-length symtab) 1))
                  (result '()))
        (if (> i 0)
            (let loop2 ((sym (vector-ref symtab i))
                        (result result))
              (if (symbol? sym)
                  (loop2 (##vector-ref sym 2)
                         (if (interesting? sym)
                             (cons (symbol->string sym) result)
                             result))
                  (loop1 (- i 1)
                         result)))
            result))))

  (sort-list (environment-symbols) string-ci<?))

(define (geiser:completions prefix . rest)
  rest)

;; string-prefix function
(define (string-prefix? pref str)
  (let* ((str (if (string? str) str (symbol->string str)))
         (str-len (string-length str))
         (pref (if (string? pref) pref (symbol->string pref)))
         (pref-len (string-length pref)))
    (and (string? pref)
         (string? str)
         (<= pref-len str-len)
         (string=? (substring str 0 pref-len) pref))))

;; filter
(define (filter f lst)
  (fold-right (lambda (e r) (if (f e) (cons e r) r)) '() lst))

;; sorting algorithms
(define (sort-list l <?)

  (define (mergesort l)

    (define (merge l1 l2)
      (cond ((null? l1) l2)
            ((null? l2) l1)
            (else
             (let ((e1 (car l1)) (e2 (car l2)))
               (if (<? e1 e2)
                   (cons e1 (merge (cdr l1) l2))
                   (cons e2 (merge l1 (cdr l2))))))))

    (define (split l)
      (if (or (null? l) (null? (cdr l)))
          l
          (cons (car l) (split (cddr l)))))

    (if (or (null? l) (null? (cdr l)))
	l
	(let* ((l1 (mergesort (split l)))
               (l2 (mergesort (split (cdr l)))))
          (merge l1 l2))))

  (mergesort l))
