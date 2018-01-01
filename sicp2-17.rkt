#lang planet neil/sicp

(define s (list 23 72 149 34))
(define empty (list))

;only work for no empty list
(define (last-pair items)
  (if (null? (cdr items))
      (car items)
      (last-pair (cdr items))))

(last-pair s)