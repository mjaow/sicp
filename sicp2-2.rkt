#lang planet neil/sicp

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment x y)
  (cons x y))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (midpoint-segment s)
  (define (average x y)
    (/ (+ x y) 2.0))
  (define sp (start-segment s))
  (define ep (end-segment s))
  (make-point (average (x-point sp)
                       (x-point ep))
              (average (y-point sp)
                       (y-point ep))))

(define p1 (make-point 3 3))
(define p2 (make-point 10 10))
(print-point p1)
(print-point p2)
(define s1 (make-segment p1 p2))
(print-point (midpoint-segment s1))