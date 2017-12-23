#lang planet neil/sicp

(define (abs-of-diff x y)
  (cond ((< x y) (- y x))
        (else (- x y))))

(define (close-enough x y)
  (< (abs-of-diff x y) 0.00001))

(define (square x)
  (* x x))

(define (avg x y)
  (/ (+ x y) 2.0))

(define (guess-better guess x)
  (avg guess (/ x guess)))

(define (good-enough guess x)
  (close-enough (square guess) x))

;重写good-enough
(define (better-good-enough guess x)
  (close-enough guess (guess-better guess x)))

(define (sqrt-with-guess guess x)
  (if (better-good-enough guess x)
      guess
      (sqrt-with-guess (guess-better guess x) x)))

(define (sqrt x)
 (sqrt-with-guess 1.0 x))

;(sqrt 1000000000000000) ;对于很大的数，采用good-enough算法几乎无法达到相差无几的地步
(sqrt 0.00000000000000000000001) ;对于很小的数，无法给出正解