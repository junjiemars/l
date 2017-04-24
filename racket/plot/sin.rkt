#lang racket

(require plot)
(plot-new-window? #t)

(plot (function sin (- pi) pi #:label "y = sin(x)"))
