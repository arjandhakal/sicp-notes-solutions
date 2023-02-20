#lang scheme

(define THRESHOLD  0.0000001)

(define (sqrt-iter  prev-guess guess x)
  (if (good-enough? prev-guess guess x)
      guess
      (sqrt-iter guess (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y )
  (/ (+ x y ) 2.0))


(define (good-enough? prev-guess guess x)
 (or (< (abs (- prev-guess guess))  THRESHOLD)
     (< (abs (- (square guess) x)) THRESHOLD)))
    

(define (sqrt x)
  (sqrt-iter 0 1 x))

(define (square x) (* x x))