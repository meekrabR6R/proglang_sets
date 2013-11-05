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
(define (string-append-map xs suffix) (list "this" "is" "false"))