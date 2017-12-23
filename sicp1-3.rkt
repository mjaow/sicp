#lang planet neil/sicp

(define (square x)
  (* x x))

(define (sum-of-square x y)
  (+ (square x)
     (square y)))

(define (find-one op x y)
  (cond ((op x y) x)
        (else y)))

(define (answer x y z)
  (sum-of-square (find-one > x y)
                 (find-one > z (find-one < x y))))

(answer 3 4 5)