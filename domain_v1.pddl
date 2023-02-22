(define (domain v1_d)

    (:requirements
        :strips :typing :negative-preconditions :disjunctive-preconditions
    )
    (:types
        course elective program term num1 num2 - objects
        cisc cogs sode stat math elec cmpe psyc - course 
        comma ai biocomp cs soft - program
    )
    (:constants 
        ;n40 - num1
        s0 s1 s2 s3 s4 s5 - num2

    )

    (:predicates
        (prerequisites ?c1 ?c2 - course)
        ; (double-prerequisites ?c1 ?c2 ?c3 - course)
        ; (triple-prerequisites ?c1 ?c2 ?c3 ?c4 - course)
        ; (quad-prerequisites ?c1 ?c2 ?c3 ?c4 ?c5 - course)
        (taken ?c - course ?t - term)
        (succ1 ?n1 ?n2 - num1)
        (succ2 ?s1 ?s2 - num2)
        (next ?t1 ?t2 - term)
        (current ?t - term)
        (credit ?n - num1)
        (course-limits ?t - term ?n - num2) 

    )



    (:action add_course_without_prerequisites
        :parameters (?c1 - course ?t - term ?n1 ?n2 - num1 ?s1 ?s2 - num2)
        :precondition 
        (and
            (credit ?n1)
            (succ1 ?n1 ?n2)
            (course-limits ?t ?s1)
            (succ2 ?s1 ?s2)
            (not (course-limits ?t s5))
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
            (not (credit ?n1))
            (credit ?n2)
            (not (course-limits ?t ?s1))
            (course-limits ?t ?s2)
        )
    )
    (:action add_course_with_prerequisites
        :parameters (?c1 ?c2 - course ?t - term ?n1 ?n2 - num1 ?s1 ?s2 - num2)
        :precondition 
        (and 
            (credit ?n1)
            (succ1 ?n1 ?n2)
            (course-limits ?t ?s1)
            (succ2 ?s1 ?s2)
            (not (course-limits ?t s5))
            (current ?t)
            (prerequisites ?c1 ?c2)
            (not (taken ?c1 ?t))
            (exists (?t1 - term)
                (taken ?c1 ?t1)
            )
            (forall (?t1 - term) 
                (not (taken ?c2 ?t1))
            ) 
        )       
        :effect (and
            (taken ?c2 ?t)
            (not (credit ?n1))
            (credit ?n2)
            (not (course-limits ?t ?s1))
            (course-limits ?t ?s2)
        )
    )
    ; (:action add_course_with_double_prerequisites
    ;     :parameters (?c1 ?c2 ?c3 - course ?t - term)
    ;     :precondition 
    ;     (and 
    ;         (current ?t)
    ;         (double-prerequisites ?c1 ?c2 ?c3)
    ;         (exists (?t1 - term)
    ;             (taken ?c1 ?t1)
    ;         )
    ;         (exists (?t1 - term)
    ;             (taken ?c2 ?t1)
    ;         )
    ;         (forall (?t1 - term) 
    ;             (not (taken ?c3 ?t1))
    ;         ) 
    ;     )       
    ;     :effect (and
    ;         (taken ?c3 ?t)
    ;     )
    ; )
    ; (:action add_course_with_triple_prerequisites
    ;     :parameters (?c1 ?c2 ?c3 ?c4 - course ?t - term)
    ;     :precondition 
    ;     (and 
    ;         (current ?t)
    ;         (triple-prerequisites ?c1 ?c2 ?c3 ?c4)
    ;         (exists (?t1 - term)
    ;             (taken ?c1 ?t1)
    ;         )
    ;         (exists (?t1 - term)
    ;             (taken ?c2 ?t1)
    ;         )
    ;         (exists (?t1 - term)
    ;             (taken ?c3 ?t1)
    ;         )
    ;         (forall (?t1 - term) 
    ;             (not (taken ?c4 ?t1))
    ;         ) 
    ;     )       
    ;     :effect (and
    ;         (taken ?c4 ?t)
    ;     )
    ; )
    ; (:action add_course_with_quad_prerequisites
    ;     :parameters (?c1 ?c2 ?c3 ?c4 ?c5 - course ?t - term)
    ;     :precondition 
    ;     (and 
    ;         (current ?t)
    ;         (quad-prerequisites ?c1 ?c2 ?c3 ?c4 ?c5)
    ;         (exists (?t1 - term)
    ;             (taken ?c1 ?t1)
    ;         )
    ;         (exists (?t1 - term)
    ;             (taken ?c2 ?t1)
    ;         )
    ;         (exists (?t1 - term)
    ;             (taken ?c3 ?t1)
    ;         )
    ;         (exists (?t1 - term)
    ;             (taken ?c4 ?t1)
    ;         )
    ;         (forall (?t1 - term) 
    ;             (not (taken ?c5 ?t1))
    ;         ) 
    ;     )       
    ;     :effect (and
    ;         (taken ?c5 ?t)
    ;     )
    ; )
    (:action next_term
        :parameters (?t1 ?t2 - term)
        :precondition 
        (and 
            (current ?t1)
            (or
                (course-limits ?t1 s5)
                (course-limits ?t1 s4)
                (course-limits ?t1 s3)
            )
            (next ?t1 ?t2)
        )
        :effect 
        (and 
            (not (current ?t1))
            (current ?t2)
            (course-limits ?t2 s0)
        )
    )    
)






