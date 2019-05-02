#lang R5RS

(define length
  (lambda (L)
    (cond ((null? L) 0)
          (else (+ 1 (length (cdr L)))))))

(define prime?
  (lambda (n)
    (cond ((or (eq? 2 n) (eq? 3 n)) #t)
          ((or (< n 2) (eq? 0 (remainder n 2))) #f)
          (else (let F ((i 2))
                  (cond ((>= i (/ n 2)) #t)
                        ((eq? (remainder n i) 0) #f)
                        (else (f (+ i 1)))))))))
