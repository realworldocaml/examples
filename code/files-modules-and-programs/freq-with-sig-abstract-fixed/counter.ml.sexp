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
    \nlet touch counts line =\
    \n  let count = \
    \n    match List.Assoc.find ~equal:String.equal counts line with\
    \n    | None -> 0\
    \n    | Some x -> x\
    \n  in\
    \n  List.Assoc.add ~equal:String.equal counts line (count + 1)"))))
