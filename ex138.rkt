#lang racket
(require "modules.rkt")
(provide (all-defined-out))

(define (cont-fract n d k)
  (define (iter i)
    (cond ((< i k)
           (/ (n i) (+ (d i) (iter (+ i 1)))))
           (else (/ (n i) (d i)))))
  (iter 1))

(define (val i)
  (define (div-by-three x)
    (if (= (modulo x 3) 0) #t
      #f))
  (cond ((= i 1) 1)
        ((= i 2) 2)
        ((div-by-three (- i 2))
         (+ (* (/ (- i 2) 3) 2) 2))
        (else 1)))

(define (d i)
  (if (not (= 0 (remainder (+ i 1) 3)))
    1
    (* 2 (/ (+ i 1) 3))))

(define (cont-frac n d k)
  (define (frac i)
    (if (< i k)
      (/ (n i) (+ (d i) (frac (+ i 1))))
      (/ (n i) (d i))))
  (frac 1))

(+ (cont-fract (lambda (i) 1.0)
               val
               2) 2)
(+ (cont-frac (lambda (i) 1.0)
              val
              2) 2)

