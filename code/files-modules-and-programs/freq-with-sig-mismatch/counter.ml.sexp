(OCaml
 (((name "")
   (content
     "open Core_kernel\
    \n\
    \ntype t = (string * int) list\
    \n\
    \nlet empty = []\
    \n\
    \nlet to_list x = x\
    \n\
    \nlet touch t s =\
    \n  let count =\
    \n    match Map.find t s with\
    \n    | None -> 0\
    \n    | Some x -> x\
    \n  in\
    \n  Map.add t ~key:s ~data:(count + 1)"))))
