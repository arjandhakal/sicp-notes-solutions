#lang scheme

(define (square x) (* x x))

(define (sum-of-squares x y )
  (+ (square x) (square y)))

; Exercise 1.2 
(/
 (+ 5 4 (+ 2
           (- 3 (+ 6 (/ 4 5)))))
 (* 3
    (- 6 2)
    (- 2 7)))


; Exercise 1.3
(define (large-add a b c)
  (cond
    [(or (>= a b) (>= a c))
     (if (>= b c)
         (sum-of-squares a b)
         (sum-of-squares a c))]
    [(or (>= b a) (>= b c))
     (if (>= a c)
         (sum-of-squares a b)
         (sum-of-squares b c))]
    [(or (>= c a) (>= c b))
     (if (>= a b)
         (sum-of-squares a c)
         (sum-of-squares b c))]))


; Exercise 1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))


;Example 1.1.7
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y )
  (/ (+ x y ) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1 x))


