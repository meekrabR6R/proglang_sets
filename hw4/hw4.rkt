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
  (letrec ([f(lambda (n) (cons n (lambda () (f (+ n 1)))))])
  (lambda () (f 1))))
  