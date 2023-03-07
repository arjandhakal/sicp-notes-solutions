#lang sicp
(#%require rackunit)

(define (square x)
  (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (inc x) (+ x 1))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor
               n
               (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))



; Exercise 1.33
(define (filter-accumulate combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a) (filter-accumulate combiner null-value term (next a) next b filter))
          (filter-accumulate combiner null-value term (next a) next b filter))))


; Exercise 1.33.1
; Procedure to calculate the sums of the squares of the prime number
; in the interval a to b
(define (sum-squares-prime a b)
  (filter-accumulate + 0 square a inc b prime?))

(check-eq? (sum-squares-prime 1 20) 1028)
(check-eq? (sum-squares-prime 2 20) 1027)



