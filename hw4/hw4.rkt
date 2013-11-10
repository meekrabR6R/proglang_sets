#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; Problem 1
(define (sequence low high stride)
  (define (seq-helper x xs)
    (if (> x high) 
        xs
        (seq-helper (+ x stride) (cons x xs))))
  (reverse (seq-helper low null)))

;; Problem 2
(define (string-append-map xs suffix)
  (map (lambda (s) (string-append s suffix)) xs))

;; Problem 3
(define (list-nth-mod xs n)
  (cond [(< n 0) (error "list-nth-mod: negative number")]
        [(empty? xs) (error "list-nth-mod: empty list")]
        [#t (car (list-tail xs (remainder n (length xs))))]))

;; Problem 4
(define (stream-for-n-steps s n)
  (letrec ([f (lambda (stream curr-list curr-count)
                (let ([pr (stream)])
                  (if (= curr-count n)
                      (cons (car pr) curr-list)
                      (f (cdr pr) (cons (car pr) curr-list) (+ 1 curr-count)))))])
    (reverse (f s (list ) 1))))

;; Problem 5
(define funny-number-stream 
  (letrec ([f (lambda (n) 
               (cond [(= 0 (modulo (+ 1 n) 5)) (cons n (lambda () (f (* -1 (+ 1 n)))))]
                     [(< n 0) (cons n (lambda () (f (- 1 n))))]
                     [#t (cons n (lambda () (f (+ 1 n))))]))])
  (lambda () (f 1))))
  
;; Problem 6
(define dan-then-dog
  (letrec ([f (lambda (d)
               (if(string=? "dog.jpg" d) 
                  (cons d (lambda () (f "dan.jpg")))
                  (cons d (lambda () (f "dog.jpg")))))])
    (lambda () (f "dan.jpg"))))

;; Problem 7
(define (stream-add-zero s)
  (lambda () (cons (cons 0 (car(s))) (stream-add-zero (cdr (s))))))

;; Problem 8
(define (cycle-lists xs ys)
  (letrec ([f (lambda (n)
                (cons ( cons (list-nth-mod xs n)
                             (list-nth-mod ys n))
                 (lambda () (f (+ 1 n)))))])
    (lambda () (f 0))))

;; Problem 9
(define (vector-assoc v vec)
  (letrec ([f (lambda (n)
                (if (= (vector-length vec) n)
                    #f
                    (let ([curr-v (vector-ref vec n)])
                      (cond [(not(pair? curr-v)) (f (+ n 1))]
                            [(equal? (car curr-v) v) curr-v]
                            [#t (f (+ n 1))]))))])
    (f 0)))
                