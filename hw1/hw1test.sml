(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)
use "hw1.sml";

val test1_a = is_older((1,2,3),(2,3,4)) = true
val test1_b = not (is_older((2,3,4),(1,2,3))) = true
val test1_c = not (is_older((3,3,3),(3,3,3))) = true
val test1_d = is_older((2011,3,14),(2012,3,14)) = true
val test1_e = is_older((2012,1,1),(2012,1,2)) = true
val test1_f = not (is_older((2012,1,2),(2012,1,1))) = true
val test1_g = is_older((2010,2,15),(2010,3,15)) = true
val test1_h = not (is_older((2010,3,15),(2010,2,15))) = true

val test2_a = number_in_month([(2012,2,28),(2013,12,1)],2) = 1
val test2_b = number_in_month([(2011,1,21),(2013,1,1),(2012,2,3)],1) = 2
val test2_c = number_in_month([(2010,1,1),(1999,2,3)],4) = 0
val test2_d = number_in_month([(2010,2,3),(2011,2,4),(2013,2,10)],2) = 3

val test3_a = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test3_b = number_in_months([(2011,1,28),(2012,5,2),(2001,2,1),(2013,3,12)],[1,2,3,5]) = 4
val test3_c = number_in_months([(2012,8,2),(2011,5,3)],[1,2]) = 0
(*
val test4 = dates_in_month([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]

val test5 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]

val test6 = get_nth(["hi", "there", "how", "are", "you"], 2) = "there"

val test7 = date_to_string((2013, 6, 1)) = "June 1, 2013"

val test8 = number_before_reaching_sum(10, [1,2,3,4,5]) = 3

val test9 = what_month(70) = 3

val test10 = month_range(31, 34) = [1,2,2,2]

val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
*)
