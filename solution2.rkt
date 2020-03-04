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
    (define (randomnum random)
        (define random_number (random 2 51))
        (if (<= number random_number)
            (display "You have lost. Here's your prize: £-2!")
            (display "You have won! Congratulation! Here's your prize: £1!")
        )
    )
    the-game-number
)
