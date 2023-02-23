#lang sicp
(#%require rackunit)

(define THRESHOLD 0.00000000001)

; This procedure captures
; the essence of summation
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (inc n) (+ n 1))
(define (cube x) (* x x x))

(define (sum-cubes a b)
  (sum cube a inc b))

;test for sum-cubes
(check-eq? (sum-cubes 2 3) 35)
(check-eq? (sum-cubes 2 4) 99)



(define (identity x) x)

(define (sum-integers a b)
  (sum identity a inc b))

;test for sum-integers
(check-eq? (sum-integers 1 10) 55)


(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

;test for pi-sum
;pi-sum from 1 to 1000 should be equal to pi/8
(< (abs (- (* 8 (pi-sum 1 1000)) 3.139592655589783)) THRESHOLD)



; Using sum as a building block in formulating further concepts
; such as calculating definite integral of a function f between
; the limits a and b

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* dx
     (sum f (+ a (/ dx 2.0)) add-dx b)))

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)