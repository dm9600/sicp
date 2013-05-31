(define (square x)
  (* x x))

(define (prime? n)
  (define (prime-iter n i)
    (cond ((= n i) '#t)
          (else 
            (cond ((= (modulo n i) 0) #f)
                  (else (prime-iter n (+ i 1)))))))
  (prime-iter n 2))


(define (timed-prime-test n)
  (newline) (display n) (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ") (display elapsed-time))

(display (timed-prime-test 7))
