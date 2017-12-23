#lang planet neil/sicp

(define (pasca-triangle x y)
  (cond ((or (= x 1) (= y 1) (= x y)) 1)
        (else (+ (pasca-triangle (- x 1) (- y 1))
                 (pasca-triangle x (- y 1))))))

(pasca-triangle 3 5)