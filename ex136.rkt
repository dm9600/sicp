#lang racket
(require "modules.rkt")
(provide (all-defined-out))

(define tolerance 0.00001)

(define (gr-trans x)
  (+ 1 (/ 1 x)))

(define (fixpt-this x)
  (/ (log 1000) (log x)))
(define (fixpt-this-damp x)
  (average x (fixpt-this x)))
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess i)
    (let ((next (f guess)))
      ;(puts (exact->inexact guess))
      (puts i)
      (if (close-enough? guess next)
        next
        (try next (+ i 1)))))
  (try first-guess 1))


(fixed-point fixpt-this-damp 2)
