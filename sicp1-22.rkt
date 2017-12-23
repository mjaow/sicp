#lang planet neil/sicp

(define (smallest-divisor n)
  (define (square x)
    (* x x))
  (define (find-divisor base)
    (cond ((> (square base) n) n)
          ((= (remainder n base) 0) base)
          (else (find-divisor (inc base)))))
  (find-divisor 2))

(define (prime? x)
  (= (smallest-divisor x) x))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n) (report-prime (- (runtime) start-time))))

(define (report-prime cost-time)
  (display " *** ")
  (display cost-time))

(define (find-prime-beyond n)
  (define (find-prime-beyond-times-timed x t)
    (timed-prime-test x)
    (find-prime-beyond-times (inc x) (dec t)))
  (define (find-prime-beyond-times x t)
    (cond ((> t 0)
           (if (prime? x)
               (find-prime-beyond-times-timed x t)
               (find-prime-beyond-times (inc x) t)))))
  (find-prime-beyond-times n 3))


(find-prime-beyond 100)
(newline)
(find-prime-beyond 1000)
(newline)
(find-prime-beyond 10000)
(newline)
(find-prime-beyond 100000)
(newline)
(find-prime-beyond 1000000)
(newline)
(find-prime-beyond 10000000)