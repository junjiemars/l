#lang racket

(eq? 'abc 'abc)
(eq? 'abc (string->symbol "abc"))
(eq? 'abc (string->uninterned-symbol "abc"))
(eq? 'abc (string->unreadable-symbol "abc"))

(symbol-interned? 'abc)
(symbol-interned? (string->unreadable-symbol "abc"))
(symbol-unreadable? (string->unreadable-symbol "abc"))

(gensym)
(gensym "abc")