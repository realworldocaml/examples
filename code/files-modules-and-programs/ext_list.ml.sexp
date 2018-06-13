(OCaml
 (((name "")
   (content
     "open Core_kernel\
    \n\
    \n(* The new function we're going to add *)\
    \nlet rec intersperse list el =\
    \n  match list with\
    \n  | [] | [ _ ]   -> list\
    \n  | x :: y :: tl -> x :: el :: intersperse (y::tl) el\
    \n\
    \n(* The remainder of the list module *)\
    \ninclude List"))))
