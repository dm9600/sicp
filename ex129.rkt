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
  ;Get the multiplier for each iteration
  (define (get-mult k)
    (cond ((= k 0) 1)
          ((even? k) 2)
          (else 4)))

  ;Get the value of h
  (define (h b a n)
    (/ (- b a) n))

  ;Get the value of y for k
  (define (y f a b k n)
    (f (+ a (* k (h b a n)))))

  ;starting from k = a
  ;get mult * yk, and iterate
  (define (iter f a b n k)
    (cond ((< k n)
           (+ 
             (* 
               (get-mult k)
               (y f a b k n))
             (iter f a b n (+ k 1))))
          (else (* (get-mult k)
                   (y f a b k n)))))
  (iter f a b n 0))

(integral2 cube 0 1 .01)





