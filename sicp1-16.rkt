#lang planet neil/sicp

(define (is-even n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))

(define (expt b n)
  (define (expt-iter a b n)
    (cond ((= n 0) a)
          ((is-even n) (expt-iter a (square b) (/ n 2)))
          (else (expt-iter (* a b) b (dec n)))))
  (expt-iter 1 b n))

(expt 2 10)