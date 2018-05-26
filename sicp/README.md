# Note of SICP
Structure and Interpretation of Computer Programs.


* [Tools & Tips](#tools-tips)
  * [DrRacket](#DrRacket)
  * [Interactive Mode](#interactive-mode)
* [Chapter](#chapter)
  * [1.2.1 Linear Recursion and Iteration](#1.2.1)


## Tools & Tips

### DrRacket

### Interactive Mode
```sh
$ racket
> (enter! "<which>.rkt")
> (square 2)
```

## Chapter

### 1.2.1

#### Recursive Process vs. Recursive Procedure
> In contrasting iteration and recursion, we must be careful not to
confuse the notion of a recursive process with the notion of a recursive
procedure . When we describe a procedure as recursive, we are referring
to the syntactic fact that the procedure definition refers (either directly
or indirectly) to the procedure itself. But when we describe a process
as following a pattern that is, say, linearly recursive, we are speaking
about how the process evolves, not about the syntax of how a procedure
is writen.

#### Ackermann Function
[Ackermann Function](https://en.wikipedia.org/wiki/Ackermann_function)
> All [primitive recursive](https://en.wikipedia.org/wiki/Primitive_recursive_function)
 functions are [total and computable](https://en.wikipedia.org/wiki/Computable_function), 
but the Ackermann function illustrates that 
not all total computable functions are primitive recursive.

