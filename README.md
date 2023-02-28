# Coroutines for Racket

Thanks to @soegaard @Ben Kenobi @pns11 & @4st on the Racket Discord

# How to install

1. [Set your PATH environment variable](https://github.com/racket/racket/wiki/Set-your-PATH-environment-variable) 
so you can use `raco` and other Racket command line functions.
2. either look for `coroutines` in the DrRacket menu **File|Package Manager**, or run the `raco` command:

```bash
raco pkg install coroutines
```

example

```
#lang racket/base

(require coroutine)

(define (ping-procedure resume value)
  (displayln "Pinging 1")
  (resume pong value)
  (displayln "Pinging 2")
  (resume pong value)
  (displayln "Pinging 3")
  (resume pong value))

(define ping (coroutine-maker ping-procedure))


(define (pong-procedure resume value)
  (displayln "Pinging 1")
  (resume ping value)
  (displayln "Pinging 2")
  (resume ping value)
  (displayln "Pinging 3")
  (resume ping value))

(define pong (coroutine-maker pong-procedure))


(ping 1)
```

result

```
Pinging 1
updating
Pinging 1
updating
Pinging 2
updating
Pinging 2
updating
Pinging 3
updating
Pinging 3
updating
1
```
