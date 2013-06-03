#lang racket
(require "modules.rkt")
(require "fast-prime.rkt")
(provide (all-defined-out))

(define (miller-fermat-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 2 (random (- n 2)))))

(define (miller-fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-fermat-test n) 
         (miller-fast-prime? n (- times 1)))
        (else false)))

(miller-fermat-test 561)




