#lang R5RS

(define prime?
  (lambda (n)
    (cond ((or (eq? 2 n) (eq? 3 n)) #t)
          ((or (< n 2) (eq? 0 (remainder n 2))) #f)
          (else (let f ((i 2))
                  (cond ((>= i (/ n 2)) #t)
                        ((eq? (remainder n i) 0) #f)
                        (else (f (+ i 1)))))))))

(define in-form?
  (lambda (n)
    (if (eq? 0 (remainder (- n 1) 4))
        #t #f)))

(define get-next-in-form
  (lambda (n)
    (cond ((and (in-form? n) (prime? n)) n)
          (else (get-next-in-form (+ n 1))))))

(define get-num-list
  (lambda (n)
    (let f ((i 0) (L '()) (x (get-next-in-form 4)))
      (cond ((>= i n) L)
            (else (f (+ i 1) (append L (list x)) (get-next-in-form (+ x 1))))))))

(define find-roots
  (lambda (n)
    (define roots
      (lambda (i j)
        (let ((ttl (+ (* i i) (* j j))))
          (cond ((eq? ttl n) (list i j))
                ((> ttl n) (roots (+ i 1) 1))
                (else (roots i (+ j 1)))))))
    (roots 1 1)))

(define list-with-roots
  (lambda (n)
    (map (lambda x (append x (find-roots (car x)))) (get-num-list n))))
