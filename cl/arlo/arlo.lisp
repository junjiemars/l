;;;; arlo.lisp

(in-package #:rocks.trunk.web.arlo)

;;; "arlo" goes here. Hacks and glory await!

(load-plugins)

(defroute (:get "/") (req res)
  (send-response res :body "Welcome to arlo!"))

(def-directory-route "/" "./asserts")

 (as:with-event-loop ()
   (let* ((listener (make-instance 'listener
                                   :bind nil
                                   :port 8080))
          (server (start-server listener)))
     (as:signal-handler
      2
      (lambda (sig)
        (declare (ignore sig))
        (as:free-signal-handler 2)
        (as:close-tcp-server server)))))
                         
     
                       
         
