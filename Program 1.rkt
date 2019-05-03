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

(define gen-ranged-list
  (lambda (a b)
    (let f ((L '()) (x (get-next-in-form a)))
      (cond ((> x b) L)
            (else (f (append L (list x)) (get-next-in-form (+ x 1))))))))

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
  (lambda (a b)
    (map (lambda x (append x (find-roots (car x)))) (gen-ranged-list a b))))

(define get-file
  (let ((p (open-input-file "primes4np1")))
    (let f ((x (read p)))
      (if (eof-object? x)
          (begin
            (close-input-port p)
            '())
          (cons x (f (read p)))))))

(let ((f get-file))
  (display (list-with-roots (car f) (car (cdr f)))))

