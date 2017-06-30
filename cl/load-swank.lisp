

(load "/opt/open/slime/swank-loader.lisp")

(swank-loader:init)

(swank:create-server :port 4005)

(setf swank:*use-dedicated-output-stream* nil)


