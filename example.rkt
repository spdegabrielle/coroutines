#lang racket/base
;; coroutines implementation from https://hillside.net/plop/plop2001/accepted_submissions/PLoP2001/dferguson0/PLoP2001_dferguson0_1.pdf
;; example
(require coroutines)

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
