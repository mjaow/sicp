#lang planet neil/sicp

(define (tan-cf x k)
  (define (square i)
    (* i i))
  (define (f i)
    (if (= i 1)
        x
        (square x)))
  (define (tan-cf-inner x i k)
    (define r (- (* 2.0 i) 1))
    (if (= i k)
        (/ (f i) r)
        (/ (f i) (- r (tan-cf-inner x (inc i) k)))))
  (tan-cf-inner x 1 k))

(tan 10)
(tan-cf 10 100)
(tan 25)
(tan-cf 25 100)