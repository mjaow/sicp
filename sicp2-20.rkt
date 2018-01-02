#lang planet neil/sicp

(define (print-list items)
  (define (print-list-only items)
    (if (not (null? items))
        ((lambda (x)
          (display (car x))
          (display " ")
          (print-list-only (cdr x))) items)))
  (display "(")
  (print-list-only items)
  (display ")")
  (newline))

(define (check-odd-or-even x)
  (if (odd? x)
      odd?
      even?))

(define (same-parity x . y)
  (filter-list (cons x y) (check-odd-or-even x)))

(define (filter-list items filter)
  (cond ((null? items) '())
        ((filter (car items)) (cons (car items) (filter-list (cdr items) filter)))
        (else (filter-list (cdr items) filter))))

(print-list (same-parity 1 2 3 4 5 6 7))
(print-list (same-parity 2 3 4 5 6 7))
(print-list (filter-list (list 1 0 2 0 3 0) zero?))