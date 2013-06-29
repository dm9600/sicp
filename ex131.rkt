#lang racket
(require "modules.rkt")
(provide (all-defined-out))

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (product term a next b)
  (puts (term a))
  (if (> a b)
    1
    (* (term a)
       (product term (next a) next b))))

(define (factorial n)
  (define (next a)
    (+ a 1))
  (product identity 1 next n))

(define (pi-est n)
  (define (next a)
    (/ (+ (numerator a) 2) 
       (+ (denominator a) 2)))
  (define (term a)
    (* a a))
  (* 2 (product term (/ 2 3) next n)))


(/ (* 2 2 4 4 6 6) (* 3 3 5 5 7 7))
; 2304
; 



