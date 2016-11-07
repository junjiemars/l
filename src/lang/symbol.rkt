#lang racket

;; all #t
(eq? 'abc 'abc)
(eq? 'abc `abc)
(eq? 'abc (quote abc))

;; first #t others #f
(eq? 'abc (string->symbol "abc"))
(eq? 'abc (string->uninterned-symbol "abc"))
(eq? 'abc (string->unreadable-symbol "abc"))

;; first and third #t, second #f
(symbol-interned? 'abc)
(symbol-interned? (string->unreadable-symbol "abc"))
(symbol-unreadable? (string->unreadable-symbol "abc"))

(gensym)
(gensym "abc")