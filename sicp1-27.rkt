#lang planet neil/sicp

(define (expmod base exp m)
  (define (square x)
    (* x x))
  (cond ((= exp 0) 1)
         ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
         (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (carmichael-test x)
  (define (have-try a)
    (= (expmod a x x) a))
  (define (fermat-test n)
    (cond ((= n 1) true)
          (else (and (have-try n) (fermat-test (dec n))))))
  (fermat-test (dec x)))

;check Carmichael numbers
(carmichael-test 561)
(carmichael-test 1105)
(carmichael-test 1729)
(carmichael-test 2465)
(carmichael-test 2821)
(carmichael-test 6601)