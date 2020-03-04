;#lang racket

(define (a-game number)
    (if (and (>= number 2) (<= number 30))
        (display "random") ; Run random function once its written
        (error "Invalid deposit")
    )
    (define (the-game-number request)
        (cond
            [(equal? request 'randomnum) 
             (display "randomnum")
            ]
            [(equal? request 'increasemoney) 
                (display "increasemoney")
            ]
            [(equal? request 'decreasemoney)
                (display "decreasemoney")
            ]
            [(equal? request 'topup)
                (display "topup")
            ]
            [else (error "Invalid request")]
        )
    )
    the-game-number
)
