#lang racket

(require plot)

(plot-new-window? #t)

(plot (list (axes)
            (function sqr -2 2 #:label "y = x^2")
            (function (λ (x) x) #:label "y = x" #:color 0 #:style 'dot)
            (inverse sqr -2 2 #:label "x = y^2" #:color 3)))
