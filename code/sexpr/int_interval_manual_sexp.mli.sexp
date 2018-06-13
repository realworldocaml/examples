(OCaml
 (((name "")
   (content
     "open Core\
    \n\
    \ntype t\
    \nval t_of_sexp : Sexp.t -> t\
    \nval sexp_of_t : t -> Sexp.t\
    \n\
    \nval is_empty : t -> bool\
    \nval create : int -> int -> t\
    \nval contains : t -> int -> bool"))))
