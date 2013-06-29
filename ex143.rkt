#lang racket
(require "modules.rkt")
(require racket/trace)
(provide (all-defined-out))

(define (compose-proc proc-one proc-two)
  (lambda (x)
    (proc-one (proc-two x))))

(define (repeated proc times)
   (define (iter ret-val times)
     (if (> times 1)
       (iter (compose-proc ret-val proc) (- times 1))
       ret-val))
   (iter proc times))

((repeated inc 3) 1)

((repeated square 3) 2)
