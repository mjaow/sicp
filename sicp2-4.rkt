#lang planet neil/sicp

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (x y)
       x)))

(define (cdr z)
  (z (lambda (x y)
       y)))

(define x (cons 3 5))

(car x)

(cdr x)