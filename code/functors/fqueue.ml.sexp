(OCaml
 (((name "")
   (content
     "open Core\
    \n\
    \ntype 'a t = 'a list * 'a list\
    \n\
    \nlet empty = ([],[])\
    \n\
    \nlet enqueue (in_list, out_list) x =\
    \n  (x :: in_list,out_list)\
    \n\
    \nlet dequeue (in_list, out_list) =\
    \n  match out_list with\
    \n  | hd :: tl -> Some (hd, (in_list, tl))\
    \n  | [] ->\
    \n    match List.rev in_list with\
    \n    | [] -> None\
    \n    | hd :: tl -> Some (hd, ([], tl))\
    \n\
    \nlet fold (in_list, out_list) ~init ~f =\
    \n  let after_out = List.fold ~init ~f out_list in\
    \n  List.fold_right ~init:after_out ~f:(fun x acc -> f acc x) in_list"))))
