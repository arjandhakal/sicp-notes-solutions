#lang scheme

(define (new-if predicate
                then-clause
                else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)

(new-if (= 1 1) 0 5)

; So, if Alysssa uses this new-if in the square root funciton,
; well as the parameeters are evaluated before being substituted,
; the sqrt-iter function will be called indifinetly , which is
; well pretty bad, isn't it.