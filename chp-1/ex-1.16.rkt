#lang scheme
(require rackunit)
(require racket/trace)

; Exercise 1.16
(define (fast-expt b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b n a)
  (cond ((= n 0)
         a)
        ((even? n)
         (fast-expt-iter (* b b) (/ n 2) a))
        (else
         (fast-expt-iter b (- n 1) (* a b)))))
       


(check-eq? (fast-expt 2 8) 256)
(check-eq? (fast-expt 4 0) 1)
(check-eq? (fast-expt 4 1) 4)

(trace fast-expt-iter)
(fast-expt-iter 2 8 1)