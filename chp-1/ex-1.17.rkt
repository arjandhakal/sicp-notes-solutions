#lang scheme
(require rackunit)


;Exercise 1.17
(define (mul a b)
  (cond
    ((= b 0) 0)
    ((even? b)
         (double (mul a (halve b))))
        (else (+ a (mul a (- b 1))))
      ))



(define (double x) (* 2 x))
(define (halve x) (/ x 2))

(check-eq? (mul 2 8) (* 2 8))
(check-eq? (mul 123 893) (* 123 893))
(check-eq? (mul 0 3) 0)



      
      