# Planning-project

## Project Draft Report
By March 3rd, we have completed the fundamental cp model (version 1). The created model is capable of generating reasonable plans for the AI stream. <br />
Under 'Issues' of this repository, we have a list of closed issues; it describes the fundamental features and constraints of the created model, and represents the challenges we have faced so far in building it. <br />
We are going to start working on the FOND model (version 2). It is expected to be done by March 12th. <br />
After that, if time permits, we will add time notions to the model (version 3). <br />
At this moment, we feel confident to submit a completed project before the deadline. <br />


## Example output for version 1:
'''
add_course_without_prerequisites cisc_101 year_1_fall n1 s0 s1 (1) <br />
add_course_without_prerequisites cisc_102 year_1_fall n1 s1 s2 (1) <br />
add_course_without_prerequisites cisc_110 year_1_fall n1 s2 s3 (1) <br />
add_course_without_prerequisites cisc_121 year_1_fall n1 s3 s4 (1) <br />
add_course_without_prerequisites cisc_151 year_1_fall n1 s4 s5 (1) <br />
next_term year_1_fall year_1_winter n1 n2 s5 (1) <br />
add_course_with_double_prerequisites cisc_121 cisc_102 cisc_203 year_1_winter s0 s1 n2 (1) <br />
add_course_with_double_prerequisites cisc_121 cisc_102 cisc_204 year_1_winter s1 s2 n2 (1) <br />
add_course_with_prerequisites cisc_121 cisc_124 year_1_winter s2 s3 n2 (1) <br />
add_course_with_prerequisites cisc_121 cisc_220 year_1_winter s3 s4 n2 (1) <br />
add_course_without_prerequisites cisc_181 year_1_winter n2 s4 s5 (1) <br />
next_term year_1_winter year_1_summer n2 n3 s5 (1) <br />
add_course_with_double_prerequisites cisc_124 cisc_203 cisc_235 year_1_summer s0 s1 n3 (1) <br />
add_course_with_double_prerequisites cisc_124 cisc_204 cisc_223 year_1_summer s1 s2 n3 (1) <br />
add_course_with_double_prerequisites cisc_124 cisc_204 cisc_360 year_1_summer s2 s3 n3 (1) <br />
add_course_with_prerequisites cisc_124 cisc_221 year_1_summer s3 s4 n3 (1) <br />
add_course_with_prerequisites cisc_204 cisc_467 year_1_summer s4 s5 n3 (1) <br />
next_term year_1_summer year_2_fall n3 n4 s5 (1) <br />
add_course_with_triple_prerequisites cisc_203 cisc_204 cisc_235 cisc_365 year_2_fall s0 s1 n4 (1) <br />
add_course_with_double_prerequisites cisc_221 cisc_235 cisc_324 year_2_fall s1 s2 n4 (1) <br />
add_course_with_double_prerequisites cisc_235 cisc_223 cisc_322 year_2_fall s2 s3 n4 (1) <br />
add_course_with_prerequisites cisc_235 cisc_352 year_2_fall s3 s4 n4 (1) <br />
add_capstone_course_without_prerequisites cisc_500 year_2_fall n4 s4 s5 (1) <br />
next_term year_2_fall year_2_winter n4 n5 s5 (1) <br />
add_course_with_prerequisites cisc_365 cisc_497 year_2_winter s0 s1 n5 (1) <br />
add_course_without_prerequisites cisc_490 year_2_winter n5 s1 s2 (1) <br />
add_course_without_prerequisites cisc_491 year_2_winter n5 s2 s3 (1) <br />
add_course_without_prerequisites cisc_492 year_2_winter n5 s3 s4 (1) <br />
add_course_without_prerequisites cmpe_327 year_2_winter n5 s4 s5 (1) <br />
next_term year_2_winter year_2_summer n5 n6 s5 (1) <br />
add_course_without_prerequisites cogs_100 year_2_summer n6 s0 s1 (1) <br />
add_course_without_prerequisites elec_278 year_2_summer n6 s1 s2 (1) <br />
add_course_without_prerequisites math_110 year_2_summer n6 s2 s3 (1) <br />
add_course_without_prerequisites math_111 year_2_summer n6 s3 s4 (1) <br />
add_course_without_prerequisites math_112 year_2_summer n6 s4 s5 (1) <br />
next_term year_2_summer year_3_fall n6 n7 s5 (1) <br />
add_course_with_prerequisites cogs_100 cogs_201 year_3_fall s0 s1 n7 (1) <br />
add_course_with_prerequisites elec_278 cogs_400 year_3_fall s1 s2 n7 (1) <br />
add_course_without_prerequisites math_120 year_3_fall n7 s2 s3 (1) <br />
add_course_without_prerequisites stat_263 year_3_fall n7 s3 s4 (1) <br />
check_ai_option_b_second cisc_467 (1) <br />
add_course_with_prerequisites cisc_352 cisc_474 year_3_fall s4 s5 n7 (1) <br />
next_term year_3_fall year_3_winter n7 n8 s5 (1) <br />
add_course_without_prerequisites math_121 year_3_winter n8 s0 s1 (1) <br />
add_course_without_prerequisites math_123 year_3_winter n8 s1 s2 (1) <br />
add_course_without_prerequisites math_124 year_3_winter n8 s2 s3 (1) <br />
add_course_without_prerequisites math_126 year_3_winter n8 s3 s4 (1) <br />
add_course_without_prerequisites psyc_100 year_3_winter n8 s4 s5 (1) <br />
check_ai_core cisc_121 cisc_124 stat_263 stat_any cisc_203 cisc_204 cisc_221 cisc_223 cisc_235 cisc_322 cisc_326 cisc_324 cisc_360 cisc_365 cisc_497 cisc_496 cisc_499 cisc_500 (1) <br />
check_ai_option_b_first cisc_474 (1) <br />
check_ai_option cogs_100 cogs_201 cisc_352 cisc_474 cisc_467 (1) <br />
check_ai_supporting cisc_102 math_111 math_112 math_110 math_120 math_121 math_123 math_124 (1) <br />
check_ai_complete  (1) <br />
'''
