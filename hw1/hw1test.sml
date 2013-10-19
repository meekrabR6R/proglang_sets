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

val test4_a = dates_in_month([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val test4_b = dates_in_month([(2012,1,2),(2010,1,20),(2011,1,15)],1) =
  [(2012,1,2),(2010,1,20),(2011,1,15)]
val test4_c = dates_in_month([(2010,12,2),(1999,11,1)],3) = []

val test5_a = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test5_b = dates_in_months([(2010,1,20),(2011,1,21),(2010,2,1)],[1,2]) =
  [(2010,1,20),(2011,1,21),(2010,2,1)]
val test5_c = dates_in_months([(2011,11,1),(2001,2,12)],[3,4,5]) = []

val test6_a = get_nth(["hi", "there", "how", "are", "you"], 2) = "there"
val test6_b = get_nth(["howdy", "friend", "I", "am", "fine"], 1) = "howdy"
val test6_c = get_nth(["howdy", "friend", "I", "am", "fine"], 3) = "I"
val test6_d = get_nth(["howdy", "friend", "I", "am", "fine"], 4) = "am"
val test6_e = get_nth(["howdy", "friend", "I", "am", "fine"], 5) = "fine"

val test7_a = date_to_string((2013, 6, 1)) = "June 1, 2013"
val test7_b = date_to_string((1984, 5, 4)) = "May 4, 1984"

val test8_a = number_before_reaching_sum(10, [1,2,3,4,5]) = 3
val test8_b = number_before_reaching_sum(6, [1,2,3]) = 2
val test8_c = number_before_reaching_sum(3, [4,2,1]) = 0

val test9_a = what_month(70) = 3
val test9_b = what_month(1) = 1
val test9_c = what_month(30) = 1
val test9_d = what_month(40) = 2
val test9_e = what_month(350) = 12

val test10_a = month_range(31, 34) = [1,2,2,2]
val test11_a = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)

val test12a_a =
  number_in_months_challenge([(2012,3,1),(2013,1,1),(2010,1,11)],[3,3,1]) = 3
val test12a_b = number_in_months_challenge([(2001,2,5),(2012,7,3),(2001,2,4)],[2,2,2]) = 2

val test12b_a = dates_in_months_challenge([(2012,1,4), (2011,1,3)],[1,1]) = [(2012,1,4),(2011,1,3)]

val test13_a = reasonable_date((1984,5,4)) = true
val test13_b = reasonable_date((1600,2,29)) = true
val test13_c = reasonable_date((800,2,29)) = true
val test13_d = not (reasonable_date((1999,2,29))) = true
val test13_e = reasonable_date((1984,2,29)) = true
val test13_f = not (reasonable_date((1600,2,30))) = true
val test13_g = not (reasonable_date((~100, 2, 30))) = true
val test13_h = not (reasonable_date((1200, 1, 0))) = true
val test13_i = not (reasonable_date((1112, ~2, 12))) = true
val test13_j = not (reasonable_date((1922, 13, 23))) = true
