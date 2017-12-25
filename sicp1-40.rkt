#lang planet neil/sicp

(define (deriv g)
  (let ((dx 0.00001))
    (lambda (x) (/ (- (g (+ x dx)) (g x)) dx))))

(define (newtons-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

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

(define (newtons-method g guess)
  (fixed-point (newtons-transform g) guess))

(define (cubic a b c)
  (define (cube x)
    (* x x x))
  (define (square x)
    (* x x))
  (lambda (x)
    (+ (cube x)
       (* a (square x))
       (* b x)
       c)))

(newtons-method (cubic 3 2 1) 1)
(newtons-method (cubic 2 5 5) 1)