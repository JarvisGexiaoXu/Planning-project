(define (problem v2_p)

    (:domain v2_d)

    (:objects
        ; numbers：represent number of terms
        n1 n2 n3 n4 n5 n6 n7 n8 - num1 

        ; courses
        cisc_101 cisc_110 cisc_121 cisc_102 cisc_124 cisc_151 cisc_181 cisc_251 - cisc
        cisc_203 cisc_204 cisc_220 cisc_221 cisc_223 cisc_226 cisc_235 cisc_271 cisc_282 - cisc
        cisc_320 cisc_322 cisc_324 cisc_325 cisc_326 cisc_327 cisc_330 cisc_332 cisc_335 - cisc
        cisc_340 cisc_351 cisc_352 cisc_360 cisc_365 cisc_371 cisc_372 - cisc
        cisc_422 cisc_423 cisc_425 cisc_426 cisc_432 cisc_434 cisc_437 cisc_447 cisc_448 - cisc
        cisc_451 cisc_452 cisc_453 cisc_454 cisc_455 cisc_457 cisc_458 cisc_462 cisc_465 - cisc
        cisc_466 cisc_468 cisc_471 cisc_472 cisc_473 cisc_474 cisc_486 cisc_490 cisc_491 - cisc
        cisc_492 cisc_496 - cisc
        cisc_500 - cisc
        cogs_100 cogs_201 cogs_300 cogs_400 cogs_499 - cogs
        stat_263 stat_any - stat
        math_110 math_111 math_112 math_120 math_121 math_126 - math
        cisc_467 cisc_497 cisc_498 cisc_499 - cisc

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

        (mutual-exclusive cisc_101 cisc_110) (mutual-exclusive cisc_101 cisc_151) 
        (mutual-exclusive cisc_110 cisc_101) (mutual-exclusive cisc_110 cisc_151) 
        (mutual-exclusive cisc_151 cisc_101) (mutual-exclusive cisc_151 cisc_110)
        (mutual-exclusive cisc_320 cisc_322) (mutual-exclusive cisc_322 cisc_320)  
        (mutual-exclusive cisc_320 cisc_326) (mutual-exclusive cisc_326 cisc_320) 
        (mutual-exclusive cisc_322 cisc_326) (mutual-exclusive cisc_326 cisc_322) 
        (mutual-exclusive cisc_351 cisc_371) (mutual-exclusive cisc_351 cisc_372) 
        (mutual-exclusive cisc_371 cisc_351) (mutual-exclusive cisc_371 cisc_372) 
        (mutual-exclusive cisc_372 cisc_351) (mutual-exclusive cisc_372 cisc_371) 
        (mutual-exclusive cisc_452 cogs_400) (mutual-exclusive cogs_400 cisc_452)
        (mutual-exclusive cisc_474 cisc_490) (mutual-exclusive cisc_490 cisc_474)
        (mutual-exclusive cisc_474 cisc_490) (mutual-exclusive cisc_490 cisc_474)
        (mutual-exclusive cisc_496 cisc_498) (mutual-exclusive cisc_496 cisc_499) 
        (mutual-exclusive cisc_498 cisc_496) (mutual-exclusive cisc_498 cisc_499) 
        (mutual-exclusive cisc_498 cisc_500) (mutual-exclusive cisc_498 cogs_499)
        (mutual-exclusive cisc_499 cisc_498) (mutual-exclusive cisc_499 cisc_496) 
        (mutual-exclusive cisc_499 cisc_500) (mutual-exclusive cisc_499 cogs_499)
        (mutual-exclusive cisc_500 cisc_498) (mutual-exclusive cisc_500 cisc_496) 
        (mutual-exclusive cisc_500 cisc_499) (mutual-exclusive cisc_500 cogs_499)
        (mutual-exclusive cogs_499 cisc_498) (mutual-exclusive cogs_499 cisc_496) 
        (mutual-exclusive cogs_499 cisc_499) (mutual-exclusive cogs_499 cisc_500)
        (mutual-exclusive math_110 math_111) (mutual-exclusive math_110 math_112)
        (mutual-exclusive math_111 math_110) (mutual-exclusive math_111 math_112)
        (mutual-exclusive math_112 math_110) (mutual-exclusive math_112 math_111)
        (mutual-exclusive math_120 math_121) (mutual-exclusive math_120 math_126)
        (mutual-exclusive math_121 math_126) (mutual-exclusive math_121 math_120)
        (mutual-exclusive math_126 math_121) (mutual-exclusive math_126 math_120)

        (next year_1_fall year_1_winter)    (next year_1_winter year_1_summer)  (next year_1_summer year_2_fall)
        (next year_2_fall year_2_winter)    (next year_2_winter year_2_summer)  (next year_2_summer year_3_fall)
        (next year_3_fall year_3_winter)    (next year_3_winter year_3_summer)  (next year_3_summer year_4_fall)
        (next year_4_fall year_4_winter)    (next year_4_winter year_4_summer)  (next year_4_summer year_5_fall)
        (next year_5_fall year_5_winter)    (next year_5_winter year_5_summer)  
        
        (current-term year_1_fall)
        (current n1)
        (course-counts n1 s0)

    )

    (:goal ; Test use only
        (and 
            (course-counts n3 s5)
            (taken cisc_282)
        )
    )

)