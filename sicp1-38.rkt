#lang planet neil/sicp

;递归
(define (cont-frac n d k)
  (define (cont-frac-inner n d i k)
    (if (= i k)
        (/ (n k) (d k))
        (/ (n i) (+ (d i) (cont-frac-inner n d (inc i) k)))))
  (cont-frac-inner n d 1 k))

(define (euler n)
  (define (is-divided x y)
    (= (remainder x y) 0))
  (+ 2 (cont-frac (lambda (x) 1.0)
                  (lambda (x)
                    (if (is-divided (inc x) 3.0)
                        (* 2 (/ (inc x) 3.0))
                        1.0))
                  n)))

(define (loop-euler n)
  (define (loop-inner i n)
    (if (<= i n)
        (let ((rs (euler i)))
          (display i)
          (display "===>")
          (display rs)
          (newline)
          (loop-inner (inc i) n))))
  (loop-inner 1 n))

(loop-euler 10)