#lang planet neil/sicp

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment x y)
  (cons x y))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (square x)
  (* x x))

(define (length-of-segment x)
  (let ((s (start-segment x))
        (e (end-segment x)))
    (sqrt (+ (square (- (x-point s)
                        (x-point e)))
             (square (- (y-point s)
                        (y-point e)))))))

(define (make-rectangle-v1 long-side wide-side)
  (cons long-side wide-side))

(define (long-side x)
  (car (car x)))
(define (wide-side x)
  (cdr (cdr x)))

(define (make-rectangle-v2 l1 l2 w1 w2)
  (cons (cons l1 l2)
        (cons w1 w2)))

(define (length-of-rectangle x)
  (length-of-segment (long-side x)))

(define (width-of-rectangle x)
  (length-of-segment (wide-side x)))

(define (circumference r)
  (define (double x)
    (* 2 x))
  (double (+ (length-of-rectangle r)
             (width-of-rectangle r))))

(define (area r)
  (* (length-of-rectangle r)
     (width-of-rectangle r)))

(define p1 (make-point 0 0))
(define p2 (make-point 5 0))
(define p3 (make-point 0 4))
(define p4 (make-point 5 4))
(define s1 (make-segment p1 p2))
(define s2 (make-segment p1 p3))
(define s3 (make-segment p3 p4))
(define s4 (make-segment p2 p4))
(define r1 (make-rectangle-v2 s1 s3 s2 s4))
(circumference r1)
(area r1)