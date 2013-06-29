#lang racket
(require "modules.rkt")
(provide (all-defined-out))

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner 
      (term a)
      (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (cond ((> a b)
           (combiner result null-value))
          (else 
            (iter (next a) (combiner result (term a))))))
  (iter a null-value))


(accumulate-iter + 0 identity 0 inc 9)
(sum identity 0 inc 9)
