#lang scheme

(define THRESHOLD  0.0000001)

(define (cube-iter  prev-guess guess x)
  (if (good-enough? prev-guess guess x)
      guess
      (cube-iter guess (improve guess x) x)))

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3.0))


(define (good-enough? prev-guess guess x)
 (or (< (abs (- prev-guess guess))  THRESHOLD)
     (< (abs (- (cube guess) x)) THRESHOLD)))
    

(define (cube-root x)
  (cube-iter 0 1 x))

(define (cube x) (* x x x))
(define (square x) (* x x))