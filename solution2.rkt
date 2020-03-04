;#lang racket

(define (a-game number)
    (if (and (>= number 2) (<= number 30))
        (display "random") ; Run random function once its written
        (error "Invalid deposit")
    )
)
