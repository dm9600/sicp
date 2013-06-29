#lang racket
(require "modules.rkt")
(provide (all-defined-out))

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (sum2 term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) 
            (+ (term a) result))))
  (iter a 0))

(define (nx x)
  (+ x 1))
(sum cube 4 nx 6)
(sum2 cube 4 nx 6)

