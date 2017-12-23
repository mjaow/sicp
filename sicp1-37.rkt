#lang planet neil/sicp

;递归
(define (cont-frac n d k)
  (define (cont-frac-inner n d i k)
    (if (= i k)
        (/ (n k) (d k))
        (/ (n i) (+ (d i) (cont-frac-inner n d (inc i) k)))))
  (cont-frac-inner n d 1 k))

;迭代
(define (cont-frac-iter n d k)
  (define (cont-frac-inner n d k rs)
    (if (= k 0)
        rs
        (cont-frac-inner n d (dec k) (/ (n k) (+ (d k) rs)))))
  (cont-frac-inner n d k 0))

(define (golden-radio f n)
  (+ 1 (f (lambda (i) 1.0) (lambda (i) 1.0) n)))

(define max 100)
(golden-radio cont-frac max)
(golden-radio cont-frac-iter max)