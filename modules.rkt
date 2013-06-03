#lang racket

(provide (all-defined-out))

(define (puts x)
  (displayln x))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (square-miller x)
  (define (check n)
    (cond ((or (= n 1) (= n (- n 1))) 0)
          (else (square n))))
  (check (square x)))

