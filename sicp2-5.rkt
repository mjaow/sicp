#lang planet neil/sicp

(define (exp n m)
  (if (= m 0)
      1
      (* n (exp n (dec m)))))

(define (cons a b)
  (* (exp 2 a)
     (exp 3 b)))

(define (find-exp x n)
  (define (!= x y)
    (not (= x y)))
  (if (!= (remainder x n) 0)
      0
      (inc (find-exp (/ x n) n))))

(define (car x)
  (find-exp x 2))
(define (cdr x)
  (find-exp x 3))

(define x (cons 4 8))

(car x)
(cdr x)