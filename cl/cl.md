# Common Lisp

## Environments

### View Source Code
Set sbcl's source path via
```common-lisp
(sb-ext:set-sbcl-source-location "<path-of-sbcl-source>")
```
Use ```M-.``` jump to ```*slime-xref*``` list.

## Compile

### fasl



## Debug

### Remote Swank Server
```common-lisp
(load "<path-of-swank-loader.lisp>")

(swank-loader:init)

(swank:create-server :port 4005)

(setf swank:*use-dedicated-output-stream* nil)

```


## References
* [WikipediA](https://en.wikipedia.org/wiki/Common_Lisp)
* [ASDF](https://www.common-lisp.net/project/asdf/)
* [Quicklisp](https://www.quicklisp.org/beta/)
* [Quickproject](https://www.xach.com/lisp/quickproject/)
* [The ECL manual](https://common-lisp.net/project/ecl/static/manual/)
* [SBCL](http://sbcl.org)


