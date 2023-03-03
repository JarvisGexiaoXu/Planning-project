(define (problem v1_p)

    (:domain v1_d)

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
        cisc_500 - cisc
        cmpe_327 - cisc   
        cisc_452 cisc_453 cisc_455 cisc_467 cisc_473 cisc_474 - cisc
        cogs_100 cogs_201 cogs_300 cogs_400 cogs_499 - cogs
        stat_263 stat_any - stat
        math_110 math_111 math_112 math_120 math_121 math_126 math_123 math_124 - math
        cisc_497 cisc_496 cisc_498 cisc_499 - cisc
        elec_278 - elec
        psyc_100 psyc_202 psyc_221 - psyc
     

        ; terms
        year_1_fall year_1_winter year_1_summer - term
        year_2_fall year_2_winter year_2_summer - term
        year_3_fall year_3_winter year_3_summer - term
        year_4_fall year_4_winter year_4_summer - term
        year_5_fall year_5_winter year_5_summer - term

    )

    (:init 

        (succ1 n1 n2)   (succ1 n2 n3)   (succ1 n3 n4)   (succ1 n4 n5)   (succ1 n5 n6)   (succ1 n6 n7)   (succ1 n7 n8)

        (succ2 s0 s1)   (succ2 s1 s2)   (succ2 s2 s3)   (succ2 s3 s4)   (succ2 s4 s5)

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
        ; (mutual-exclusive cisc_101 cisc_110) (mutual-exclusive cisc_101 cisc_151) 
        ; (mutual-exclusive cisc_110 cisc_101) (mutual-exclusive cisc_110 cisc_151) 
        ; (mutual-exclusive cisc_151 cisc_101) (mutual-exclusive cisc_151 cisc_110)
        ; (mutual-exclusive cisc_320 cisc_322) (mutual-exclusive cisc_322 cisc_320)  
        ; (mutual-exclusive cisc_320 cisc_326) (mutual-exclusive cisc_326 cisc_320) 
        ; (mutual-exclusive cisc_322 cisc_326) (mutual-exclusive cisc_326 cisc_322) 
        ; (mutual-exclusive cisc_351 cisc_371) (mutual-exclusive cisc_351 cisc_372) 
        ; (mutual-exclusive cisc_371 cisc_351) (mutual-exclusive cisc_371 cisc_372) 
        ; (mutual-exclusive cisc_372 cisc_351) (mutual-exclusive cisc_372 cisc_371) 
        ; (mutual-exclusive cisc_452 cogs_400) (mutual-exclusive cogs_400 cisc_452)
        ; (mutual-exclusive cisc_474 cisc_490) (mutual-exclusive cisc_490 cisc_474)
        ; (mutual-exclusive cisc_496 cisc_498) (mutual-exclusive cisc_496 cisc_499) 
        ; (mutual-exclusive cisc_498 cisc_496) (mutual-exclusive cisc_498 cisc_499) 
        ; (mutual-exclusive cisc_498 cisc_500) (mutual-exclusive cisc_498 cogs_499)
        ; (mutual-exclusive cisc_499 cisc_498) (mutual-exclusive cisc_499 cisc_496) 
        ; (mutual-exclusive cisc_499 cisc_500) (mutual-exclusive cisc_499 cogs_499)
        ; (mutual-exclusive cisc_500 cisc_498) (mutual-exclusive cisc_500 cisc_496) 
        ; (mutual-exclusive cisc_500 cisc_499) (mutual-exclusive cisc_500 cogs_499)
        ; (mutual-exclusive cogs_499 cisc_498) (mutual-exclusive cogs_499 cisc_496) 
        ; (mutual-exclusive cogs_499 cisc_499) (mutual-exclusive cogs_499 cisc_500)
        ; (mutual-exclusive math_110 math_111) (mutual-exclusive math_110 math_112)
        ; (mutual-exclusive math_111 math_110) (mutual-exclusive math_111 math_112)
        ; (mutual-exclusive math_112 math_110) (mutual-exclusive math_112 math_111)
        ; (mutual-exclusive math_120 math_121) (mutual-exclusive math_120 math_126)
        ; (mutual-exclusive math_121 math_126) (mutual-exclusive math_121 math_120)
        ; (mutual-exclusive math_126 math_121) (mutual-exclusive math_126 math_120)

        (next year_1_fall year_1_winter)    (next year_1_winter year_1_summer)  (next year_1_summer year_2_fall)
        (next year_2_fall year_2_winter)    (next year_2_winter year_2_summer)  (next year_2_summer year_3_fall)
        (next year_3_fall year_3_winter)    (next year_3_winter year_3_summer)  (next year_3_summer year_4_fall)
        (next year_4_fall year_4_winter)    (next year_4_winter year_4_summer)  (next year_4_summer year_5_fall)
        (next year_5_fall year_5_winter)    (next year_5_winter year_5_summer)  
        
        (current-term year_1_fall)
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
        
        (AI-option-B cisc_452) 
        (AI-option-B cisc_453) 
        (AI-option-B cisc_455) 
        (AI-option-B cisc_467) 
        (AI-option-B cisc_473)
        (AI-option-B cisc_474)

        (AI-supporting-A cisc_102 math_111 math_112 math_110)
        (AI-supporting-B math_120 math_121 math_123 math_124)

    )

    ; (:goal ; Test use only
    ;     (and 
    ;         (course-counts n3 s5)
    ;         (taken cisc_204)
    ;         (taken cisc_271)
    ;         (taken cisc_486)
    ;     )
    ; )

    (:goal ; AI major plan
        (and 
            (complete-AI-stream)
            (course-counts n8 s5)
        )
    )
)