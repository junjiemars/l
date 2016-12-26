#lang racket

(require request)

(define check-self-ip
  (make-domain-requester "checkip.dns.he.net" http-requester))

