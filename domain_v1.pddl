(define (domain v1_d)

    (:requirements
        :strips :typing :negative-preconditions :disjunctive-preconditions
    )
    (:types
        course elective program term num1 num2 - objects
        cisc cogs sode stat math elec cmpe psyc - course 
        comma ai biocomp cs soft - program
        cisc_200_level cisc_300_level cisc_400_level cisc_400_level_year cisc_year - cisc
        cogs_200_level - cogs
    )
    (:constants 
        ; numbers
        s0 s1 s2 s3 s4 s5 - num2        ; represent number of courses
        
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
        (course-counts ?n1 - num1 ?n2 - num2)
        (mutual-exclusive ?c1 ?c2 - courses) 

    )



    (:action add_course_without_prerequisites
        :parameters (?c1 - course ?t - term ?s1 ?s2 - num2 ?n1 - num1)
        :precondition 
        (and
            (course-counts ?n1 ?s1)
            (succ2 ?s1 ?s2)
            (not (course-counts ?n1 s5))
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
            (not (course-counts ?n1 ?s1))
            (course-counts ?n1 ?s2)
        )
    )
    (:action add_course_with_prerequisites
        :parameters (?c1 ?c2 - course ?t - term ?s1 ?s2 - num2 ?n1 - num1)
        :precondition 
        (and 
            (course-counts ?n1 ?s1)
            (succ2 ?s1 ?s2)
            (not (course-counts ?n1 s5))
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
            (not (course-counts ?n1 ?s1))
            (course-counts ?n1 ?s2)
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
        :parameters (?t1 ?t2 - term ?n1 ?n2 - num1 ?s - num2)
        :precondition 
        (and 
            (current ?t1)
            (or
                (course-counts ?n1 s5)
                (course-counts ?n1 s4)
                (course-counts ?n1 s3)
            )
            (next ?t1 ?t2)
            (succ1 ?n1 ?n2)
        )
        :effect 
        (and 
            (not (current ?t1))
            (current ?t2)
            (course-counts ?n2 s0)
        )
    )    
)





