#lang planet neil/sicp

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10)

;(A 0 (A 1 9))
;(A 0 (A 0 (A 1 8)))
;(A 0 (A 0 (A 0 (A 1 7))))
;(A 0 (A 0 (A 0 (A 0 (A 1 6)))))
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2^1)))))))))
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2^2))))))))
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2^3)))))))
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2^4))))))
;(A 0 (A 0 (A 0 (A 0 (A 0 2^5)))))
;(A 0 (A 0 (A 0 (A 0 2^6))))
;(A 0 (A 0 (A 0 2^7)))
;(A 0 (A 0 2^8))
;(A 0 2^9)
;2^10=1024

(A 2 4)
;(A 1 (A 2 3))
;(A 1 (A 1 (A 2 2)))
;(A 1 (A 1 (A 1 (A 2 1))))
;(A 1 (A 1 (A 1 2)))
;(A 1 (A 1 4))
;(A 1 16)
;2^16=65536
;(2^2^2^2^2)

(A 3 3)
;(A 2 (A 3 2))
;(A 2 (A 2 (A 3 1)))
;(A 2 (A 2 2))
;(A 2 16)
;!

;f=2n
;g=2^n
;h=2^(2^2^2....)  ;括号内n个2
;k=5n^2