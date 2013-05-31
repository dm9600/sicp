(define (double x)
  (+ x x))

(define (halve x)
  (if (< (modulo x 2) 1) 
    (/ x 2)))

(define (is-even x) 
  (cond ((= x 0) #t)
        ((> (modulo x 2) 0) #f)
        (else '#t)))

(define (mult a b)
  (define (iter y a b)
    (cond ((is-even a)
           (iter y (halve a) (double b)))
          ((= b 1) a)
          ((= a 1) (+ y b))
          (else (iter (+ y b) (- a 1) b))))
  (iter 0 a b))

(display (mult 1 2))

