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
drivews what the program does next. It is a natural and easy-to-use style in 
Lisp, leading to concise and extensible programs, having to modify the 
original program.
|#


(defun generate1 (phrase)
	"Generate a random sentence or phrase."
	(if (listp phrase)
			(mappend #'generate phrase)
			(let ((choices (rewrites phrase)))
				(if (null choices)
						(list phrase)
						(generate (random-elt choices))))))
