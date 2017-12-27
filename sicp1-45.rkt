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

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      (lambda (x) (f x))
      (compose f (repeated f (dec n)))))

(define (average-damp f)
  (define (average x y)
    (/ (+ x y) 2))
  (lambda (x) (average x (f x))))

(define (power x n)
  (if (= n 0)
      1
      (* x (power x (dec n)))))

(define (average-dump-times n)
    (define (average-dump-times-inner n i)
      (if (> (* 2 i) n)
          0
          (inc (average-dump-times-inner n (* 2 i)))))
  (average-dump-times-inner n 1))

(define (sqrt x n)
  (define f
    (lambda (y)
      (/ x (power y (dec n)))))
  (fixed-point ((repeated average-damp (average-dump-times n)) f) 1.0))

;1次平均阻尼
(sqrt (power 2 2) 2)
(sqrt (power 2 3) 3)

;2次平均阻尼
(sqrt (power 2 4) 4)
(sqrt (power 2 7) 7)

;3次平均阻尼
(sqrt (power 2 8) 8)
(sqrt (power 2 15) 15)

;4次平均阻尼
(sqrt (power 2 16) 16)

(sqrt (power 2 33) 33)
