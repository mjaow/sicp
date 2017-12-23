#lang planet neil/sicp

;递归
(define (accumulate combiner null-value term a next b)
  (define (accumlate-inner a)
    (if (> a b)
        null-value
        (combiner (term a)
                  (accumlate-inner (next a)))))
  (accumlate-inner a))

;迭代
(define (accumulate-iter combiner null-value term a next b)
  (define (accumulate-inner a rs)
    (if (> a b)
        rs
        (accumulate-inner (next a) (combiner rs (term a)))))
  (accumulate-inner a null-value))

(define (current a) a)

(define (sum a b)
  (accumulate-iter + 0 current a inc b))

(define (product a b)
  (accumulate-iter * 1 current a inc b))

(sum 1 1000)
(product 1 1000)