# racket_lessons
racket programming lessons and use cases

* [REPL](#repl)
  * [DrRacket REPL](#drracket-repl)
  * [Terminal REPL](#terminal-repl)
  * [Emacs Racket REPL](#emacs-racket-repl)
* [Build & Test](#build-&-test)
* [Lang](#lang)


  
## REPL

### DrRacket REPL

### Terminal REPL

* start racket REPL
```sh
$ [EDITOR=emacs|vi|<default is DrRacket>] rlwrap racket
```
* go into help system
```sh
# show available commands
> ,help
```

### Emacs Racket REPL

## Build & Test

* compiling
```sh
$ raco make hi.rkt 
```
* testing
```
$ raco test hi.rkt
```
* building executable
```sh
$ raco exe -o xyz hi.rkt
```


## Lang


## References
* [Lisp: Common Lisp, Racket, Clojure, Elisp](http://hyperpolyglot.org/lisp)
