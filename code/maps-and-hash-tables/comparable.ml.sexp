(OCaml
 (((name "")
   (content
     "module type Comparable = sig\
    \n  type t\
    \n  val sexp_of_t : t -> Sexp.t\
    \n  val t_of_sexp : Sexp.t -> t\
    \n  val compare : t -> t -> int\
    \nend"))))
