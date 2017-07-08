#lang racket

(require racket/cmdline)

(define verbose? (make-parameter #f))
(define filename (make-parameter null))

(define app-args
  (command-line
   #:program "clp"
   
   #:once-each
   [("-v" "--verbose") "verbose"
                       (verbose? #t)]
   [("-f" "--file") input-file "input file name"
                    (filename input-file)]

   

   #:args (x) x))


(if (verbose?)
    (println "in verbose mode")
    (println "not in verbose mode"))

(if (filename)
    (println (filename))
    (println "no input name"))