#lang sicp
(#%require rackunit)


; Good old linear recursion 
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))



; Exercise 1.30
; Iterative process for the same sum method
(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))




; CHECKING OUR SOLUTIION

(define (inc n) (+ n 1))
(define (cube x) (* x x x))

(define (sum-cubes a b)
  (sum cube a inc b))

(define (sum-cubes-iter a b)
  (sum-iter cube a inc b))


; testing if both sum method give the same result
(check-eq? (sum-cubes 2 3) (sum-cubes-iter 2 3))
(check-eq? (sum-cubes 2 4) (sum-cubes-iter 2 4))

