#lang racket
(require "modules.rkt")
(require racket/trace)
(provide (all-defined-out))

(define (smoothing proc dx-num)
  (lambda (x) 
    (average (proc (- x dx-num))
             (proc x)
             (proc (+ x dx-num)))))

((smoothing (lambda (x) (+ x 1)) 2) 4)
