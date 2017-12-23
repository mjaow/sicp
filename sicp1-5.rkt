#lang planet neil/sicp

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

;应用序：展开后立刻求值，导致计算(p)时出现无限递归，无法结束
;正则序：展开到底，然后需要的时候求值，根据结果决定是否立马返回