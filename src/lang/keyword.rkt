#lang racket

(keyword<? (string->keyword "a")
           (string->keyword "b"))

(keyword? (string->keyword "a"))