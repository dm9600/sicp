(define (pascal size)
  (define (row size index)
    (cond ((or (= index 1) (= index size)) 1)
          (else (+ (row (- size 1) (- index 1))
                   (row (- size 1) index)))))

  (define (iter size index stop)
    (print (row size index))
    (cond ((and (= size stop) (= index stop)) 'end)
          ((= size index) (iter (+ size 1) 1 stop))
          (else (iter size (+ index 1) stop))))

  (iter 1 1 size))

