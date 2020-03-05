;#lang racket

(define (sum list)
    (cond
        [(null? list) 0]
        [(null? (cdr list)) (car list)]
        [else (+ (car list) (sum (cdr list)))]
    )
)
