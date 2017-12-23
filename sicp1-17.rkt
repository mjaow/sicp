#lang planet neil/sicp

(define (* a b)
  (define (double x)
    (+ x x))
  (define (halve x)
    (/ x 2))
  (define (is-even x)
    (= (remainder x 2) 0))
  (cond ((= b 1) a)
        ((is-even b) (* (double a) (halve b)))
        (else (+ (* a (- b 1)) a))))

(* 3 4)
(* 4 8)
(* 5 12)