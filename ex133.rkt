#lang racket
(require "modules.rkt")
(require "fast-prime.rkt")
(provide (all-defined-out))

(define (accumulate-filt combiner null-value term a next b filt)
  (if (> a b)
    null-value
    (if (filt a)
      (combiner 
        (term a)
        (accumulate-filt combiner null-value term (next a) next b filt))
      (accumulate-filt combiner null-value term (next a) next b filt))))

(accumulate-filt + 0 square 2 inc 4 prime?)

((lambda (x y) (+ x y)) 1 1)
