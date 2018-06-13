(OCaml
 (((name "")
   (content
     "type t =\
    \n  | Range of int * int\
    \n  | Empty\
    \n[@@deriving sexp]\
    \n\
    \nlet create x y =\
    \n  if x > y then Empty else Range (x,y)\
    \n\
    \nlet t_of_sexp sexp =\
    \n  let t = t_of_sexp sexp in\
    \n  begin match t with\
    \n    | Empty -> ()\
    \n    | Range (x,y) ->\
    \n      if y < x then of_sexp_error \"Upper and lower bound of Range swapped\" sexp\
    \n  end;\
    \n  t"))))
