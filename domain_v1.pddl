(define (domain v1_d)

    (:requirements
        :strips :typing :negative-preconditions :disjunctive-preconditions :conditional-effects
    )
    (:types
        course program term num1 num2 - objects
        cisc cogs stat math  - course 
    )
    (:constants 
        ; numbers：represent number of courses
        s0 s1 s2 s3 s4 s5 - num2        
    )

    (:predicates
        (prerequisites ?c1 ?c2 - course)
        ; (double-prerequisites ?c1 ?c2 ?c3 - course)
        ; (triple-prerequisites ?c1 ?c2 ?c3 ?c4 - course)
        ; (quad-prerequisites ?c1 ?c2 ?c3 ?c4 ?c5 - course)
        (taken ?c - course)
        (taking ?c - course)
        (succ1 ?n1 ?n2 - num1)
        (succ2 ?s1 ?s2 - num2)
        (next ?t1 ?t2 - term)
        (current ?n - num1)
        (current-term ?t - term)
        (course-counts ?n - num1 ?s - num2)
        (mutual-exclusive ?c1 ?c2 - courses) 

    )
    
    (:action add_course_without_prerequisites ; v1 complete
        :parameters 
        (
            ?c - course
            ?t - term
            ?n - num1
            ?s1 ?s2 - num2
        )
        :precondition 
        (and
            (current-term ?t)
            (current ?n)
            (succ2 ?s1 ?s2)
            (course-counts ?n ?s1)

            (not (taken ?c)) ; the added course has not been taken in any terms
            (not (taking ?c)) ; the added course has not been taking in the current term
            (not (exists (?cx - course) (prerequisites ?cx ?c))) ; the course does not reuqire any prerequisites
        )
        :effect 
        (and 
            (taking ?c)
            (not (course-counts ?n ?s1))
            (course-counts ?n ?s2)
        )
    )

    (:action add_course_with_prerequisites
        :parameters (?c1 ?c2 - course ?t - term ?s1 ?s2 - num2 ?n - num1)
        :precondition 
        (and 
            (current-term ?t)
            (current ?n)
            (succ2 ?s1 ?s2)
            (course-counts ?n ?s1)

            (prerequisites ?c1 ?c2)
            (not (taken ?c2)) ; the added course has not been taken in any terms
            (not (taking ?c2)) ; the added course has not been taking in the current term
            (taken ?c1) ; the prerequisites has been taken at some term (nextline eliminates the current term)
            (not (taking ?c1)) ; can not take the course and its prerequisites in the same term
 
        )       
        :effect (and
            (taking ?c2)
            (not (course-counts ?n ?s1))
            (course-counts ?n ?s2)

        )
    )
  
    (:action next_term ; term transition
        :parameters (?t1 ?t2 - term ?n1 ?n2 - num1 ?s - num2)
        :precondition 
        (and 
            (course-counts ?n1 ?s)
            (or
                (course-counts ?n1 s5)
            )
            (current ?n1)
            (current-term ?t1)
            (succ1 ?n1 ?n2)
            (next ?t1 ?t2)
        )
        :effect 
        (and 
            ; (not (course-counts ?n1 ?s))
            (course-counts ?n2 s0)
            (not (current ?n1))
            (current ?n2)
            (not (current-term ?t1))
            (current-term ?t2)

            (forall (?cx - course) ; mark all the taking course to be taken
                (when 
                    (taking ?cx) 
                    (and
                        (not (taking ?cx))
                        (taken ?cx)    
                    )
                )
            )
        )
    )    
)