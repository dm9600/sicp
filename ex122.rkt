#lang racket

(require "modules.rkt")
(require "smallest-divisor.rkt")
(require "fast-prime.rkt")
(provide (all-defined-out))


(define (timed-prime-test n)
  (cond ((start-prime-test n (current-inexact-milliseconds)) '#t)
        (else '#f)))

(define (start-prime-test n start-time)
  (cond ((prime? n)
         (report-prime n (- (current-inexact-milliseconds) start-time)) '#t)
        (else '#f)))

(define (report-prime n elapsed-time)
  (puts n)
  (puts elapsed-time))

(define (smallest-prime n)
  (define (smallest-prime-iter n1)
    (cond ((timed-prime-test n1) n1)
          (else (smallest-prime-iter (+ n1 1)))))
  (smallest-prime-iter (+ n 1)))

(define (prime? n)
;  (= n (smallest-divisor n)))
   (fast-prime? n 100))

(define (three-smallest-primes n)
  (define (iter n i)
    (cond ((< i 1) 
           (iter (smallest-prime n) (+ i 1)))))
  (iter n 0))

(three-smallest-primes 1000)
(three-smallest-primes 10000)
(three-smallest-primes 100000)
(three-smallest-primes 1000000)
    
