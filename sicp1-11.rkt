#lang planet neil/sicp

;递归
(define (f n)
  (define (apply f delta)
    (* delta (f (- n delta))))
  (if (< n 3)
      n
      (+ (apply f 1)
         (apply f 2)
         (apply f 3))))

;迭代
(define (better-f n)
  (define (f-iter x y z i n)
    (if (= i n)
        x
        (f-iter y z (+ (* 3 x) (* 2 y) z) (inc i) n)))
  (f-iter 0 1 2 0 n))

(f 1)
(f 2)
(f 3)
(f 4)
(f 5)
(f 6)
(f 7)
(f 8)

(better-f 1)
(better-f 2)
(better-f 3)
(better-f 4)
(better-f 5)
(better-f 6)
(better-f 7)
(better-f 8)