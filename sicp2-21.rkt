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

(define (square x)
  (* x x))

(define (square-list-v1 items)
  (if (null? items)
      '()
      (cons (square (car items))
            (square-list-v1 (cdr items)))))

(define (square-list-v2 items)
  (map square items))

(print-list (square-list-v1 (list 1 2 3 4)))
(print-list (square-list-v2 (list 1 2 3 4)))