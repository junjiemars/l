#lang racket

(require plot)
(plot-new-window? #t)

(plot (function sin (- pi) pi #:label "y = sin(x)"))

(plot-file (function sin (- pi) pi #:label "y = sin(x)")
           "/tmp/sin.png")

(plot3d (surface3d (λ (x y)
                     (* (cos x) (sin y)))
                   (- pi) pi (- pi) pi)
        #:title "An R × R → R function"
        #:x-label "x" #:y-label "y" #:z-label "cos(x) sin(y)")

