;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-


;; θ((expt 2 N)) steps,  θ((depth-of-tree N)) spaces
(defun fib (n)
	(cond ((= n 0) 0)
				((= n 1) 1)
				(t (+ (fib (- n 1)) (fib (- n 2))))))


;; θ(N) steps, θ(1) spaces, linear iteractive process
;; a <- a + b,
;; b <- a,
;; n <- n - 1.
;; (fib1 1 0 n)
(defun fib1 (a b n)
	(if (= n 0)
			b
			(fib1 (+ a b) a (- n 1))))


#|
Example: Counting change
How many different ways can we make change of $1.00, given half-dollars, 
quarters, dimes, nickels, and pennies?

Suppose we think of the types of coins available as arranged in some order.
Then the following relation holds:
The number of ways to change amount a using n kinds of coins equals
1. the number of ways to change amount a using all but the first kind of coin,
plus
2. the number of ways to change amount a - d using all n kinds of coins, where
d is the denomination of the first kind of coin.

kinds of coins:
------------------
pennie       1/100 = 1 cent
nickel       1/20
dime         1/10
quarter      1/4
half-dollar  1/2
|#

(defun count-change (amount)
	(cc amount 5))

(defun cc (amount kinds-of-coins)
	"If amount is exactly 0, we should count that as 1 way to make change.
If amount is less than 0, we should count that as 0 ways to make change.
If kinds-of-coins is 0, we should count that as 0 ways to make change."
	(cond ((= amount 0) 1)
				((or (< amount 0)
						 (= kinds-of-coins 0)) 0)
				(t (+ (cc amount (- kinds-of-coins 1))
							(cc (- amount (first-denomination kinds-of-coins))
									kinds-of-coins)))))

(defun first-denomination (kinds-of-coins)
	"Takes as input the number of kinds of coins available and retuns 
the first kind."
	(cond ((= kinds-of-coins 1) 1)  ;; pennie
				((= kinds-of-coins 2) 5)  ;; nickel
				((= kinds-of-coins 3) 10) ;; dime
				((= kinds-of-coins 4) 25) ;; quarter
				((= kinds-of-coins 5) 50) ;; half-dollar
				))

#|
Exercise 1.11
A function is defined by the rule that:
f(n) = n if n <3 and f(n) = f(n-1) + 2f(n-2) + 3f(n-3) if n >= 3.
|#

;; θ((expt 2 N)) steps
(defun f1 (n)
	(if (< n 3)
			n
			(+ (f1 (- n 1))
				 (f1 (- n 2))
				 (f1 (- n 3)))))

;; a <- a + 2b + 3c
;; b <-
;; c <- 
(defun f2 (a b c n)
	)
