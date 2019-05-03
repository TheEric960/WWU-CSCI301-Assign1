#lang R5RS

(define length
  (lambda (L)
    (cond ((null? L) 0)
          (else (+ 1 (length (cdr L)))))))

(define prime?
  (lambda (n)
    (cond ((or (eq? 2 n) (eq? 3 n)) #t)
          ((or (< n 2) (eq? 0 (remainder n 2))) #f)
          (else (let f ((i 2))
                  (cond ((>= i (/ n 2)) #t)
                        ((eq? (remainder n i) 0) #f)
                        (else (f (+ i 1)))))))))

(define inForm?
  (lambda (n)
    (if (eq? 0 (remainder (- n 1) 4))
        #t #f)))

(define getNextInForm
  (lambda (n)
    (cond ((and (inForm? n) (prime? n)) n)
          (else (getNextInForm (+ n 1))))))

(define getNumList
  (lambda (n)
    (let f ((i 0) (L '()) (x (getNextInForm 4)))
      (cond ((>= i n) L)
            (else (f (+ i 1) (append L (list x)) (getNextInForm (+ x 1))))))))

(define findRoots
  (lambda (n)
    (define roots
      (lambda (i j)
        (let ((ttl (+ (* i i) (* j j))))
          (cond ((eq? ttl n) (list i j))
                ((> ttl n) (roots (+ i 1) 1))
                (else (roots i (+ j 1)))))))
    (roots 1 1)))

(define listWithRoots
  (lambda (n)
    (map (lambda x (append x (findRoots (car x)))) (getNumList n))))
