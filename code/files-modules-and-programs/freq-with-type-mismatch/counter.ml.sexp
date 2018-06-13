(OCaml
 (((name "")
   (content
     "open Core_kernel\
    \n\
    \ntype t = int String.Map.t\
    \n\
    \nlet empty = String.Map.empty\
    \n\
    \nlet to_list t = Map.to_alist t\
    \n\
    \nlet touch t s =\
    \n  let count =\
    \n    match Map.find t s with\
    \n    | None -> 0\
    \n    | Some x -> x\
    \n  in\
    \n  Map.add t ~key:s ~data:(count + 1)\
    \n\
    \n(* part 1 *)\
    \ntype median = | Median of string\
    \n              | Before_and_after of string * string\
    \n\
    \nlet median t =\
    \n  let sorted_strings = List.sort (Map.to_alist t)\
    \n                         ~cmp:(fun (_,x) (_,y) -> Int.descending x y)\
    \n  in\
    \n  let len = List.length sorted_strings in\
    \n  if len = 0 then failwith \"median: empty frequency count\";\
    \n  let nth n = fst (List.nth_exn sorted_strings n) in\
    \n  if len mod 2 = 1\
    \n  then Median (nth (len/2))\
    \n  else Before_and_after (nth (len/2 - 1), nth (len/2));;"))))
