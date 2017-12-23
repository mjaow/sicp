#lang planet neil/sicp

(define (f g)
  (g 2))

(define (square x)
  (* x x))

(f square)
(f (lambda (x) (* x (+ x 1))))
(f f);报错，(f f) => (f 2) => (2 2)，2不是过程