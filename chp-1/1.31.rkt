#lang sicp
(#%require rackunit)


; Exercise 1.31
; exercise 1
(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))


(define (inc x) (+ 1 x))
(define (identity x) x)


(define (factorial n)
(product identity 1 inc n))

(check-eq? (factorial 1) 1)
(check-eq? (factorial 2) 2)
(check-eq? (factorial 3) 6)
(check-eq? (factorial 4) 24)


; function to calculate an approximation to pi,
; higher the value of n, the more closer the output is to pi
(define (almost-pi n)
  (define (term-pi k)
    (/ (* (- k 1) (+ k 1))
       (* k k)))
  (define (next-pi k)
    (+ k 2))
  (* 4.0 (product term-pi 3 next-pi n)))


; Rewriting the product procedure iteratively
(define (product-i term a next b)
  (define (iter-helper a result)
    (if (> a b)
        result
        (iter-helper (next a)
                     (* result (term a)))))
  (iter-helper a 1))

; Factorial function written with the new product function
(define (factorial-i n)
(product-i identity 1 inc n))


(check-eq? (factorial-i 1) 1)
(check-eq? (factorial-i 2) 2)
(check-eq? (factorial-i 3) 6)
(check-eq? (factorial-i 4) 24)