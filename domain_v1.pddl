(define (domain v1_d)

    (:requirements
        :strips :typing :negative-preconditions
    )
    (:types
        course elective program term - objects
        cisc cogs sode stat math - course 
        comma ai biocomp cs soft - program
    )
    (:constants )

    (:predicates
        (prerequisites ?c1 ?c2 - course)
        (double-prerequisites ?c1 ?c2 ?c3 - course)
        (taken ?c - course ?t - term)
        (succ ?e1 ?e2 - elective)
        (next ?t1 ?t2 - term)
        (current ?t - term)

    )
    (:action add_course_with_prerequisites
        :parameters (?c1 ?c2 - course ?t - term)
        :precondition 
        (and 
            (current ?t)
            (prerequisites ?c1 ?c2)
            (exists (?t1 - term)
                (taken ?c1 ?t1)
            )
            (forall (?t1 - term) 
                (not (taken ?c2 ?t1))
            ) 
        )       
        :effect (and
            (taken ?c2 ?t)
        )
    )
    (:action add_course_without_prerequisites
        :parameters (?c1 - course ?t - term)
        :precondition 
        (and
            (current ?t)
            (forall (?c - course)
                (not (prerequisites ?c ?c1))
            )
            (forall (?t1 - term)
                (not (taken ?c1 ?t1))
            )   
        )
        :effect 
        (and 
            (taken ?c1 ?t)
        )
    )
    (:action next_term
        :parameters (?t1 ?t2 - term)
        :precondition 
        (and 
            (current ?t1)
            (next ?t1 ?t2)
        )
        :effect 
        (and 
            (not (current ?t1))
            (current ?t2)
        )
    )    
)



