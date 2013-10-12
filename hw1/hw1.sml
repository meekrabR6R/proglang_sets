(* Homework One *)

(* Problem 1 *)
fun is_older(d1 : int*int*int, d2 : int*int*int) = 
  if ((#1 d1 > #1 d2) orelse ((#1 d1 = #1 d2) andalso 
     ((#2 d1 > #2 d2) orelse ((#2 d1 = #2 d2) andalso
     ((#3 d1 > #3 d2) orelse (#3 d1 = #3 d2)))))) 
  then false
  else true

(* Problem 2 *)
fun number_in_month(dates : (int*int*int) list, month : int) =
  if null dates then 0
  else if #2 (hd dates) = month then 1 + number_in_month(tl dates, month)
  else number_in_month(tl dates, month)

(* Problem 3 *)
fun number_in_months(dates : (int*int*int) list, months : int list) =
  if null months then 0
  else number_in_month(dates, hd months) + number_in_months(dates, tl months)

(* Problem 4 *)
fun dates_in_month(dates : (int*int*int) list, month : int) =
  if null dates then []
  else if #2 (hd dates) = month then (hd dates)::dates_in_month(tl dates, month)
  else dates_in_month(tl dates, month)

(* Problem 5 *)
fun dates_in_months(dates : (int*int*int) list, months : int list) =
  if null months then [] 
  else dates_in_month(dates, hd months)@dates_in_months(dates, tl months)

(* Problem 6 *)
fun get_nth(words : string list, n : int) =
  if n=1 then hd words 
  else get_nth(tl words, n-1)

(* Problem 7 *)
fun date_to_string(date : (int*int*int)) = 
  let 
    val months = ["January", "February", "March", "April", "May", "June",
                  "July", "August", "September", "October", "November", "December"]
  in
    get_nth(months, #2 date)^" "^Int.toString(#3 date)^", "^Int.toString(#1 date)
  end

(* Problem 8 *)
fun number_before_reaching_sum(sum : int, nums : int list) =
  let
    fun sum_iter(count : int, curr_sum : int, curr_list : int list) =
      if (curr_sum + hd curr_list) >= sum then count
      else sum_iter(count+1, curr_sum+(hd curr_list), tl curr_list)
  in
    sum_iter(0, 0, nums)
  end

(* Problem 9 *)
fun what_month(days : int) =
  let
    val months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  in
    number_before_reaching_sum(days, months)+1
  end

(* Problem 10 *)
fun month_range(day1 : int, day2 : int) =
  if day1 > day2 then [] 
  else what_month(day1)::month_range(day1+1,day2)

(* Problem 11 *)
fun oldest(dates : (int*int*int) list) =
  if null dates then NONE
  else 
    let val tl_ans = oldest(tl dates)
    in
      if isSome tl_ans andalso is_older(valOf tl_ans, hd dates)
      then tl_ans
      else SOME (hd dates)
    end  
