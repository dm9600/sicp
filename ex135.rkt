#lang racket
(require "modules.rkt")
(provide (all-defined-out))

(define tolerance 0.00001)

(define (gr-trans x)
  (+ 1 (/ 1 x)))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(exact->inexact (fixed-point gr-trans 1))
