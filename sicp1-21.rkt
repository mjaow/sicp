#lang planet neil/sicp

(define (smallest-divisor n)
  (define (square x)
    (* x x))
  (define (find-divisor base)
    (cond ((> (square base) n) n)
          ((= (remainder n base) 0) base)
          (else (find-divisor (inc base)))))
  (find-divisor 2))

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)