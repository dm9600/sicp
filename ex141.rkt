#lang racket
(require "modules.rkt")
(require racket/trace)
(provide (all-defined-out))

(define (double-proc in-proc)
  ;returns a procedures
  (lambda (input) 
    (in-proc (in-proc input))))

((double-proc square) 4)
