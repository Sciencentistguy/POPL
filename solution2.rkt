;#lang racket

(define (a-game number)
    (if (and (>= number 2) (<= number 30))
        (display "Please run the randomnum function\n")
        (error "Invalid deposit")
    )
    (define (randomnum random)
        (define random_number (random 2 51))
        (if (<= number random_number)
            (display "You have lost. Here's your prize: £-2!")
            (display "You have won! Congratulation! Here's your prize: £1!")
        )
    )
    (define (decreasemoney)
        (display "Your old balance was: £")
        (display number)
        (set! number (- number 2))
        (display ".\nYour new balance is: £")
        (display number)
        (display "\n")
        (if (<= number 2)
            (display "You haven't got enough money. You need to top-up.")
            (display "You can keep playing!")
        )
    )
    (define (topup t)
        (if (<= (+ number t) 30)
            (begin
              (display "You have topped up by £")
              (display t)
              (set! number (+ number t))
              (display ".\nYour new balance is £")
              (display number)
              (display ".\n")
            )
            (begin
                (display "That is an invalid amount to top up by")
            )
        )
    )
    (define (the-game-number request)
        (cond
            [(equal? request 'randomnum) randomnum]
            [(equal? request 'increasemoney) (display "increasemoney")]
            [(equal? request 'decreasemoney) decreasemoney]
            [(equal? request 'topup) topup]
            [else (error "Invalid request")]
        )
    )
    the-game-number
)
