#lang planet neil/sicp

(define (abs-of-diff x y)
  (cond ((< x y) (- y x))
        (else (- x y))))

(define (close-enough x y)
  (< (abs-of-diff x y) 0.00001))

(define (square x)
  (* x x))

(define (avg x y)
  (/ (+ x y) 2.0))

(define (guess-better guess x)
  (avg guess (/ x guess)))

(define (good-enough guess x)
  (close-enough (square guess) x))

(define (sqrt-with-guess guess x)
  (new-if (good-enough guess x)
       guess
       (sqrt-with-guess (guess-better guess x) x)))

(define (sqrt x)
  (sqrt-with-guess 1.0 x))

(define (new-if predict stat1 stat2)
  (cond (predict stat1)
        (else stat2)))

(sqrt 3.0)

;采用牛顿法求平方根，使用自定义new-if代替if，会出现无限递归，因为系统会将new-if当成普通函数，对参数求值，然后展开。
;从而使得在sqrt-with-guess展开的时候，无限递归，无法结束
