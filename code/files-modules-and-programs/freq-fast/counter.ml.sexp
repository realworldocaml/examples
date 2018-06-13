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
    \n  Map.add t ~key:s ~data:(count + 1)"))))
