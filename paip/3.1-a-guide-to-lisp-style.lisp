;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-


#|
Using the most specific form possible makes it easier for your reader to 
understand your intent.

(1) For example, the conditional special form when is more specific than if.
(2) One important way of being specific is using abstractions.
(defvar *names* '((Robbert E. Lee) ...))
then you should also define functions to get at the components of each name. 
To get at Lee, use (last-name (first *names*)), not (caddar *names*).
(3) Often the maxims are in concord. For example, if your code is trying to 
find an element in a list, you should use find (or maybe find-if), not loop
or do.
(4) Sometimes, however, the maxims are in conflict, and experience will tell
you which one to prefer. Consider the following two ways of placing a new
key/value pair on an association list:
(push (cons key val) a-list)
(setf a-list (acons key val a-list))
The first is more concise. But the second is more specific, as it uses the 
acons function, which is designed specifically for association lists.
(5) Feeling that it is more consistent to use a single form, setf, for all
updating.
(6) Be consistent.
|#

