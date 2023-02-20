#lang scheme

; linear recursive process
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

; iterative process
(define (expt-2 b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b
                 (- counter 1)
                 (* product b))))


(define (fast-expt b n)
  (cond ((= n 0)
         1)
        ((even? n)
         (square (fast-expt b (/ n 2))))
        (else
         (* b (fast-expt b (- n 1))))))
          

(define square (lambda (x) (* x x)))