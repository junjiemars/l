;;;; -*- lexical-binding:t -*-

(require 'bytecomp)

(defalias 'foo
  (make-byte-code
   (byte-compile-make-args-desc '(n))
   (unibyte-string
    byte-dup
    byte-add1
    byte-return)
   []
   2))

(defalias 'square
  (make-byte-code
   (byte-compile-make-args-desc '(n))
   (unibyte-string
    byte-dup
    (+ byte-stack-ref 1)
    byte-mult
    byte-return)
   []
   3))

(defalias 'cube
  (make-byte-code
   (byte-compile-make-args-desc '(n))
   (byte-compile-lapcode
    '((byte-dup)
      (byte-constant . 0)
      (byte-stack-ref . 2)
      (byte-call . 1)
      (byte-mult)
      (byte-return)))
   [square]
   5))
