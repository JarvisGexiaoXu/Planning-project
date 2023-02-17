(define (domain v1_d)

    (:requirements
        :strips :typing
    )
    (:types
        course major mandatory elective program - objects
        cisc cogs sode stat math - major 
        comma ai biocomp cs soft - program
    )
    (:constants )

    (:predicates
        (prerequisites ?c1 - course ?c2 - course)
    )

    (:action add

    )
    
    (:action check-for-graduate

    )



)


