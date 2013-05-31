(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter previous guess x)
  (if (good-enough? previous guess x)
    guess
    (sqrt-iter guess (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? previous guess x)
  (cond (< (/ (abs (- guess previous)) guess) (* .01 guess)) #t)
  (else #f))


(define (sqrt x)
  (sqrt-iter 0 1.0 x))
