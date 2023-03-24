;Header and description

(define (domain v25_d)

    (:requirements :conditional-effects :negative-preconditions :equality :adl :non-deterministic)
    (:types
        course program term num1 num2 - object
        cisc cogs stat math elec psyc - course 
        
    )
    (:predicates
        (no-prerequisites ?c - course)
        (prerequisites ?c1 ?c2 - course)
        (double-prerequisites ?c1 ?c2 ?c3 - course)
        (triple-prerequisites ?c1 ?c2 ?c3 ?c4 - course)
        (quad-prerequisites ?c1 ?c2 ?c3 ?c4 ?c5 - course)
        (taken ?c - course)
        (taking ?c - course)
        (succ1 ?n1 ?n2 - num1)
        (succ2 ?s1 ?s2 - num2)
        (next ?t1 ?t2 - term)
        (current ?n - num1)
        (current-term ?t - term)
        (course-counts ?n - num1 ?s - num2)
        
        (complete-AI-stream)
        (complete-AI-core)
        (complete-AI-option-A)
        (complete-AI-option-B)
        (complete-AI-supporting)
        (AI-core ?c - course)
        (AI-core-A ?c1 ?c2 - course)
        (AI-core-B ?c1 ?c2 - course)
        (AI-core-C ?c1 ?c2 ?c3 ?c4 ?c5 - course)
        (AI-core-D ?c1 ?c2 - course)
        (AI-core-E ?c1 ?c2 ?c3 - course)
        (AI-core-F ?c1 - course)
        (AI-core-G ?c1 ?c2 ?c3 - course)
        (AI-option-A ?c1 ?c2 ?c3 - course)
        (AI-option-B ?c1 ?c2  - course)        
        (AI-supporting-A ?c1 ?c2 ?c3 ?c4 - course)
    (AI-supporting-B ?c1 ?c2 ?c3 ?c4 - course)
        (capstone-course ?c - course)
        (capstone-taken)

        (available ?c - course ?n - num1)
        (unavailable ?c - course ?n - num1)
        (mutual-exclusive ?c1 - course)

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
            (no-prerequisites ?c)
            ; (forall (?cx - course) (not (prerequisites ?cx ?c))) ; the course does not reuqire any prerequisites
            ; (forall (?cx1 ?cx2 - course) (not (double-prerequisites ?cx1 ?cx2 ?c)))
            ; (forall (?cx1 ?cx2 ?cx3 - course) (not (triple-prerequisites ?cx1 ?cx2 ?cx3 ?c)))
            ; (forall (?cx1 ?cx2 ?cx3 ?cx4 - course) (not (quad-prerequisites ?cx1 ?cx2 ?cx3 ?cx4 ?c)))
            (available ?c ?n)
            
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
            (available ?c2 ?n)
        )       
        :effect (and
            (taking ?c2)
            (not (course-counts ?n ?s1))
            (course-counts ?n ?s2)

        )
    )

    (:action add_course_with_double_prerequisites
        :parameters (?c1 ?c2 ?c3 - course ?t - term ?s1 ?s2 - num2 ?n - num1)
        :precondition 
        (and 
            (current-term ?t)
            (current ?n)
            (succ2 ?s1 ?s2)
            (course-counts ?n ?s1)
            (double-prerequisites ?c1 ?c2 ?c3)
            (not (taken ?c3)) ; the added course has not been taken in any terms
            (not (taking ?c3)) ; the added course has not been taking in the current term
            (taken ?c1)
            (taken ?c2) ; the prerequisites has been taken at some term (nextline eliminates the current term)
            (not (taking ?c1)) ; can not take the course and its prerequisites in the same term
            (not (taking ?c2))
            (available ?c3 ?n)
        )       
        :effect (and
            (taking ?c3)
            (not (course-counts ?n ?s1))
            (course-counts ?n ?s2)
        )
    )

    (:action add_course_with_triple_prerequisites
        :parameters (?c1 ?c2 ?c3 ?c4 - course ?t - term ?s1 ?s2 - num2 ?n - num1)
        :precondition 
        (and 
            (current-term ?t)
            (current ?n)
            (succ2 ?s1 ?s2)
            (course-counts ?n ?s1)
            (triple-prerequisites ?c1 ?c2 ?c3 ?c4)
            (not (taken ?c4)) ; the added course has not been taken in any terms
            (not (taking ?c4)) ; the added course has not been taking in the current term
            (taken ?c1) ; the prerequisites has been taken at some term (nextline eliminates the current term)
            (taken ?c2)
            (taken ?c3) 
            (not (taking ?c1)) ; can not take the course and its prerequisites in the same term
            (not (taking ?c2))
            (not (taking ?c3))
            (available ?c4 ?n)        
        )       
        :effect (and
            (taking ?c4)
            (not (course-counts ?n ?s1))
            (course-counts ?n ?s2)
        )
    )
    
    (:action add_course_with_quad_prerequisites
        :parameters (?c1 ?c2 ?c3 ?c4 ?c5 - course ?t - term ?s1 ?s2 - num2 ?n - num1)
        :precondition 
        (and 
            (current-term ?t)
            (current ?n)
            (succ2 ?s1 ?s2)
            (course-counts ?n ?s1)
            (quad-prerequisites ?c1 ?c2 ?c3 ?c4 ?c5)
            (not (taken ?c5)) ; the added course has not been taken in any terms
            (not (taking ?c5)) ; the added course has not been taking in the current term
            (taken ?c1) ; the prerequisites has been taken at some term (nextline eliminates the current term)
            (taken ?c2)
            (taken ?c3) 
            (taken ?c4)
            (not (taking ?c1)) ; can not take the course and its prerequisites in the same term
            (not (taking ?c2))
            (not (taking ?c3))
            (not (taking ?c4))
            (available ?c5 ?n)
        )       
        :effect (and
            (taking ?c5)
            (not (course-counts ?n ?s1))
            (course-counts ?n ?s2)
        )
    )

    (:action availability-capstone
        :parameters (?c - course ?n - num1)
        :precondition 
        (and 
            (current ?n)
            (capstone-course ?c)
            (course-counts n4 s5)
            (not (available ?c ?n))
            (not (unavailable ?c ?n))
        )
        :effect 
        (and 
            (available ?c ?n)    
        )
    )
    

    (:action availability-mutual-exclusive-init-n1
        :parameters (?c - course) 
        :precondition 
        (and 
            (current n1)
            (mutual-exclusive ?c)
            (not (available ?c n1))
            (not (unavailable ?c n1))
            (not (capstone-course ?c))
        )
        :effect 
        (oneof
            (available ?c n1)
            (unavailable ?c n1)
        )
    )
    (:action availability-mutual-exclusive
        :parameters (?c - course ?n1 ?n2 - num1) 
        :precondition 
        (and 
            (current ?n2)
            (succ1 ?n1 ?n2)
            (mutual-exclusive ?c)
            (not (available ?c ?n2))
            (not (unavailable ?c ?n2))
        )
        :effect 
        (and
            (when (unavailable ?c ?n1) (available ?c ?n2))
            (when (available ?c ?n1) (unavailable ?c ?n2))
        )
    )
    
    (:action availability-regular
        :parameters (?c - course ?n - num1)
        :precondition 
        (and 
            (not (mutual-exclusive ?c))
            (current ?n)
            (not (capstone-course ?c))
            (not (available ?c ?n))
            (not (unavailable ?c ?n))
        )
        :effect 
        (and
            (available ?c ?n)
        )
    )
  
    (:action next_term ; term transition
        :parameters (?t1 ?t2 - term ?n1 ?n2 - num1 ?s - num2)
        :precondition 
        (and 
            (course-counts ?n1 s5)
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
                (and
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

    ; actions to check AI stream completeness
    (:action check_AI_core
        :parameters 
        (
            ?c1 ?c2 ?c3 ?c4 ?c5 ?c6 - course
            ?c7 ?c8 ?c9 ?c10 ?c11 ?c12 - course
            ?c13 ?c14 ?c15 ?c16 ?c17 ?c18 - course
        )
        :precondition 
        (and 
            (AI-core-A ?c1 ?c2)
            (AI-core-B ?c3 ?c4)
            (AI-core-C ?c5 ?c6 ?c7 ?c8 ?c9)
            (AI-core-D ?c10 ?c11)
            (AI-core-E ?c12 ?c13 ?c14)
            (AI-core-F ?c15)
            (AI-core-G ?c16 ?c17 ?c18)
            (taken ?c1)
            (taken ?c2)
            (or
                (taken ?c3)
                (taken ?c4)
            )
            (taken ?c5)
            (taken ?c6)
            (taken ?c7)
            (taken ?c8)
            (taken ?c9)
            (or
                (taken ?c10)
                (taken ?c11)
            )
            (taken ?c12)
            (taken ?c13)
            (taken ?c14)
            (taken ?c15)
            (or
                (taken ?c16)
                (taken ?c17)
                (taken ?c18)
            )
        )
        :effect 
        (and 
            (complete-AI-core)
        )
    )

    ; (:action check_AI_option_B_first
    ;     :parameters 
    ;     (
    ;         ?c - course
    ;     )
    ;     :precondition 
    ;     (and 
    ;         (AI-option-B ?c)
    ;         (taken ?c)
    ;         (not (AI-option_2 ?c))
    ;     )
    ;     :effect 
    ;     (and 
    ;         (AI-option_1 ?c)
    ;     )
    ; )

    ; (:action check_AI_option_B_second
    ;     :parameters 
    ;     (
    ;         ?c - course
    ;     )
    ;     :precondition 
    ;     (and 
    ;         (AI-option-B ?c)
    ;         (taken ?c)
    ;         (not (AI-option_1 ?c))
    ;     )
    ;     :effect 
    ;     (and 
    ;         (AI-option_2 ?c)
    ;     )
    ; )
    
    (:action check_AI_option_A
        :parameters 
        (
            ?c1 ?c2 ?c3 - course
        )
        :precondition 
        (and 
            (AI-option-A ?c1 ?c2 ?c3)
            (taken ?c1)
            (taken ?c2)
            (taken ?c3)
        )
        :effect 
        (and 
            (complete-AI-option-A)
        )
    )
    (:action check_AI_option_B
        :parameters 
        (
        )
        :precondition 
        (and 
            (exists 
                (?c1 ?c2 - course)
                (and
                    (taken ?c1)
                    (taken ?c2)
                    (AI-option-B ?c1 ?c2)    
                )  
            )
        )
        :effect 
        (and 
            (complete-AI-option-B)
        )
    )

    (:action check_AI_supporting
        :parameters 
        (
            ?c1 ?c2 ?c3 ?c4 - course
            ?c5 ?c6 ?c7 ?c8 - course
        )
        :precondition 
        (and 
            (AI-supporting-A ?c1 ?c2 ?c3 ?c4)
            (AI-supporting-B ?c5 ?c6 ?c7 ?c8)
            (or
                (and
                    (taken ?c1)
                    (taken ?c2)
                )
                (and
                    (taken ?c1)
                    (taken ?c3)
                )
                (taken ?c4)
            )
            (or
                (taken ?c5)
                (taken ?c6)
                (and 
                    (taken ?c7)
                    (taken ?c8)
                )
            )
        )
        :effect 
        (and 
            (complete-AI-supporting)
        )
    )
    (:action check_capstone
        :parameters (?c - course)
        :precondition 
        (and 
            (capstone-course ?c)
            (taken ?c)
        )
        :effect 
        (and 
            (capstone-taken)
        )
    )
    
    (:action check_AI_complete
        :parameters ()
        :precondition 
        (and 
            (complete-AI-core)
            ; (complete-AI-option-A)
            ; (complete-AI-option-B)
            (complete-AI-supporting)
            (capstone-taken)
        )
        :effect 
        (and 
            (complete-AI-stream)
        )
    )   

)
