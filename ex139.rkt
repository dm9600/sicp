#lang racket
(require "modules.rkt")
(provide (all-defined-out))

(define (cont-fract n d k)
  (define (iter i)
    (cond ((< i k)
           (/ (n i) (+ (d i) (iter (+ i 1)))))
           (else (/ (n i) (d i)))))
  (iter 1))

(define (tan-cf x k)
  (define (n i)
    (cond ((= i 1) x)
          ((> i 1)
           (* (square x) -1))))
  (define (d i)
    (+ 1 (* 2 (- i 1))))
  (exact->inexact (cont-fract n d k)))

(tan-cf 1 10)


