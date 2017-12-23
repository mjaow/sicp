#lang planet neil/sicp

(define (abs-of-diff x y)
  (cond ((< x y) (- y x))
        (else (- x y))))

(define (close-enough x y)
  (< (abs-of-diff x y) 0.00001))

(define (square x)
  (* x x))

(define (avg x y z)
  (/ (+ x y z) 3.0))

(define (guess-better guess x)
  (avg guess guess (/ x (square guess))))

(define (good-enough guess x)
  (close-enough (square guess) x))

;重写good-enough
(define (better-good-enough guess x)
  (close-enough guess (guess-better guess x)))

(define (cubert-with-guess guess x)
  (if (better-good-enough guess x)
      guess
      (cubert-with-guess (guess-better guess x) x)))

(define (cubert x)
 (cubert-with-guess 1.0 x))

(cubert 2)