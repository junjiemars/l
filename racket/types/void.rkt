#lang racket

;; void
(void? (println "aaa"))
(void? (void "a" 1))

;; void is not null
(eq? null void)
