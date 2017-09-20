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
actions that depend on previous actions; the plan is computed from the structure of the systems.

* ```uiop```
the _Utilities_ for _Implementation_- and _OS_- _Portability_, formerly known 
as _asdf/driver_, is a Common Lisp portability library and runtime support 
system that helps you write Common Lisp software in a protable way.

## SLIME REPL
```M-x``` go into __slime__, open __hi.asd__, ```C-c C-k``` compile it


## References
* [ASDF Manual](https://common-lisp.net/project/asdf/asdf.html)

