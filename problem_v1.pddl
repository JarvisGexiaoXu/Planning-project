(define (problem v1_p)

    (:domain v1_d)

    (:objects
        ; courses
        cisc_101  cisc_110 cisc_121 cisc_102 cisc_124 cisc_151 cisc_181 - cisc
        cisc_203 cisc_204 cisc_220 cisc_221 cisc_223 cisc_226 cisc_235 cisc_251 cisc_271 cisc_282 - cisc
        cisc_320 cisc_322 cisc_324 cisc_325 cisc_326 cisc_327 cisc_330 cisc_332 cisc_335 cisc_340 cisc_351 cisc_352 cisc_360 cisc_365 cisc_371 cisc_372 - cisc
        cisc_422 cisc_423 cisc_425 cisc_426 cisc_432 cisc_434 cisc_437 cisc_447 cisc_448 cisc_451 cisc_452 cisc_453 cisc_454 cisc_455 cisc_457 cisc_458 cisc_462 cisc_465 cisc_466 cisc_467 cisc_468 cisc_471 cisc_472 cisc_473 cisc_474 cisc_486 cisc_490 cisc_491 cisc_492 cisc_496 cisc_497 cisc_498 cisc_499 cisc_500 - cisc
        cogs_201 cogs_100 cogs_300 cogs_400 cogs_499 - cogs
        stat_263 - stat
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
   
        (prerequisites cisc_121 cisc_124)   (prerequisites cisc_121 cisc_203)
        (prerequisites cisc_121 cisc_204)   (prerequisites cisc_121 cisc_220)
        (prerequisites cisc_124 cisc_221)   (prerequisites cisc_124 cisc_223)
        (prerequisites cisc_204 cisc_223)   (prerequisites cisc_124 cisc_226)
        (prerequisites cisc_124 cisc_235)   (prerequisites cisc_203 cisc_235)
        (prerequisites cisc_124 cisc_282)   (prerequisites cisc_235 cisc_320)
        (prerequisites cisc_235 cisc_322)   (prerequisites cisc_223 cisc_322)
        (prerequisites cisc_221 cisc_324)   (prerequisites cisc_235 cisc_324)
        (prerequisites cisc_124 cisc_325)   (prerequisites cisc_235 cisc_325)
        (prerequisites cisc_223 cisc_326)   (prerequisites cisc_235 cisc_326)
        (prerequisites cisc_220 cisc_327)   (prerequisites cisc_124 cisc_327)
        (prerequisites cisc_121 cisc_330)   (prerequisites cisc_271 cisc_330)
        (prerequisites cisc_102 cisc_332)   (prerequisites cisc_124 cisc_332)
        (prerequisites cisc_324 cisc_335)   (prerequisites cisc_221 cisc_340)
        (prerequisites cisc_251 cisc_351)   (prerequisites cisc_235 cisc_352)
        (prerequisites cisc_124 cisc_360)   (prerequisites cisc_204 cisc_360)
        (prerequisites cisc_203 cisc_365)   (prerequisites cisc_204 cisc_365)
        (prerequisites cisc_235 cisc_365)   (prerequisites cisc_271 cisc_371)
        (prerequisites cisc_271 cisc_372)   (prerequisites cisc_223 cisc_422)
        (prerequisites cisc_223 cisc_423)   (prerequisites cisc_235 cisc_423)
        (prerequisites cisc_325 cisc_425)   (prerequisites cisc_327 cisc_426)
        (prerequisites cisc_324 cisc_426)   (prerequisites cisc_235 cisc_432)
        (prerequisites cisc_332 cisc_432)   (prerequisites cisc_324 cisc_434)
        (prerequisites cisc_324 cisc_437)   (prerequisites cisc_327 cisc_437)
        (prerequisites cisc_324 cisc_447)   (prerequisites cisc_335 cisc_447)
        (prerequisites cisc_327 cisc_448)   (prerequisites cisc_235 cisc_452)
        (prerequisites cisc_352 cisc_453)   (prerequisites cisc_365 cisc_455)
        (prerequisites stat_263 cisc_455)   (prerequisites cisc_121 cisc_458)
        (prerequisites cisc_223 cisc_458)   (prerequisites cisc_221 cisc_458)
        (prerequisites cisc_223 cisc_462)   (prerequisites cisc_365 cisc_466)
        (prerequisites cisc_204 cisc_467)   (prerequisites cisc_235 cisc_468)
        (prerequisites cisc_335 cisc_468)   (prerequisites cisc_352 cisc_471)
        (prerequisites cisc_365 cisc_471)   (prerequisites cisc_330 cisc_472)
        (prerequisites cisc_352 cisc_474)

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
