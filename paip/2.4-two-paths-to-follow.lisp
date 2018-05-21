;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

#|
Developing programs:
(1) Use the most straightforward mapping of the problem description directly
into Lisp code.
(2) Use the most natural notation available to solve the problem, and then 
worry about writting an interpreter for that notation.

Approach (2) involves an extra step, and thus is more work for small problems.
However, programs that use this approach are often easier to modify and expand.
The idea behind approach (2) is to work with the problem as much as possible
in its own terms, and to minimize the part of the solution that is written 
directly in Lisp.
|#
