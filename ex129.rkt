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
    (cond ((or (= k 0) (= k n)) 1)
          ((even? k) 2)
          (else 4)))

  ;Get the value of h
  (define h (/ (- b a) n))

  ;Get the value of y for k
  (define (y k)
    (f (+ a (* k h))))

  ;starting from k = a
  ;get mult * yk, and iterate
  (define (iter f a b n k)
    (cond ((< k n)
           (+ 
             (* 
               (get-mult k)
               (y k))
             (iter f a b n (+ k 1))))
          (else (* (get-mult k)
                   (y k)))))
  (* (/ h 3) (iter f a b n 0)))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (inc x) (+ x 1))
  (define (y k)
    (f (+ a (* k h))))
  (define (term k)
    (* (cond ((odd? k) 4)
             ((or (= k 0) (= k n)) 1)
             ((even? k) 2))
       (y k)))
  (/ (* h (sum term 0 inc n)) 3))

(integral2 cube 2 10 100)
(simpson cube 2 10 100)





