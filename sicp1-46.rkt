#lang planet neil/sicp

(define (iterative-improve good-enough improve)
  (lambda (x)
    (if (good-enough x)
        x
        ((iterative-improve good-enough improve) (improve x)))))

(define (fixed-point f first-guess)
  ((iterative-improve (lambda (x) (< (abs (- x (f x))) 0.00001))
                     (lambda (x) (f x))) first-guess))

(define (sqrt x)
  (define (average a b)
    (/ (+ a b) 2))
  (define (square x)
    (* x x))
  ((iterative-improve (lambda (y) (< (abs (- x (square y))) 0.00001))
                     (lambda (y) (average y (/ x y)))) 1.0))

(sqrt 2)
(sqrt 3)
(sqrt 4)
(sqrt 9)
(newline)

(define (golden-section)
  (fixed-point (lambda (y) (+ 1 (/ 1 y))) 1.0))
(define (sqrt-with-fixed-point x)
  (define (average x y)
    (/ (+ x y) 2))
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))
(golden-section)
(sqrt-with-fixed-point 2)
(sqrt-with-fixed-point 3)
(sqrt-with-fixed-point 4)
(sqrt-with-fixed-point 9)