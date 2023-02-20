#lang scheme
(require rackunit)
(require racket/trace)


;Exercise 1.18
(define (mul a b)
  (mul-iter a b 0)
  )

(define (mul-iter a b s)
  (cond
    ((= b 0) s)
    ((even? b) (mul-iter (double a) (halve b) s))
    (else (mul-iter a (- b 1) (+ s a)))))


(define (double x) (* 2 x))
(define (halve x) (/ x 2))

(check-eq? (mul 2 8) (* 2 8))
(check-eq? (mul 123 893) (* 123 893))
(check-eq? (mul 0 3) 0)

(trace mul-iter)
(mul-iter 3 4 0)