#lang racket
(require "modules.rkt")
(require racket/trace)
(provide (all-defined-out))

(define (sqroot x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))

(define (cube-root x)
  (fixed-point 
    (average-damp (average-damp (lambda (y) (/ x (expt y 2))))) 1.0))

(define (nth-root in-num roots-num)
  (define (iter-damp ret-proc roots-num)
   (if (> roots-num 0) 
     (iter-damp (average-damp ret-proc) (- roots-num 1))
     ret-proc))
  (fixed-point 
    (iter-damp (lambda (y) (/ in-num (expt y roots-num))) roots-num) 1.0))

(nth-root 64 5)
