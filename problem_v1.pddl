(define (problem v1_p)

    (:domain v1_d)

    (:objects
        ; courses
        cisc_101  cisc_110 cisc_121 cisc_102 cisc_124 cisc_151 cisc_181 - cisc
        cisc_203 cisc_204 cisc_220 cisc_221 cisc_223 cisc_226 cisc_235 cisc_251 cisc_271 cisc_282 - cisc
        cisc_320 cisc_322 cisc_324 cisc_325 cisc_326 cisc_327 cisc_330 cisc_332 cisc_335 cisc_340 cisc_351 cisc_352 cisc_360 cisc_365 cisc_371 cisc_372 - cisc
        cisc_422 cisc_423 cisc_425 cisc_426 cisc_432 cisc_434 cisc_437 cisc_447 cisc_448 cisc_451 cisc_452 cisc_453 cisc_454 cisc_455 cisc_457 cisc_458 cisc_462 cisc_465 cisc_466 cisc_467 cisc_468 cisc_471 cisc_472 cisc_473 cisc_474 cisc_486 cisc_490 cisc_491 cisc_492 cisc_496 cisc_497 cisc_498 cisc_499 cisc_500 - cisc
        cogs_201 cogs_100 cogs_300 cogs_400 cogs_499 - cogs
        stat_263 stat_any- stat
        math_110 math_111 math_112 math_120 math_121 math_126- math
        elec_278 -elec
        cmpe_327 - cmpe
        psyc_100 psyc_202 psyc_221 - psyc

        electives_1 electives_2 electives_3 electives_4 electives_5 - elective
        electives_6 electives_7 electives_8 electives_9 electives_10 - elective
        electives_11 electives_12 electives_13 electives_14 electives_15 - elective
        electives_16 electives_17 electives_18 electives_19 electives_20 - elective

        ; terms
        year_1_fall year_1_winter year_1_summer - term
        year_2_fall year_2_winter year_2_summer - term
        year_3_fall year_3_winter year_3_summer - term
        year_4_fall year_4_winter year_4_summer - term
        year_5_fall year_5_winter year_5_summer - term

    )

    (:init 
   
        (prerequisites cisc_121 cisc_124)   (prerequisites cisc_121 cisc_220)   (prerequisites cisc_124 cisc_221)   (prerequisites cisc_124 cisc_226)
        (prerequisites cisc_124 cisc_282)   (prerequisites cisc_235 cisc_320)   (prerequisites cisc_324 cisc_335)   (prerequisites cisc_221 cisc_340)
        (prerequisites cisc_235 cisc_352)   (prerequisites cisc_223 cisc_422)   (prerequisites cisc_325 cisc_425)   (prerequisites cisc_324 cisc_434)
        (prerequisites cisc_327 cisc_448)   (prerequisites cmpe_327 cisc_448)   (prerequisites cisc_235 cisc_452)   (prerequisites cisc_333 cisc_451) 
        (prerequisites cisc_351 cisc_451)   (prerequisites cisc_372 cisc_451)   (prerequisites cisc_352 cisc_453)   (prerequisites cisc_223 cisc_462)   
        (prerequisites cisc_365 cisc_466)   (prerequisites cisc_204 cisc_467)   (prerequisites cisc_330 cisc_472)   (prerequisites cisc_352 cisc_474)
        (prerequisites cisc_371 cisc_473)   (prerequisites cisc_486 cisc_496)   (prerequisites cisc_352 cisc_497)   (prerequisites cisc_365 cisc_497)
        (prerequisites cisc_365 cisc_499)   (prerequisites cisc_352 cogs_499)   (prerequisites cisc_365 cogs_499)   (prerequisites cisc_235 cogs_400)
        (prerequisites elec_278 cogs_400)   (prerequisites cogs_100 cogs_201)   (prerequisites psyc_100 cogs_201)

        (double-prerequisites cisc_121 cisc_102 cisc_203)   (double-prerequisites cisc_121 math_110 cisc_203)   (double-prerequisites cisc_121 cisc_102 cisc_204)
        (double-prerequisites cisc_121 math_110 cisc_204)   (double-prerequisites cisc_124 cisc_204 cisc_223)   (double-prerequisites cisc_124 cisc_203 cisc_235)   
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
        (triple-prerequisites cisc_204 cisc_360 cisc_223 cisc_465)  (triple-prerequisites cisc_204 cisc_260 cisc_223 cisc_465)
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
 


        (succ electives_1 electives_2)
        (succ electives_2 electives_3)
        (succ electives_3 electives_4)
        (succ electives_4 electives_5)
        (succ electives_5 electives_6)
        (succ electives_6 electives_7)
        (succ electives_7 electives_8)
        (succ electives_8 electives_9)
        (succ electives_9 electives_10)
        (succ electives_10 electives_11)
        (succ electives_11 electives_12)
        (succ electives_12 electives_13)
        (succ electives_13 electives_14)
        (succ electives_14 electives_15)
        (succ electives_15 electives_16)
        (succ electives_16 electives_17)
        (succ electives_17 electives_18)
        (succ electives_18 electives_19)
        (succ electives_19 electives_20)

        (next year_1_fall year_1_winter)    (next year_1_winter year_1_summer)  (next year_1_summer year_2_fall)
        (next year_2_fall year_2_winter)    (next year_2_winter year_2_summer)  (next year_2_summer year_3_fall)
        (next year_3_fall year_3_winter)    (next year_3_winter year_3_summer)  (next year_3_summer year_4_fall)
        (next year_4_fall year_4_winter)    (next year_4_winter year_4_summer)  (next year_4_summer year_5_fall)
        (next year_5_fall year_5_winter)    (next year_5_winter year_5_summer)  
        
        (current year_1_fall)

    )

    (:goal ; Test use only
        (and 
            (taken cisc_101 year_1_fall)
            (taken cisc_204 year_1_winter)
        )
    )

)
