#lang scheme
(require rackunit)
(require racket/trace)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))