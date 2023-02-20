#lang scheme


; Exercise 1.15
; Q1 -> procedure p is applied 5 times, that is until 12.15 is reduced to 0.049999999999999996
; Q2 -> It is logarithmic to (a) 
(define (cube x) (* x x x))
(define (p x) (- (* 3 x)) (* 4 (cube x)))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

