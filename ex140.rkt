#lang racket
(require "modules.rkt")
(require racket/trace)
(provide (all-defined-out))

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))


