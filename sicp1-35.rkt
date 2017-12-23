#lang planet neil/sicp

(define (fixed-point f first-guess)
  (define (abs x)
    (if (< x 0)
        (- x)
        x))
  (define (close-enough x y)
    (let ((tolerance 0.00001))
      (< (abs (- x y)) tolerance)))
  (let ((next-guess (f first-guess)))
    (if (close-enough first-guess next-guess)
        next-guess
        (fixed-point f next-guess))))

(define (sqrt x)
  (define (average x y)
    (/ (+ x y) 2))
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))

(define (golden-section)
  (fixed-point (lambda (y) (+ 1 (/ 1 y))) 1.0))

(sqrt 2)
(sqrt 3)
(sqrt 4)
(golden-section)