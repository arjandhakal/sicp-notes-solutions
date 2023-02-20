#lang sicp
(#%require rackunit)
(#%require racket/trace)

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
         (else (find-divisor
                n
                (next test-divisor)))))

(define (next test-divisor)
  (if (= test-divisor 2)
      3
      (+ test-divisor 2)))

(define (divides? a b)
  (= (remainder b a) 0))

(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))

; test cases
(check-eq? (smallest-divisor 5) 5)
(check-eq? (smallest-divisor 8) 2)
(check-eq? (smallest-divisor 15) 3)

(define (prime? n)
  (= n (smallest-divisor n)))

; to find 2^5 mod 3 , you would call (expmod 2 5 3)
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))


(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n)
         (fast-prime? n (- times 1)))
        (else false)))


;Exercise 1.22
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 1)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " ** ")
  (display elapsed-time))

;(search-for-primes start end)
;Number Number -> void
;checks for prime between two range
(define (search-for-primes start end)
  (cond
    ((> start end) (newline) (display "done"))
    ((even? start) (search-for-primes (+ start 1) end))
    (else
     (timed-prime-test start)
       (search-for-primes (+ start 1) end))              
  ))
  
