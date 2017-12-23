#lang planet neil/sicp

(define (* a b)
  (define (double x)
    (+ x x))
  (define (halve x)
    (/ x 2))
  (define (is-even x)
    (= (remainder x 2) 0))
  (define (mult-iter x y p)
    (cond ((= y 1) (+ x p))
          ((is-even y) (mult-iter (double x) (halve y) p))
          (else (mult-iter (double x) (halve (dec y)) (+ p x)))))
  (mult-iter a b 0))

(* 3 4)
(* 4 8)
(* 5 12)