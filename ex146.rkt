#lang racket
(require "modules.rkt")
(require racket/trace)
(provide (all-defined-out))

(define (iterative-improve in-proc good-enough-proc)
  (define (ret-proc guess)
    (if (good-enough-proc guess) guess
      (ret-proc (in-proc guess))))
  (lambda (guess) (ret-proc guess)))

(define (new-sqrt in-num)
  (define (improve guess)
    (average guess (/ in-num guess)))
  (define (good-enough? guess)
    (< (abs (- (square guess) in-num)) 0.001))
  ((iterative-improve improve good-enough?) in-num))

(define (new-fixed-point in-proc guess-num)
  (define (good-enough? guess-num)
    (< (abs (- guess-num (in-proc guess-num))) .00001))
  (define (improve guess-num)
    (in-proc guess-num))
  ((iterative-improve improve good-enough?) guess-num))

(fixed-point sin 1.0)
(new-fixed-point sin 1.0)
