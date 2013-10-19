(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* Problem 1 *)
fun all_except_option(s : string, sl : string list) = 
  case sl of
    [] => NONE
   |s'::sl' => 
     if same_string(s, s') then SOME sl' 
     else case all_except_option(s, sl') of
            NONE => NONE 
           |SOME lst => SOME(s'::lst)  

(* Problem 2 *)
fun get_substitutions1(substitutions : (string list) list, s : string) =
  case substitutions of
    [] => []
   |sub::sub_list => case all_except_option(s, sub) of
                       NONE => []@get_substitutions1(sub_list, s)
                      |SOME lst => lst@get_substitutions1(sub_list, s)

(* Problem 3 *)
fun get_substitutions2(substitutions : (string list) list, s : string) =
  let 
    fun get_sub_iter(subs : (string list) list, acc : string list) =
      case subs of
        [] => acc 
       |sb::sbs => case all_except_option(s, sb) of
                     NONE => get_sub_iter(sbs,acc)
                    |SOME lst => get_sub_iter(sbs, acc@lst) 

  in get_sub_iter(substitutions, [])
  end

(* Problem 4 *)
type name = { first:string, middle:string, last:string }
fun similar_names(substitutions : (string list) list, full_name : name) =
  let 
    val { first:string, middle:string, last:string }  = full_name
    fun sim_iter(subs: string list, acc: name list) =
      case subs of
         [] => rev(acc)
        |sb::sbs => sim_iter(sbs, {first=sb,middle=middle,last=last}::acc)  
  in sim_iter(get_substitutions2(substitutions, first),full_name::[])
  end 

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)

(* Problem 5 *)
fun card_color(curr_card : card) = 
  case curr_card of
    (s,r) => if s=Clubs orelse s=Spades then Black else Red

(* Problem 6 *)
fun card_value(curr_card : card) = 
  case curr_card of
    (s, Num r) => r
   |(s, r) => if r=Ace then 11 else 10
