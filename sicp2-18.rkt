#lang planet neil/sicp

(define s (list 1 4 9 16 25))
(define one (list 3))

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

(define (reverse items)
  (define (reverse-with-result items rs)
    (if (null? items)
        rs
        (reverse-with-result (cdr items) (cons (car items) rs))))
  (reverse-with-result items '()))

(print-list s)
(print-list (reverse s))
(print-list (reverse '()))
(print-list (reverse one))
(print-list (reverse (list 1 2 3 4 5)))