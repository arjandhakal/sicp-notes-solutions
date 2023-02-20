#lang scheme
(require rackunit)


; recursive process
(define (f n)
  (cond
    ((< n 3) n)
    (else (+ (f (- n 1))
             (* 2 (f (- n 2)))
             (* 3 (f (- n 3)))))))

(check-eq? (f 0) 0)
(check-eq? (f 1) 1)
(check-eq? (f 2) 2)
(check-eq? (f 3) 4)
(check-eq? (f 4) 11)


; iterative process
(define (f-2 n)
  (cond ((< n 3)  n)
        (else (f-iter 0 1 2 (- n 3)))))

; Iterative function for f 
;x = f(n-3), y = f(n-2) z = f(n-1)
(define (f-iter x y z count) 
  (if (< count 0)
      z
      (f-iter y z (+ z (* 2 y) (* 3 x)) (- count 1) )))
       


(check-eq? (f-2 0) 0)
(check-eq? (f-2 1) 1)
(check-eq? (f-2 2) 2)
(check-eq? (f-2 3) 4)
(check-eq? (f-2 4) 11)


; Pascal's Triangle
; Row Col -> Number
; Gives the number in row and col of pascal's triangle
(define (pt row col)
  (cond ((= col 0) 1)
        ((= col row) 1)
        (else (+
               (pt (- row 1) (- col 1))
               (pt (- row 1) col)))))

(check-eq? (pt 0 0) 1)
(check-eq? (pt 1 0) 1)
(check-eq? (pt 1 1) 1)
(check-eq? (pt 2 1) 2)
(check-eq? (pt 3 1) 3)
(check-eq? (pt 4 1) 4)
(check-eq? (pt 4 2) 6)