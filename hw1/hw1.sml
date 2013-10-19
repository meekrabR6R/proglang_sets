(* Homework One *)

(* Problem 1 *)
fun is_older(d1 : int*int*int, d2 : int*int*int) = 
  not(((#1 d1 > #1 d2) orelse ((#1 d1 = #1 d2) andalso 
      ((#2 d1 > #2 d2) orelse ((#2 d1 = #2 d2) andalso
      ((#3 d1 > #3 d2) orelse (#3 d1 = #3 d2))))))) 
  
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
  let val months = ["January", "February", "March", "April", "May", "June",
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

(* ---- Challenge Problems ---- *)

(* Helper Function *)
fun is_in_list(x : int, xs : int  list) =
  if null xs then false
  else if x=(hd xs) then true
  else is_in_list(x, tl xs)

(* Helper Function *)
fun remove_dups(old_list : int list) =
  let
    fun remove_helper(ol : int list, nl : int list) =
      if null ol then nl
      else if not(is_in_list(hd ol, tl ol)) then remove_helper(tl ol, (hd ol)::nl)
      else remove_helper(tl ol, nl)
  in
    remove_helper(old_list, [])
  end

(* Problem 12a *)
fun number_in_months_challenge(dates : (int*int*int) list, months : int list) =
  if null months then 0
  else number_in_months(dates,remove_dups months)

(* Problem 12b *)
fun dates_in_months_challenge(dates : (int*int*int) list, months : int list) =
  if null months then []
  else 
    let
      val new_months = remove_dups months
    in  
      dates_in_month(dates, hd new_months)@dates_in_months_challenge(dates, tl new_months)
    end

(* Problem 13 *)
fun reasonable_date(date : (int*int*int)) =
  let
    fun is_leap_year(year : int) = 
      ((year mod 400 = 0) orelse (year mod 4 = 0 andalso not(year mod 100 = 0))) 
      
    fun get_nth(month_list : int list, n : int) =
      if n=1 then hd month_list
      else get_nth(tl month_list, n-1)  
  
    val months = [31, (if is_leap_year(#1 date) then 29 else 28), 31, 30, 31,
                  30, 31, 31, 30, 31, 30, 31] 
  in
       not(((#2 date > 0 andalso #2 date <= 12) andalso 
           ((#3 date) > get_nth(months, #2 date))) orelse  
            (#1 date <= 0 orelse #3 date <= 0 orelse 
             #2 date <= 0 orelse #2 date > 12))
  end
