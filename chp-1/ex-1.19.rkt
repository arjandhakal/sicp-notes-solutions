#lang scheme
(require rackunit)
(require racket/trace)

; Exercise 1.19
(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0)
         b)
        ((even? count)
         (fib-iter a b
                   (+ (* p p) (* q q))
                   (+ (* 2 q p) (* q q))
                   (/ count 2)))
        (else
         (fib-iter (+ (* b q)
                      (* a q)
                      (* a p))
                   (+ (* b p)
                      (* a q))
                   p
                   q
                   (- count 1)))))

(check-eq? (fib 0) 0)
(check-eq? (fib 1) 1)
(check-eq? (fib 2) 1)
(check-eq? (fib 3) 2)
(check-eq? (fib 4) 3)
(check-eq? (fib 5) 5)
(check-eq? (fib 6) 8)

(trace fib-iter)
(fib-iter 1 0 0 1 100)
