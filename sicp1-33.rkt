#lang planet neil/sicp

(define (prime? x)
  (define (smallest-divisor n)
    (define (square x)
      (* x x))
    (define (find-divisor base)
      (cond ((> (square base) n) n)
            ((= (remainder n base) 0) base)
            (else (find-divisor (inc base)))))
    (find-divisor 2))
  (= (smallest-divisor x) x))

(define (filtered-accumulate combiner null-value term a next b filter)
  (define (filtered-accumulate-inner a)
    (cond ((> a b) null-value)
          ((filter term a b) (combiner (term a)
                                       (filtered-accumulate-inner (next a))))
          (else (combiner null-value (filtered-accumulate-inner (next a))))))
  (filtered-accumulate-inner a))

(define (current a) a)
(define (square a) (* a a))
(define (is-odd term a b)
  (odd? (term a)))
(define (is-even term a b)
  (even? (term a)))

(define (rel-prime term a b)
  (define val-a (term a))
  (define val-b (term b))
  (define (gcd x y)
    (if (= y 0)
        x
        (gcd y (remainder x y))))
  (and (< val-a val-b) (= 1 (gcd val-a val-b))))

(define (is-prime term a b)
  (prime? (term a)))

(define (odd-sum a b)
  (filtered-accumulate + 0 current a inc b is-odd))
(define (even-sum a b)
  (filtered-accumulate + 0 current a inc b is-even))

(define (odd-square-sum a b)
  (filtered-accumulate + 0 square a inc b is-odd))
(define (even-square-sum a b)
  (filtered-accumulate + 0 square a inc b is-even))

(define (prime-sum a b)
  (filtered-accumulate + 0 current a inc b is-prime))

(define (rel-prime-product a b)
  (filtered-accumulate * 1 current a inc b rel-prime))

(odd-sum 1 10)
(even-sum 1 10)
(odd-square-sum 1 10)
(even-square-sum 1 10)
(prime-sum 1 10)
(rel-prime-product 1 10)
