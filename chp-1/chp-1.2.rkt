#lang scheme
 (require rackunit)


; factorial procedure that
; computes the factorial in
; a recursive process
(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))


; factorial procedure that
; computes the factorial
; in a iterative process
(define (factorial-2 n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter
       (* product counter)
       (+ counter 1)
       max-count)))



;Exercise 1.9
; This is a recursive process
; there will be "a" inc function deferred
; once it fully expands
; "b" will be increased by 1 for "a" times by the inc function
; and we get the result

; plus Number Number -> Number


(define (plus a b)
  (if (= a 0)
      b
      (inc (plus (dec a) b))))

(define (inc n)
  (+ n 1))

(define (dec n)
  (- n 1))

(check-eq? (plus 2 3) 5)
(check-eq? (plus 5 5) 10)
(check-eq? (plus 0 3) 3)
(check-eq? (plus 3 0) 3)




;This is an iterative process
; in each procedure call
; a will be decrease by 1
; and b will increase by 1
; this will happen "a" times
; and we get the output
(define (plus-1 a b)
  (if (= a 0)
      b
      (plus-1 (dec a) (inc b))))

(check-eq? (plus-1 2 3) 5)
(check-eq? (plus-1 5 5) 10)
(check-eq? (plus-1 0 3) 3)
(check-eq? (plus-1 3 0) 3)


;Exercise 1.10
; Value of (A 10) => 1024
; Value of (A 2 4) => 65536
; Value of (A 3 3)=> 65536
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; This function will double the n
(define (f n) (A 0 n))

; This funciton will give 2^n
(define (g n) (A 1 n))

