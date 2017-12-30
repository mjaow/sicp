#lang planet neil/sicp

(define (make-rat x y)
  (let ((g (gcd x y)))
    (let ((n (/ x g))
          (d (/ y g)))
      (if (< d 0)
          (cons (- n) (- d))
          (cons n d)))))

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))

(define (gcd x y)
    (if (= y 0)
        x
        (gcd y (remainder x y))))

(define (neg x)
    (- 0 x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))


(define one-half (make-rat 1 2))

(define one-third (make-rat 1 3))

(numer one-half)
(denom one-half)
(numer one-third)
(denom one-third)

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (numer y) (denom x))))

(define (eq-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(print-rat (add-rat one-half one-third))
(print-rat (sub-rat one-half one-third))
(print-rat (sub-rat one-third one-half))
(print-rat (mul-rat one-half one-third))
(print-rat (div-rat one-half one-third))
(eq-rat? (mul-rat one-half one-third) (sub-rat one-half one-third))
(print-rat (add-rat one-third one-third))
(print-rat (div-rat one-third one-third))
(print-rat (make-rat -1 -6))
(print-rat (make-rat -8 6))
(print-rat (make-rat 8 -6))