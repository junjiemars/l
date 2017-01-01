
#|
However, DESTRUCTURING-BIND has the shortcoming that it doesn’t lend itself well to testing if an object has a certain structure (it will signal an error if it can’t match) and it also can’t match against constant parts of a structure. These tasks fall into the domain called pattern matching and languages like HASKELL or ML are particularly good at that.
I known Erlang can do this too.
|#

(destructuring-bind (a (b &rest c) (d (e . f)))
    '("A" (:b 2 3 4) (#\D (1.0 . 3.0)))
  (list a b c d e f))

(destructuring-bind (&key a (b :not-found) c &allow-other-keys)
    '(:c 23 :d "D" :a #\A :foo :whatever)
  (list a b c))


;; (ql:quickload '(:optima)

;; https://github.com/guicho271828/trivia
;; (ql:quickload :trivia)
