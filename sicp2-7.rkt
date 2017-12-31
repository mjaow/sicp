#lang planet neil/sicp

(define (make-interval a b)
  (cons a b))

(define (better-one op)
  (lambda (x y)
    (if (op x y)
        x
        y)))

(define (upper-bound x)
  ((better-one >) (car x) (cdr x)))
(define (lower-bound x)
  ((better-one <) (car x) (cdr x)))

(define i (make-interval 3 -5))

(upper-bound i)
(lower-bound i)