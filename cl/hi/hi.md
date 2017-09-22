# Hi 
Hello world! Common Lisp program


## ASDF 
Another System Definition Facility, ASDF is the _de facto_ standanrd build 
facility for Common Lisp. ASDF is what Common Lisp hackers use to build and 
load software.

ASDF contains two parts: ```asdf/defsystem``` and ```uiop```.

* ```asdf/defsystem``` 
is a tool to describe how lisp source code is organized in systems, and how to 
build and load these systems. The build happends based on a plan in term of 
actions that depend on previous actions; the plan is computed from the
structure of the systems.

* ```uiop```
the _Utilities_ for _Implementation_- and _OS_- _Portability_, formerly known 
as _asdf/driver_, is a Common Lisp portability library and runtime support 
system that helps you write Common Lisp software in a protable way.


## Quicklisp
Quicklisp is a library manager for Common Lisp.




## SLIME REPL

### Load

Start ```M-x slime``` first,

* via _ASDF_
open __hi.asd__ file, ```C-c C-l``` compile and load.
```lisp
CL-USER> (asdf:load-system :hi)
```
* via _Quicklisp_
```lisp
CL-USER> (pushnew #P"<parent-path-of-hi>" ql:*local-project-directories*)
CL-USER> (ql:quickload :hi)
```


## References
* [ASDF Manual](https://common-lisp.net/project/asdf/asdf.html)
* [Quicklisp](https://www.quicklisp.org/beta/)

