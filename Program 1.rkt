#lang R5RS

(define getLen
  (lambda (L) (cardinality 0 L)))

(define cardinality
  (lambda (n L)
    (cond ((null? L) 0)
          ((null? (cdr L)) (+ n 1))
          (else (cardinality (+ n 1) (cdr L))))))
