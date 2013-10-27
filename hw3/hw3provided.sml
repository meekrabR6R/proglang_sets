(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

(* Problem 1 *)
fun only_capitals(words : string list) =
  let fun f s = Char.isUpper(String.sub(s,0))
  in List.filter(f) words end

(* Problem 2 *)
fun longest_string1(words : string list) = 
  List.foldl (fn (x,y) => if (size x > size y) then x else y) (hd words) (tl words)

(* Problem 3 *)
fun longest_string2(words : string list) =
  List.foldl (fn (x,y) => if(size x >= size y) then x else y) (hd words) (tl
  words)

(* Problem 4 *)
fun longest_string_helper(f) (words : string list) = 
  List.foldl (fn (x,y) => if f(size x, size y) then x else y) (hd words) (tl words)  

val longest_string3 = longest_string_helper(fn (x,y) => x > y)

val longest_string4= longest_string_helper(fn (x,y) => x >= y)

(* Problem 5 *)
val longest_capitalized = longest_string_helper(fn (x,y) => x > y) o only_capitals

(* Problem 6 *)
fun rev_string(word : string) = (String.implode o List.rev o String.explode) word 

(* Problem 7 *)
fun first_answer f xs =
  case xs of
    [] => raise NoAnswer
   |x::xs' => case f x of
                SOME x' => x'
               | _ => first_answer f xs'
       
(* Problem 8 *)
fun all_answers f xs =
  let
    fun all_helper(curr_xs, acc) =
      case curr_xs of
        [] => SOME acc
       |x::xs' => case f x of
                    NONE => NONE
                   |SOME x => all_helper(xs', acc@x)
  in all_helper(xs, []) end 

(* Problem 9 *)

(* a *)
fun count_wildcards p = g (fn x => 1) (fn y => 0) p

(* b *)
fun count_wild_and_variable_lengths p = g (fn x => 1) (fn y => String.size y) p

(* c *)
fun count_some_var(s, p) = g (fn x => 0) (fn y => if y=s then 1 else 0) p

(* Problem 10 *)
fun check_pat(p) =
  let
    fun lister pat =
      case pat of
        Variable x => [x]
       |TupleP ps => List.foldl (fn (p',i) => (lister p') @ i) [] ps
       | _ => [] 

    fun compare(curr_strings) =
      case curr_strings of
        [] => true
       |x::xs => if List.exists (fn y => y=x) xs then false else compare(xs)  
  in
    compare(lister p)
  end
