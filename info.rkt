#lang info

(define collection "coroutines")

(define scribblings
  (list (list "coroutines.scrbl"
              (list 'multi-page)
              (list 'library)
              "coroutines")))

(define deps
  (list "base"))

(define build-deps
  (list "racket-doc"
        "rackunit-lib"
        "scribble-lib"))
