#lang racket/base
(provide coroutine-maker)
;; coroutines implementation from https://hillside.net/plop/plop2001/accepted_submissions/PLoP2001/dferguson0/PLoP2001_dferguson0_1.pdf
; 
(define (coroutine-maker proc)
  (define saved-continuation '())
  (define (update-continuation! v)
    (set! saved-continuation v))
  (define resumer (resume-maker update-continuation!))
  (define first-time #t)
  (define (f value)
    (cond
      [first-time
       (set! first-time #f)
       (proc resumer value)]
      [else (saved-continuation value)]))
  f)

(define ((resume-maker update-proc!) next-coroutine value) 
  (define (receiver continuation)
    (update-proc! continuation)
    (next-coroutine value))
  (call-with-current-continuation receiver))
