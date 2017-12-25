#lang planet neil/sicp

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (square x)
  (* x x))

(define (repeated f n)
  (if (= n 1)
      (lambda (x) (f x))
      (compose f (repeated f (dec n)))))

(define (average x y z)
  (/ (+ x y z) 3))

(define (smooth f)
  (define dx 0.00001)
  (lambda (x)
    (average (f (- x dx)) (f x) (f (+ x dx)))))

;(define (smooth-n-times f n)
;  (if (= n 0)
;      f
;      (smooth (smooth-n-times f (dec n)))))

(define (smooth-n-times f n)
  ((repeated smooth n) f))

((smooth square) 5)
((smooth-n-times square 10) 5)