;#lang racket

(define (sum list)
    (cond
        [(null? list) 0]
        [(null? (cdr list)) (car list)]
        [else (+ (car list) (sum (cdr list)))]
    )
)

(define (desc? list) 
    (cond
        [(null? (cdr (cdr list))) 
            (> (car list) (car (cdr list)))
        ]
        [(> (car list) (car (cdr list)))
            (desc? (cdr list))
        ]
        [else #f]
    )
)
