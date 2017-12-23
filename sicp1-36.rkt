#lang planet neil/sicp

(define (fixed-point f first-guess count)
  (define (abs x)
    (if (< x 0)
        (- x)
        x))
  (define (close-enough x y)
    (let ((tolerance 0.00001))
      (< (abs (- x y)) tolerance)))
  (define (display-count x count)
    (display x)
    (display "\t===>\t")
    (display count)
    (newline))
  (display-count first-guess count)
  (let ((next-guess (f first-guess)))
    (if (close-enough first-guess next-guess)
        next-guess
        (fixed-point f next-guess (inc count)))))

(define (average x y)
  (/ (+ x y) 2))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0 1) ;34步

(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2.0 1) ;平均阻尼法，9步