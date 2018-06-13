(OCaml
 (((name "")
   (content
     "(* Module for representing closed integer intervals *)\
    \nopen Core\
    \n\
    \n(* Invariant: For any Range (x,y), y >= x *)\
    \ntype t =\
    \n  | Range of int * int\
    \n  | Empty\
    \n[@@deriving sexp]\
    \n\
    \nlet is_empty =\
    \n  function\
    \n  | Empty -> true\
    \n  | Range _ -> false\
    \n\
    \nlet create x y =\
    \n  if x > y then\
    \n    Empty\
    \n  else\
    \n    Range (x,y)\
    \n\
    \nlet contains i x =\
    \n  match i with\
    \n  | Empty -> false\
    \n  | Range (low,high) -> x >= low && x <= high"))))
