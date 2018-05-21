;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-


#|
sentence => noun-phrase + verb-phrase
noun-phrase => article + nun
verb-phrase => verb + noun-phrase
article => the, a, ...
noun => man, ball, woman, table, ...
verb => hit, took, saw, liked, ...
|#


(defparameter *simple-grammar*
	'((sentence -> (noun-phrase verb-phrase))
		(noun-phrase -> (article noun))
		(verb-phrase -> (verb noun-phrase))
		(article -> the a)
		(noun -> man ball woman table)
		(verb -> hit took saw liked))
	"A grammar for a trivial subset of English.")

(defparameter *grammar* *simple-grammar*
	"The grammar used by generate. Initially, this is 
*simple-grammar*, but we can switch to other grammars.")

(defun rule-lhs (rule)
	"The left-hand side of a rule."
	(first rule))

(defun rule-rhs (rule)
	"The right-hand side of a rule."
	(rest (rest rule)))

(defun rewrites (category)
	"Return a list of the possible rewrites for this category."
	(rule-rhs (assoc category *grammar*)))


(defun mappend (fn the-list)
	"Apply fn to each element of list and append the results."
	(apply #'append (mapcar fn the-list)))

(defun random-elt (choices)
	"Choose an element from a list at random."
	(elt choices (random (length choices))))


(defun generate (phrase)
	"Generate a random sentence or phrase"
	(cond ((listp phrase)
				 (mappend #'generate phrase))
				((rewrites phrase)
				 (generate (random-elt (rewrites phrase))))
				(t (list phrase))))

(generate 'noun)
(generate 'verb)
(generate 'noun-phrase)
(generate 'verb-phrase)
(generate 'sentence)


#|
The craft of programming includes knowing what not to write, as well as 
what to write.
This style of programing is called data-driven programming, because the data
driven what the program does next. It is a natural and easy-to-use style in 
Lisp, leading to concise and extensible programs, having to modify the 
original program.
|#


(defun generate1 (phrase)
	"Generate a random sentence or phrase."
	(if (listp phrase)
			(mappend #'generate1 phrase)
			(let ((choices (rewrites phrase)))
				(if (null choices)
						(list phrase)
						(generate1 (random-elt choices))))))


;; Exercise 2.1
;; Write a version of generate that uses cond but avoids calling rewrites twice.

(defun generate2 (phrase)
	(let ((choices nil))
		(cond ((listp phrase)
					 (mappend #'generate2 phrase))
					((setf choices (rewrites phrase))
					 (generate (random-elt choices)))
					(t (list phrase)))))


;; Exercise 2.2
;; Write a version of generate that explicitly differentiates between
;; terminal symbols (those with no rewrite rules) and nonterminal symbols.

(defun non-terminal-p (category)
	(not (null (rewrites category))))

(defun generate3 (phrase)
	(cond ((listp phrase))
				((non-terminal-p phrase)
				 (generate (random-elt (rewrites phrase))))
				(t (list phrase))))

;;;;
;; 2.5-changing-the-grammar-without-changing-the-program.lisp
;;;;

(defparameter *bigger-grammar*
	'((sentence -> (noun-phrase verb-phrase))
		(noun-phrase -> (article adj* noun pp*) (name) (pronoun))
		(verb-phrase -> (verb noun-phrase))
		(pp* -> () (pp pp*))
		(adj* -> () (adj adj*))
		(pp -> (prep noun-phrase))
		(prep -> to in by with on)
		(adj -> big little blue green adiabatic)
		(article -> the a)
		(name -> Pat Kim Lee Terry Robin)
		(noun -> man ball woman table)
		(verb -> hit took saw liked)
		(pronoun -> he she it these those that))
	"A grammar for a trivial subset of English.")

(setf *grammar* *bigger-grammar*)
