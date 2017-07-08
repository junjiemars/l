#lang racket

(require net/http-client)


;(define check-self-ip
;  (make-domain-requester "checkip.dns.he.net" http-requester))

(define (check-self-ip)
  (let ((conn (http-conn-open "checkip.dns.he.net")))
    (display (http-conn-recv! conn
                              #:close? true))))
  