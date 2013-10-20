(* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)
use "hw2provided.sml";

val test1_a = all_except_option("string", ["string"]) = SOME []
val test1_b = all_except_option("buddy", ["friend","pal"]) = NONE
val test1_c = all_except_option("guy", []) = NONE
val test1_d = all_except_option("cupcake", ["brownie","cake","cupcake","pie"]) = SOME ["brownie","cake","pie"]

val test2_a = get_substitutions1([["foo"],["there"]], "foo") = []
val test2_b = get_substitutions1([["foo","bar"],["bar","pub"],["soap","shampoo","bar"]],"bar") = ["foo","pub","soap","shampoo"]
val test2_c = get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],"Fred") = ["Fredrick","Freddie","F"]

val test3_a = get_substitutions2([["foo"],["there"]], "foo") = []
val test3_b = get_substitutions2([["foo","bar"],["bar","pub"],["soap","shampoo","bar"]],"bar") = ["foo","pub","soap","shampoo"]
val test3_c = get_substitutions2([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],"Fred") = ["Fredrick","Freddie","F"]


val test4_a = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
	                    [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
	                     {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}]

val test5_a = card_color((Clubs, Num 2)) = Black
val test5_b = card_color((Diamonds, Num 3)) = Red
val test5_c = card_color((Spades, Num 9)) = Black
val test5_d = card_color((Hearts, Num 5)) = Red

val test6_a = card_value((Clubs, Num 2)) = 2
val test6_b = card_value((Clubs, King)) = 10
val test6_c = card_value((Clubs, Queen)) = 10
val test6_d = card_value((Clubs, Jack)) = 10
val test6_e = card_value((Clubs, Ace)) = 11

val test7_a = remove_card([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []
val test7_b = remove_card([(Spades,King),(Hearts,Queen)],(Hearts,Queen),IllegalMove) = [(Spades,King)]
val test7_c = (remove_card([(Diamonds, Num 3)],(Clubs,Jack),IllegalMove) handle IllegalMove => [(Diamonds, Num 3)]) = [(Diamonds, Num 3)] 

val test8_a = all_same_color([(Hearts, Ace), (Hearts, Ace)]) = true
val test8_b = all_same_color([(Spades, King), (Hearts, Queen)]) = false
val test8_c = all_same_color([(Diamonds, Ace), (Hearts, Ace)]) = true
val test8_d = all_same_color([(Spades, Ace), (Clubs, Ace)]) = true
val test8_e = all_same_color([(Spades, Ace), (Spades, Ace)]) = true

val test9_a = sum_cards([(Clubs, Num 2),(Clubs, Num 2)]) = 4
val test9_b = sum_cards([(Clubs, Num 2),(Clubs, Ace)]) = 13
val test9_c = sum_cards([(Clubs, Num 2),(Clubs, Queen)]) = 12
val test9_d = sum_cards([(Clubs, Num 2),(Clubs, King)]) = 12
val test9_e = sum_cards([(Clubs, Num 2),(Clubs, Jack)]) = 12

val test10_a = score([(Hearts, Num 2),(Clubs, Num 4)],10) = 4
val test10_b = score([(Hearts, Num 2),(Clubs, Num 4)],3) = 9
val test10_c = score([(Hearts, Num 2),(Hearts, Num 4)],10) = 2
val test10_d = score([(Spades, Num 2),(Clubs, Num 4)],3) = 4

val test11 = officiate([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6
val test12 = officiate([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                       [Draw,Draw,Draw,Draw,Draw],
                       42)
             = 3
(*
val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false) 
              handle IllegalMove => true)
             
*)           
