(OCaml
 (((name "")
   (content
     "open Core\
    \nexception Empty_list\
    \n\
    \nlet list_max = function\
    \n  | [] -> raise Empty_list\
    \n  | hd :: tl -> List.fold tl ~init:hd ~f:(Int.max)\
    \n\
    \nlet () =\
    \n  printf \"%d\\n\" (list_max [1;2;3]);\
    \n  printf \"%d\\n\" (list_max [])"))))
