#lang planet neil/sicp

(define (square x)
  (* x x))

(define (expmod base n m)
  (define (exp base n)
    (cond ((= n 0) 1)
          ((even? n) (square (exp base (/ n 2))))
          (else (* base (exp base (dec n))))))
  (remainder (exp base n) m))

(define (fast-expmod base exp m)
  (cond ((= exp 0) 1)
         ((even? exp) (remainder (square (fast-expmod base (/ exp 2) m)) m))
         (else (remainder (* base (fast-expmod base (- exp 1) m)) m))))

;(expmod 99999972 1000000000 1000000000)  ;对大数求幂，性能非常差
;(fast-expmod 99999972 1000000000 1000000000)  ;基于如下事实：A*B MOD N = (A MOD N)*(B MOD N) MOD N，将大数规约为小数，性能优异