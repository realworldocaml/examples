(OCaml
 (((name "")
   (content
     "module type Sexpable = sig\
    \n  type t\
    \n  val sexp_of_t : t -> Sexp.t\
    \n  val t_of_sexp : Sexp.t -> t\
    \nend"))))
