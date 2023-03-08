#lang sicp
(#%require rackunit)

(define (square x)
  (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (inc x) (+ x 1))
(define (identity x) x)

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



(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (relative-prime? a b)
  (if (= (gcd a b) 1)
      #true
      #false)
  )




(check-eq? (relative-prime? 2 3) #true)
(check-eq? (relative-prime? 3 4) #true)
(check-eq? (relative-prime? 4 8) #false)


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

;Exercise 1.33.2
; Procedure to calculate product of all the positive integers less than n
; that are relatively prime to n
(define (product-relative-prime n)
  (filter-accumulate * 1 identity 1 inc n
                     (lambda (x) (relative-prime? x n))
                     ))



