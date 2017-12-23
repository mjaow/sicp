#lang planet neil/sicp

;递归
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

;迭代
(define (better-product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (numerator i)
  (cond ((= i 1) 2)
        ((even? i) (+ i 2))
        (else (+ i 1))))

(define (denominator i)
  (cond ((even? i) (+ i 1))
        (else (+ i 2))))

(define (pi n)
  (* 4.0 (/ (better-product numerator 1 inc n)
            (better-product denominator 1 inc n))))
(pi 100000)