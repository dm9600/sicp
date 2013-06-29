#lang racket
(require racket/trace)
(provide (all-defined-out))

(define (average . numbers)
   (exact->inexact (/ (apply + numbers) (length numbers))))

(define (puts x)
  (displayln x))

(define (square x)
  (* x x))

(define (double x)
  (+ x x))

(define (cube x)
  (* x x x))

(define (inc x)
  (+ x 1))

(define (square-miller x)
  (define (check n)
    (cond ((or (= n 1) (= n (- n 1))) 0)
          (else (square n))))
  (check (square x)))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       .00001))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
    (try first-guess))


(define (deriv g)
  (let ([dx .0000001])
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx))))
