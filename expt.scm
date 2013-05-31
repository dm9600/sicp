(define (expt b n)
  (expt-iter b n 1))
(define (expt-iter b counter product)
  (if (= counter 0)
    product
    (expt-iter b
               (- counter 1)
               (* b product))))

(define (fast-expt b n)
  (define (square num) (* num num))
  (cond ((= n 0) 1)
        ((even? n) 
         (print "even split")
         (square (fast-expt b (/ n 2))))
        (else 
          (print "odd split")
          (* b (fast-expt b (- n 1))))))
