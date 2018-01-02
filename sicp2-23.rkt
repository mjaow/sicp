#lang planet neil/sicp

(define (not-null? val)
  (not (null? val)))

(define (for-each-v1 proc items)
  (cond ((not-null? items)
         (proc (car items))
         (for-each-v1 proc (cdr items)))))

(for-each-v1 (lambda (x) (newline) (display x))
          (list 57 321 88))