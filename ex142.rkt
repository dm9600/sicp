#lang racket
(require "modules.rkt")
(require racket/trace)
(provide (all-defined-out))

(define (compose-proc proc-one proc-two)
  (lambda (x)
    (proc-one (proc-two x))))

((compose-proc square inc) 6)
