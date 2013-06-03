#lang racket
(require "modules.rkt")
(provide (all-defined-out))

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (integral1 f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (integral2 f a b n)
  (define (get-mult k)
    (cond ((= k 0) 1)
          ((even? k) 4)
          (else 2)))
  (define (h b a n)
    (/ (- b a) n))
  (define (y f a b h k)
    (f (+ a (* k (h b a n)))))
  (sum (* (get-mult k) (y f a b (h b a n))


(integral2 cube 0 1 100)
(integral1 cube 0 1 100)
