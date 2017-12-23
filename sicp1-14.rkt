#lang planet neil/sicp

(define (count-change amount)
  (define (cc amount kind-of-coins)
    (cond ((= kind-of-coins 0) 0)
          ((= amount 0) 1)
          ((< amount 0) 0)
          (else (+ (cc amount (- kind-of-coins 1))
                   (cc (- amount (find-coins-amount kind-of-coins)) kind-of-coins)))))
  (define (find-coins-amount kind)
    (cond ((= kind 1) 1)
          ((= kind 2) 5)
          ((= kind 3) 10)
          ((= kind 4) 25)
          ((= kind 5) 50)))
  (cc amount 5))

(count-change 11)

;(cc 11 5)
;(+ (cc 11 4) (cc (- 11 50) 5))
;(+ (+ (cc 11 3) (cc (- 11 25) 4)) 0)
;(+ (+ (+ (cc 11 2) (cc (-11 10) 3)) 0) 0)
;(+ (+ (+ (+ (cc 11 1) (cc (- 11 5) 2)) 0) 0) 0)
;...