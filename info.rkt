#lang info

(define collection "coroutines")

(define scribblings ; https://docs.racket-lang.org/raco/setup-info.html
   '(("coroutines.scrbl" ; collection-relative path to documentation source
      () ; flags - defaults to single page
      ("Concurrency") ; category in docs.racket-lang.org homepage 
      "coroutines"))) ; name
(define license
  '(Apache-2.0 OR MIT))

(define deps
  (list "base"))

(define build-deps
  (list "racket-doc"
        "rackunit-lib"
        "scribble-lib"))
