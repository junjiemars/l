#lang racket

(require plot)

(parameterize ([plot-title "An R × R → R function"]
               [plot-x-label "x"]
               [plot-y-label "y"]
               [plot-z-label "cos(x) sin(y)"])
  (plot3d (contour-intervals3d
           (λ (x y)
             (* (cos x) (sin y)))
           (- pi) pi (- pi) pi)))
