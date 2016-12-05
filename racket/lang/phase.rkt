#lang racket

(module box racket/base
  (provide (all-defined-out))
  (define b (box 0)))

(module transformers racket/base
  (provide (all-define-out))
  (require (for-syntax racket/base
                       'box))
  (define-syntax (sett stx)
    (set-box! b 2)
    #'(void))
  (define-syntax (gett stx)
    #`#,(unbox b)))

(module user racket/base
  (provide (all-defined-out))
  (require 'transformers)
  (sett)
  (define gott (gett)))

(module test racket/base
  (require 'box 'tranformers 'user)
  (displayln gott)
  (displayln (gett))
  (sett)
  (displayln (gett))
  (displayln (unbox b)))