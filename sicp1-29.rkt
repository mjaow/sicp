#lang planet neil/sicp

(define (simpson f a b n)
  (define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))
  (define h (/ (- b a) n))
  (define (current k)
    (* (cond ((or (= k 0) (= k n)) 1)
             ((even? k) 2)
             (else 4))
       (f (+ a (* k h)))))
     (* (sum current 0 inc n)
        (/ h 3)))

(define (cube x)
  (* x x x))

(simpson cube 0.0 1.0 100);0.24999999999999992
(simpson cube 0.0 1.0 1000);0.2500000000000003