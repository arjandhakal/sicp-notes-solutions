#lang sicp


(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (inc n)
  (+ n 1))

(define (cube x) (* x x x))

;Exercise 1.29
;Simpson's Rule
(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (apply-rule k)
    (cond ((= k 0) (f a))
          ((= k n) (f (+ a (* k h))))
          ((even? k) (* 2 (f (+ a (* k h)))))
          (else (* 4 (f (+ a (* k h)))))))
  (/ (* h
        (sum apply-rule 0 inc n))
     3.0))
  

(integral cube 0 1 100)
(integral cube 0 1 1000)

