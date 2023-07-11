#lang info

(define collection "coroutines")

(define scribblings
  (list (list "coroutines.scrbl"
              (list 'multi-page)
              (list 'concurrency)
              "coroutines")))

(define deps
  (list "base"))

(define build-deps
  (list "racket-doc"
        "rackunit-lib"
        "scribble-lib"))
