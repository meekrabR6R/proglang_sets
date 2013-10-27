(* Homework2 Simple Test*)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw3provided.sml";

val test1_a = only_capitals ["A","B","C"] = ["A","B","C"]
val test1_b = only_capitals ["a","b","c"] = []
val test1_c = only_capitals ["Q","Z","x","Y","p"] = ["Q","Z","Y"]
val test1_d = only_capitals ["Hello","goodbye","WHY"] = ["Hello","WHY"]

val test2_a = longest_string1 ["A","bc","C"] = "bc"
val test2_b = longest_string1 ["howdy","crabcanon"] = "crabcanon"
val test2_c = longest_string1 ["superfabulous","supersmablous"] = "superfabulous"

val test3_a = longest_string2 ["A","bc","C"] = "bc"
val test3_b = longest_string2 ["howdy","crabcanon"] = "crabcanon" 
val test3_c = longest_string2 ["superfabulous", "supersmablous"] = "supersmablous"

val test4a_a = longest_string3 ["A","bc","C"] = "bc"
val test4a_b = longest_string3 ["howdy","crabcanon"] = "crabcanon"
val test4a_c = longest_string3 ["superfabulous","supersmablous"] = "superfabulous"

val test4b_a = longest_string4 ["A","bc","C"] = "bc"
val test4b_b = longest_string4 ["howdy","crabcanon"] = "crabcanon"
val test4b_c = longest_string4 ["superfabulous","supersmablous"] = "supersmablous"
val test4b_d= longest_string4 ["A","B","C"] = "C"

val test5_a = longest_capitalized ["A","bc","C"] = "A";
val test5_b = longest_capitalized ["Epistemology", "Phenomenological"] = "Phenomenological"
val test5_c = longest_capitalized ["Hello", "Olleh"] = "Hello"
val test5_d = longest_capitalized ["abcde", "Howdy", "fghijkl", "Sowdy", "mnop"] = "Howdy"

val test6_a = rev_string "abc" = "cba"

val test7_a = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4
val test7_b = (first_answer (fn x => if x = 1000 then SOME x else NONE) [2,4,5,6] handle NoAnswer => 1 ) = 1

val test8_a = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val test8_b = all_answers (fn x => if x > 2 then SOME [x] else NONE) [3,4,5,6] = SOME [3,4,5,6]


val test9a_a = count_wildcards Wildcard = 1
val test9a_b = count_wildcards (TupleP [Wildcard, Wildcard]) = 2
val test9a_c = count_wildcards (TupleP [(Variable "Gandalf"),Wildcard,UnitP,ConstP 2,Wildcard,Wildcard]) = 3
val test9a_d = count_wildcards (Variable "Frodo") = 0

val test9b_a = count_wild_and_variable_lengths (Variable("a")) = 1
val test9b_b = count_wild_and_variable_lengths (TupleP [(Variable "Gandalf"),Wildcard]) = 8
val test9b_c = count_wild_and_variable_lengths (TupleP [ConstP 2,ConstP 3]) = 0

val test9c_a = count_some_var ("x", Variable("x")) = 1
val test9c_b = count_some_var ("x", Variable("q")) = 0
val test9c_c = count_some_var ("x", ConstructorP ("x", UnitP)) = 0

val test10_a = check_pat (Variable("x")) = true
val test10_b = check_pat (TupleP [(Variable "q"),Wildcard,(Variable "r"),ConstP 2, (Variable "q")]) = false
(*
val test11 = match (Const(1), UnitP) = NONE

val test12 = first_match Unit [UnitP] = SOME []
*)
