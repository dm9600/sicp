#lang racket
(require "modules.rkt")
(provide (all-defined-out))

(define (cont-frac1 n d k)
  (if (> k 1)
    (/ n (+ d (cont-frac1 n d (- k 1))))
    1))


(define (cont-frac n d k)
  (define (frac i)
    (if (< i k)
      (/ (n i) (+ (d i) (frac (+ i 1))))
      (/ (n i) (d i))))
  (frac 1))

(define (cont-frac1-iter n d k)
  (define (iter i result)
    (cond ((= i k)
           (iter (- i 1) (/ n d)))
          ((= i 0)
           result)
          (else (iter (- i 1)
                      (/ n (+ d result))))))
  (iter k 0))

(define (cont-fract n d k)
  (if (> k 1)
    (/ (n k) (+ (d k) (cont-fract n d (- k 1)))) 1))


(cont-frac1-iter 1.0 1.0 15.0)
(cont-frac1 1.0 1.0 15.0)
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           15.0)
(cont-fract (lambda (i) 1.0)
           (lambda (i) 1.0)
           15.0)


