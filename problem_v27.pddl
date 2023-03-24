(define (problem v27_p)
    (:domain v27_d)
    (:objects 
        ; courses
        cisc_101 cisc_110 cisc_121 cisc_102 cisc_124 cisc_151 cisc_181 cisc_251 - cisc
        cisc_203 cisc_204 cisc_220 cisc_221 cisc_223 cisc_226 cisc_235 cisc_271 cisc_282 - cisc
        cisc_320 cisc_322 cisc_324 cisc_325 cisc_326 cisc_327 cisc_330 cisc_332 cisc_335 - cisc
        cisc_340 cisc_351 cisc_352 cisc_360 cisc_365 cisc_371 cisc_372 - cisc
        cisc_422 cisc_423 cisc_425 cisc_426 cisc_432 cisc_434 cisc_437 cisc_447 cisc_448 - cisc
        cisc_451 cisc_454 cisc_457 cisc_458 cisc_462 cisc_465 - cisc
        cisc_466 cisc_468 cisc_471 cisc_472 cisc_486 cisc_490 cisc_491 - cisc
        cisc_492 - cisc
        cmpe_327 - cisc   
        cisc_452 cisc_453 cisc_455 cisc_467 cisc_473 cisc_474 - cisc
        cogs_100 cogs_201 cogs_300 cogs_400 cogs_499 - cogs
        stat_263 stat_any - stat
        math_110 math_111 math_112 math_120 math_121 math_126 math_123 math_124 - math
        cisc_497 cisc_496 cisc_498 cisc_499 cisc_500 - cisc
        elec_278 - elec
        psyc_100 psyc_202 psyc_221 - psyc
        ; numbers：represent number of terms
        n1 n2 n3 n4 n5 n6 n7 n8 - num1 
        ; numbers：represent number of courses
        s0 s1 s2 s3 s4 s5 - num2   
    )

    (:init

        (succ1 n1 n2)   (succ1 n2 n3)   (succ1 n3 n4)   (succ1 n4 n5)   (succ1 n5 n6)   (succ1 n6 n7)   (succ1 n7 n8)

        (succ2 s0 s1)   (succ2 s1 s2)   (succ2 s2 s3)   (succ2 s3 s4)   (succ2 s4 s5)

        (no-prerequisites cisc_121) (no-prerequisites cisc_101) (no-prerequisites cisc_110) (no-prerequisites cisc_102)
        (no-prerequisites cisc_151) (no-prerequisites cisc_181) (no-prerequisites cisc_251) (no-prerequisites cogs_100)
        (no-prerequisites stat_263) (no-prerequisites stat_any) (no-prerequisites math_110) (no-prerequisites math_111)
        (no-prerequisites math_112) (no-prerequisites math_120) (no-prerequisites math_121) (no-prerequisites math_126)
        (no-prerequisites math_123) (no-prerequisites math_124) (no-prerequisites cisc_500)
        (no-prerequisites cisc_490) (no-prerequisites cisc_491) (no-prerequisites cisc_492) (no-prerequisites cmpe_327)
        (no-prerequisites elec_278) (no-prerequisites psyc_100) (no-prerequisites psyc_202) (no-prerequisites psyc_221) 


        (prerequisites cisc_121 cisc_124)   (prerequisites cisc_121 cisc_220)   (prerequisites cisc_124 cisc_221)   (prerequisites cisc_124 cisc_226)
        (prerequisites cisc_124 cisc_282)   (prerequisites cisc_235 cisc_320)   (prerequisites cisc_324 cisc_335)   (prerequisites cisc_221 cisc_340)
        (prerequisites cisc_235 cisc_352)   (prerequisites cisc_223 cisc_422)   (prerequisites cisc_325 cisc_425)   (prerequisites cisc_324 cisc_434)
        (prerequisites cisc_327 cisc_448)   (prerequisites cmpe_327 cisc_448)   (prerequisites cisc_235 cisc_452)   (prerequisites cisc_332 cisc_451) 
        (prerequisites cisc_351 cisc_451)   (prerequisites cisc_372 cisc_451)   (prerequisites cisc_352 cisc_453)   (prerequisites cisc_223 cisc_462)   
        (prerequisites cisc_365 cisc_466)   (prerequisites cisc_204 cisc_467)   (prerequisites cisc_330 cisc_472)   (prerequisites cisc_352 cisc_474)
        (prerequisites cisc_371 cisc_473)   (prerequisites cisc_486 cisc_496)   (prerequisites cisc_352 cisc_497)   (prerequisites cisc_365 cisc_497)
        (prerequisites cisc_365 cisc_499)   (prerequisites cisc_352 cogs_499)   (prerequisites cisc_365 cogs_499)   (prerequisites cisc_235 cogs_400)
        (prerequisites elec_278 cogs_400)   (prerequisites cogs_100 cogs_201)   (prerequisites psyc_100 cogs_201)

        (double-prerequisites cisc_121 cisc_102 cisc_203)   (double-prerequisites cisc_121 math_110 cisc_203)   (double-prerequisites cisc_121 cisc_102 cisc_204)
        (double-prerequisites cisc_121 math_110 cisc_204)   (double-prerequisites cisc_124 cisc_204 cisc_223)     
        (double-prerequisites cisc_124 cisc_203 cisc_235)   (double-prerequisites cisc_235 cisc_223 cisc_322)   (double-prerequisites cisc_221 cisc_235 cisc_324)
        (double-prerequisites cisc_124 cisc_235 cisc_325)   (double-prerequisites cisc_223 cisc_235 cisc_326)   (double-prerequisites cisc_220 cisc_124 cisc_327)   
        (double-prerequisites cisc_121 cisc_271 cisc_330)   (double-prerequisites cisc_102 cisc_124 cisc_332)   (double-prerequisites cisc_124 cisc_204 cisc_360)
        (double-prerequisites cisc_251 stat_any cisc_351)   (double-prerequisites cisc_271 stat_263 cisc_371)   (double-prerequisites cisc_271 stat_any cisc_371)
        (double-prerequisites cisc_271 stat_any cisc_372)   (double-prerequisites cisc_223 cisc_235 cisc_423)   (double-prerequisites cisc_327 cisc_324 cisc_426)
        (double-prerequisites cisc_235 cisc_332 cisc_432)   (double-prerequisites cisc_324 cisc_327 cisc_437)   (double-prerequisites cisc_324 cisc_335 cisc_447)
        (double-prerequisites cisc_235 math_110 cisc_454)   (double-prerequisites cisc_235 math_111 cisc_454)   (double-prerequisites cisc_235 cisc_335 cisc_468)
        (double-prerequisites cisc_235 math_112 cisc_454)   (double-prerequisites cisc_365 stat_263 cisc_455)   (double-prerequisites cisc_365 cisc_352 cisc_471)
        (double-prerequisites cisc_271 cisc_352 cisc_473)   (double-prerequisites cogs_201 psyc_202 cogs_300)   (double-prerequisites cogs_201 stat_any cogs_300)
        (double-prerequisites psyc_221 psyc_202 cogs_300)   (double-prerequisites psyc_221 stat_any cogs_300)   (double-prerequisites cisc_322 cisc_325 cisc_498)
        (double-prerequisites cisc_322 cisc_327 cisc_498)   (double-prerequisites cisc_326 cisc_325 cisc_498)   (double-prerequisites cisc_326 cisc_327 cisc_498)
        
        (triple-prerequisites cisc_203 cisc_204 cisc_235 cisc_365)  (triple-prerequisites cisc_121 cisc_223 cisc_221 cisc_458) 
        (triple-prerequisites cisc_204 cisc_360 cisc_223 cisc_465)  
        (triple-prerequisites math_110 math_120 cisc_124 cisc_457)  (triple-prerequisites math_111 math_120 cisc_124 cisc_457) 
        (triple-prerequisites math_112 math_120 cisc_124 cisc_457)  (triple-prerequisites math_110 math_121 cisc_124 cisc_457) 
        (triple-prerequisites math_111 math_121 cisc_124 cisc_457)  (triple-prerequisites math_112 math_121 cisc_124 cisc_457) 
        (triple-prerequisites math_110 math_126 cisc_124 cisc_457)  (triple-prerequisites math_111 math_126 cisc_124 cisc_457) 
        (triple-prerequisites math_112 math_126 cisc_124 cisc_457)  (triple-prerequisites cisc_101 math_110 math_120 cisc_271)
        (triple-prerequisites cisc_110 math_110 math_120 cisc_271)  (triple-prerequisites cisc_151 math_110 math_120 cisc_271)
        (triple-prerequisites cisc_121 math_110 math_120 cisc_271)  (triple-prerequisites cisc_101 math_111 math_120 cisc_271)
        (triple-prerequisites cisc_110 math_111 math_120 cisc_271)  (triple-prerequisites cisc_151 math_111 math_120 cisc_271)
        (triple-prerequisites cisc_121 math_111 math_120 cisc_271)  (triple-prerequisites cisc_101 math_112 math_120 cisc_271)
        (triple-prerequisites cisc_110 math_112 math_120 cisc_271)  (triple-prerequisites cisc_151 math_112 math_120 cisc_271)
        (triple-prerequisites cisc_121 math_112 math_120 cisc_271)  (triple-prerequisites cisc_101 math_110 math_121 cisc_271)
        (triple-prerequisites cisc_110 math_110 math_121 cisc_271)  (triple-prerequisites cisc_151 math_110 math_121 cisc_271)
        (triple-prerequisites cisc_121 math_110 math_121 cisc_271)  (triple-prerequisites cisc_101 math_111 math_121 cisc_271)
        (triple-prerequisites cisc_110 math_111 math_121 cisc_271)  (triple-prerequisites cisc_151 math_111 math_121 cisc_271)
        (triple-prerequisites cisc_121 math_111 math_121 cisc_271)  (triple-prerequisites cisc_101 math_112 math_121 cisc_271)
        (triple-prerequisites cisc_110 math_112 math_121 cisc_271)  (triple-prerequisites cisc_151 math_112 math_121 cisc_271)
        (triple-prerequisites cisc_121 math_112 math_121 cisc_271)  (triple-prerequisites cisc_101 math_110 math_126 cisc_271)
        (triple-prerequisites cisc_110 math_110 math_126 cisc_271)  (triple-prerequisites cisc_151 math_110 math_126 cisc_271)
        (triple-prerequisites cisc_121 math_110 math_126 cisc_271)  (triple-prerequisites cisc_101 math_111 math_126 cisc_271)
        (triple-prerequisites cisc_110 math_111 math_126 cisc_271)  (triple-prerequisites cisc_151 math_111 math_126 cisc_271)
        (triple-prerequisites cisc_121 math_111 math_126 cisc_271)  (triple-prerequisites cisc_101 math_112 math_126 cisc_271)
        (triple-prerequisites cisc_110 math_112 math_126 cisc_271)  (triple-prerequisites cisc_151 math_112 math_126 cisc_271)
        (triple-prerequisites cisc_121 math_112 math_126 cisc_271)

        (quad-prerequisites cisc_226 cisc_322 cisc_324 math_110 cisc_486)   (quad-prerequisites cisc_226 cisc_326 cisc_324 math_110 cisc_486)
        (quad-prerequisites cisc_226 cisc_322 cisc_324 math_111 cisc_486)   (quad-prerequisites cisc_226 cisc_326 cisc_324 math_111 cisc_486)
        (quad-prerequisites cisc_226 cisc_322 cisc_324 math_112 cisc_486)   (quad-prerequisites cisc_226 cisc_326 cisc_324 math_112 cisc_486)

        (capstone-course cisc_500)
        (capstone-course cisc_499)
        (capstone-course cisc_498)
        (capstone-course cisc_496)
        (capstone-course cogs_499)

        ; This is used for non-deterministic feature, mutual exclusive courses has potential to overlap with each other.
        (mutual-exclusive cisc_322)
        (mutual-exclusive cisc_320)
        (mutual-exclusive cisc_371)
        (mutual-exclusive cisc_372)
        (mutual-exclusive cisc_452)
        (mutual-exclusive cisc_453)
        (mutual-exclusive cisc_455)
        (mutual-exclusive cisc_467)
        (mutual-exclusive cisc_473)
        (mutual-exclusive cisc_474)
        (mutual-exclusive cisc_496)
        (mutual-exclusive cisc_498)
        (mutual-exclusive cisc_500)
        (mutual-exclusive cisc_499) 
        (mutual-exclusive cogs_499)
        (mutual-exclusive cogs_400) 
        (mutual-exclusive cisc_490)

        (available cisc_101) (available cisc_110) (available cisc_121) (available cisc_102) (available cisc_124)
        (available cisc_151) (available cisc_181) (available cisc_251) (available cisc_203) (available cisc_204)
        (available cisc_220) (available cisc_221) (available cisc_223) (available cisc_226) (available cisc_235)
        (available cisc_271) (available cisc_282) (available cisc_324) (available cisc_325) (available cisc_326)
        (available cisc_327) (available cisc_330) (available cisc_332) (available cisc_335) (available cisc_340)
        (available cisc_351) (available cisc_352) (available cisc_360) (available cisc_365) (available cisc_422)
        (available cisc_423) (available cisc_425) (available cisc_426) (available cisc_432) (available cisc_434)
        (available cisc_437) (available cisc_447) (available cisc_448) (available cisc_451) (available cisc_454)
        (available cisc_457) (available cisc_458) (available cisc_462) (available cisc_465) (available cisc_466)
        (available cisc_468) (available cisc_471) (available cisc_472) (available cisc_486) (available cisc_491)
        (available cisc_492) (available cmpe_327) 
        (available cogs_100) (available cogs_201) (available cogs_300) (available stat_263)
        (available stat_any) (available math_110) (available math_111) (available math_112) (available math_120)
        (available math_121) (available math_123) (available math_124) (available cisc_497) (available elec_278)
        (available psyc_100) (available psyc_202) (available psyc_221)
        

        (current n1)
        (course-counts n1 s0)


        ; AI stream course requirements
        (AI-core-A cisc_121 cisc_124)
        (AI-core-B stat_263 stat_any)
        (AI-core-C cisc_203 cisc_204 cisc_221 cisc_223 cisc_235)
        (AI-core-D cisc_322 cisc_326)
        (AI-core-E cisc_324 cisc_360 cisc_365)
        (AI-core-F cisc_497)
        (AI-core-G cisc_496 cisc_499 cisc_500)
        (AI-option-A cogs_100 cogs_201 cisc_352)

        (AI-core cisc_121) (AI-core cisc_124) (AI-core stat_263) (AI-core stat_any) (AI-core cisc_203) (AI-core cisc_204)
        (AI-core cisc_221) (AI-core cisc_223) (AI-core cisc_235) (AI-core cisc_322) (AI-core cisc_326) (AI-core cisc_324)
        (AI-core cisc_360) (AI-core cisc_365) (AI-core cisc_497) (AI-core cisc_496) (AI-core cisc_499) (AI-core cisc_500)
        
        (AI-option-B cisc_452 cisc_453) (AI-option-B cisc_452 cisc_455) (AI-option-B cisc_452 cisc_467) (AI-option-B cisc_452 cisc_473) (AI-option-B cisc_452 cisc_474) 
        (AI-option-B cisc_453 cisc_455) (AI-option-B cisc_453 cisc_467) (AI-option-B cisc_453 cisc_473) (AI-option-B cisc_453 cisc_474) 
        (AI-option-B cisc_455 cisc_467) (AI-option-B cisc_455 cisc_473) (AI-option-B cisc_455 cisc_474) 
        (AI-option-B cisc_467 cisc_473) (AI-option-B cisc_467 cisc_474) 
        (AI-option-B cisc_473 cisc_474) 


        (AI-supporting-A cisc_102 math_111 math_112 math_110)
        (AI-supporting-B math_120 math_121 math_123 math_124)

    )

    ; (:goal ; Test use only
    ;     (and 
    ;         ; (course-counts n2 s5)

    ;     )
    ; )        
    ; (AI-core-E cisc_324 cisc_360 cisc_365)
    ;     (AI-core-F cisc_497)
    ;     (AI-core-G cisc_496 cisc_499 cisc_500)
    ; Goal get the AI major course path 
    ; (AI-option-A cogs_100 cogs_201 cisc_352)
    (:goal ; AI major plan
        (and 
            ; (complete-AI-core) ; works
            ; (taken cisc_452) ; works
            ; (taken cisc_455) ; works
            ; (taken cisc_453) ; works
            ; (taken cisc_467) ; works
            ; (taken cisc_473) ; works
            ; (taken cisc_371) ; works
            ; (taken cisc_271) ; works
            ; (taken cisc_352) ; works
            ; (complete-AI-option-A) ; works
            ; (complete-AI-option-B) ; works
            ; sub-goal ; works
            ; (taken cogs_100)
            ; (taken cogs_201)
            ; (taken cisc_352)
            ; (complete-AI-supporting) ; works
            ; (capstone-taken) ; works
            (complete-AI-stream)

        )
    )
)